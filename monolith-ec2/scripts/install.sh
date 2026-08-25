#!/bin/bash
JAR=$(ls /opt/university/*.jar | head -1)
sudo cp "$JAR" /opt/university/university.jar
