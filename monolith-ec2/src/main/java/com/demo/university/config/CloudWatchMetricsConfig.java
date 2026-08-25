package com.demo.university.config;

import io.micrometer.cloudwatch2.CloudWatchConfig;
import io.micrometer.cloudwatch2.CloudWatchMeterRegistry;
import io.micrometer.core.instrument.Clock;
import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Metrics;
import io.micrometer.core.instrument.config.MeterFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.cloudwatch.CloudWatchAsyncClient;

import java.util.Map;

@Configuration
public class CloudWatchMetricsConfig {

    @Value("${management.metrics.export.cloudwatch.namespace:UniversityApp}")
    private String namespace;

    @Value("${management.metrics.export.cloudwatch.step:60s}")
    private String step;

    @Bean
    public CloudWatchConfig cloudWatchConfig() {
        return new CloudWatchConfig() {
            @Override
            public String get(String key) {
                return Map.of(
                    "cloudwatch.namespace", namespace,
                    "cloudwatch.step", step
                ).get(key);
            }
        };
    }

    @Bean
    public MeterRegistry meterRegistry(CloudWatchConfig config) {
        CloudWatchAsyncClient cloudWatchAsyncClient = CloudWatchAsyncClient.builder()
                .region(Region.AP_SOUTH_1)
                .build();

        CloudWatchMeterRegistry registry = new CloudWatchMeterRegistry(config, Clock.SYSTEM, cloudWatchAsyncClient);
        
        // CRITICAL FIX 1: Attaches the CloudWatch registry to Spring Boot's global monitoring facade.
        // This ensures the web request filters instantly start feeding HTTP data into it.
        Metrics.addRegistry(registry);

        // OPTIMIZATION FOR CLOUDWATCH (Highly Recommended):
        // HTTP metrics create dozens of distinct dimension variations (by URI, Status, Method).
        // This filter stops CloudWatch from generating high cardianlity bills for low-value requests.
        registry.config().meterFilter(MeterFilter.deny(id -> {
            String uri = id.getTag("uri");
            return uri != null && (uri.contains("/actuator") || uri.contains("/favicon"));
        }));

        return registry;
    }
}

