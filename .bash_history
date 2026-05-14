ip a vxlan0
ip a s vxlan0
ip addr add 10.10.10.1/24 dev vxlan0
sudo ip addr add 10.10.10.1/24 dev vxlan0
ip a s vxlan0
ip a
ping 172.31.47.199
ping 172.31.36.105
ip a
ping 10.10.10.2
sudo ip link set vxlan0 up
ip a
ping 10.10.10.2
netstat -rnv
history 
ip a
ping 10.10.10.2
bridge fdb append 00:00:00:00:00:00 dev vxlan0 dst 172.31.36.105
sudo bridge fdb append 00:00:00:00:00:00 dev vxlan0 dst 172.31.36.105
ping 10.10.10.2
ip -d link show vxlan0
ping 10.10.10.2
ip a s vxlan0
ping 10.10.10.2
ip neigh show dev vxlan0
bridge fdb show dev vxlan0
ip neigh show 
bridge fdb show dev vxlan0
sudo bridge fdb delete 00:00:00:00:00:00 dev vxlan0 dst 172.31.36.105
bridge fdb show dev vxlan0
ping 10.10.10.2
bridge fdb show dev vxlan0
sudo tcpdump -i ens5 udp port 4789 -nn
top
sudo tcpdump -i ens5 udp port 4789 -nn -vv
curl 65.2.130.193:8080
echo $?
curl http://65.2.130.193:8080
netstat -an|grep 8080
curl http://65.2.130.193:8080/students
ls
cd src/
ls
cd main/
ls
cd java/
ls
cd com/
ls
cd demo/
ls
cd university/
ls
cat UniversityMonolithApplication.java 
mkdir student course enrollment auth common config
ls
vi student/Student.java
vi student/StudentRepository.java
vi student/StudentService.java
vi student/StudentController.java
curl http://65.2.130.193:8080/students
vi student/Student.java 
vi student/StudentRepository.java 
vi student/Student.java 
vi student/StudentService.java 
vi student/StudentController.java 
curl http://65.2.130.193:8080/students
curl http://65.2.130.193:8080/student
curl http://65.2.130.193:8080
curl http://65.2.130.193:8080/Student
curl http://65.2.130.193:8080/Students
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  -d '{"name":"Ashish","email":"ashish@example.com"}'
curl http://65.2.130.193:8080/students
mysql -u root -p
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  -d '{"name":"Ashish","email":"ashish@example.com"}' -v
ls
vi config/SecurityConfig.java
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  -d '{"name":"Ashish","email":"ashish@example.com"}' -v
curl http://65.2.130.193:8080/students
curl http://65.2.130.193:8080/students;echo
tree
sudo dnf install tree -y
tree
pwd
ls -l
cd course/
ls
vi Course.java
vi CourseRepository.java
vi CourseService.java
vi CourseController.java
curl -X POST http://localhost:8080/courses  -H "Content-Type: application/json"  -d '{"code":"CS101","title":"Computer Science Basics"}'
cd ..
cd enrollment/
ls
vi Enrollment.java
vi EnrollmentRepository.java
vi EnrollmentService.java
vi EnrollmentController.java
curl -X POST "http://localhost:8080/enrollments?studentId=1&courseId=1"
mysql -u root -p
cd ..
ls
cd common/
vi ApiResponse.java
cd ..
cd auth/
vi AuthController.java
curl http://localhost:8080/students
curl http://localhost:8080/courses
curl http://localhost:8080/enrollments
curl http://localhost:8080/auth/health
curl http://localhost:8080
curl http://localhost:8080/
cd
cd target/
ls
java -jar university-monolith-0.0.1-SNAPSHOT.jar 
ls -lrth
cd ..
ls -l
cd src/
ls
sudo shutdown -h now
docker ps
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl status docker
docker ps
ls -l /var/run/docker.sock 
exit
sudo dnf install docker
cat /etc/group
usermod -aG docker ec2-user
sudo usermod -aG docker ec2-user
cat /etc/group
docker ps
newgrp 
exit
docker ps
ls
cat src/main/resources/application.properties 
sudo systemctl status mariadb.service 
sudo systemctl start mariadb.service 
netstat -an|grep 3306
mysql -u root -p 
cat src/main/resources/application.properties 
cp -p src/main/resources/application.properties app.prop.back
cat app.prop.back 
vi src/main/resources/application.properties 
./mvnw clean package -DskipTests
Vi Dockerfile
vi Dockerfile
ll target/*.jar
vi Dockerfile
docker build -t university-monolith:hostdb .
docker images
hostname -I
ip route|grep default
docker run -p 8080:8080 -e SPRING_DATASOURCE_URL=jdbc:mariadb://172.31.47.199:3306/university -e SPRING_DATASOURCE_USERNAME=univuser -e SPRING_DATASOURCE_PASSWORD=password university-monolith:hostdb
curl http://localhost:8080/students
history |grep -i post
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  -d '{"name":"Ashish","email":"ashish@example.com"}'
curl http://localhost:8080/students
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  -d '{"name":"Ashish","email":"ashish@example.com"}'
curl http://localhost:8080/students
curl http://localhost:8080/courses
curl http://localhost:8080/course
curl http://localhost:8080/
curl http://localhost:8080/student
curl http://localhost:8080/students
mysqldump -u root -p university > university.sql
less university
less university.sql 
docker pull mariadb:10.5
``
docker pull mariadb:10.5
docker images
docker volume create mariadb_data
docker volumes
docker volume
docker volume ls
docker images
docker run -d --name maridb-test -p 3306:3306 -e MARIADB_ROOT_PASSWORD=redhat -e MARIADB_DATABASE=university -e MARIADB_USER=univuser -e MARIADB_PASSWORD=password -v mariadb_data:/var/lib/mysql mariadb:10.5
sudo systemctl stop mariadb
docker ps
docker ps -a
docker ps
docker ps -a
docker rm 4341999f1604
docker run -d --name maridb-test -p 3306:3306 -e MARIADB_ROOT_PASSWORD=redhat -e MARIADB_DATABASE=university -e MARIADB_USER=univuser -e MARIADB_PASSWORD=password -v mariadb_data:/var/lib/mysql mariadb:10.5
docker ps
docker exec -it 69b6cffbc779 -- bash
docker exec -it 69b6cffbc779 -- sh
docker exec -it 69b6cffbc779 sh
docker exec -it 69b6cffbc779 mysqldump -u root -P redhat university < university.sql 
docker exec -i 69b6cffbc779 mysql -u root -P redhat university < university.sql 
docker exec -i 69b6cffbc779 mysql -u root -p redhat university < university.sql 
docker exec -i 69b6cffbc779 mysqldump -u root -p redhat university < university.sql 
docker ps
docker exec -it 69b6cffbc779 sh
docker cp university.sql 69b6cffbc779:/tmp
docker exec -it 69b6cffbc779 sh
docker images
docker run   -p 8080:8080   -e SPRING_DATASOURCE_URL=jdbc:mariadb://172.17.0.2:3306/university   -e SPRING_DATASOURCE_USERNAME=univuser   -e SPRING_DATASOURCE_PASSWORD=password   university-monolith:hostdb
docker ps
docker stop 69
docker ps
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o $DOCKER_CONFIG/cli-plugins/docker-compose
mkdir docker-cli
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o docker-cli/docker-compose
cp docker-cli/docker-compose /usr/local/bin/
sudo cp docker-cli/docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose 
docker-compose version
vi docker-compose.yaml
history 
vi docker-compose.yaml
docker-compose version
vi docker-compose.yaml
docker volume ls
vi docker-compose.yaml
docker-compose up -d
docker ps
docker logs a09f902b9383
docker ps
docker-compose stop -d
docker-compose stop 
docker-compose up -d
cat docker-compose.yaml 
vi pom.xml 
./mvnw clean package -DskipTests
ls
cd src/main/java/com/demo/university/auth/
ls
vi User.java
vi UserRepository.java
cd ..
cd config/
vi PasswordConfig.java
cd ..
cd auth/
vi JwtUtil.java
vi AuthService.java
vi AuthController.java
vi JwtFilter.java
ls
locate SecurityConfig
sudo yum install mlocate
updatedb
sudo updatedb
locate SecurityConfig
cd ..
cd config/
vi SecurityConfig.java 
cd ..
cd
./mvnw clean package -DskipTests
cd -
ls
cd auth/
vi JwtUtil.java 
cd
./mvnw clean package -DskipTests
docker ps
docker-compose build 
docker-compose up -d
docker ps
docker lohs a0
docker logs a0
docker images
history |grep -i build
docker build -t university-monolith:hostdb .
docker images
docker-compose down -d
docker-compose down
docker-compose up -d
cd -
vi JwtFilter.java 
cd
./mvnw clean package -DskipTests
docker build -t university-monolith:hostdb .
docker-compose down
docker-compose up -d
cd -
vi JwtFilter.java 
cd ..
cd common/
ls
cd ..
ls
cd config/
ls
vi SecurityConfig.java 
cd
./mvnw clean package -DskipTests
docker build -t university-monolith:hostdb .
docker-compose down
docker-compose up -d
docker ps
ls
mkdir auth-service
ls
mkdir -p auth-service/src/main/java/com/demo/auth
cp -frv university-monolith/src/main/java/com/demo/university/auth/* auth-service/src/main/java/com/demo/auth/
ls -l auth-service/src/main/java/com/demo/auth/
cd auth-service/src/main/java/com/demo
ls
cd auth/
ls -l
pwd
vi AuthController.java 
vi AuthService.java 
vi JwtFilter.java 
vi JwtUtil.java 
vi User
vi User.java 
vi UserRepository.java 
pwd
rm -f JwtFilter.java 
ls
vi AuthServiceApplication.java
cd 
ls -l
cd auth-service/
ls
mvnw clean package -DskipTests
cp -p /usr/local/bin/mvnw .
ls -l
./mvnw clean package -DskipTests
cp ../university-monolith/pom.xml .
vi pom.xml 
ls
rm pom.xml 
curl -L https://start.spring.io/starter.zip   -d type=maven-project   -d language=java   -d bootVersion=3.5.0   -d groupId=com.demo   -d artifactId=auth-service   -d name=auth-service   -d packageName=com.demo.auth   -d javaVersion=21   -d dependencies=web,data-jpa,security,mariadb,lombok   -o auth-service.zip
unzip auth-service.zip 
ls -l
ll src/main/java/com/demo/auth/
./mvnw clean package -DskipTests
vi pom.xml 
./mvnw clean package -DskipTests
ls -l
ls -l target/auth-service-0.0.1-SNAPSHOT.jar
cp ../university-monolith/Dockerfile .
vi Dockerfile 
cat Dockerfile 
ls
docker build . -t auth-service:1.0
docker ps
docker images
docker run -p 8081:8080 auth-service:1.0
vi src/main/resources/application.properties 
docker images
docker build . -t auth-service:1.0
docker images
./mvnw clean package -DskipTests
docker build . -t auth-service:2.0
vi PasswordConfig.java
pwd
ls
mkdir src/main/java/com/demo/auth/config
cp -p PasswordConfig.java src/main/java/com/demo/auth/config/
ls
./mvnw clean package -DskipTests
docker build . -t auth-service:3.0
curl -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret"
TOKEN=$(
curl -X POST \
  "http://localhost:8081/auth/login?username=ashish&password=secret"
)
echo $TOKEN
curl -X POST "http://localhost:8081/auth/login?username=ashish&password=secret"
curl -X POST "http://localhost:8081/auth/login?username=ashish&password=secret" -v
curl -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret" -v
curl -v -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret"
tree
vi auth-service/src/main/java/com/demo/auth/config/SecurityConfig.java
vi src/main/java/com/demo/auth/config/SecurityConfig.java
pwd
./mvnw clean package -DskipTests
docker ps
free -m
cd university-monolith/
ls
cd ..
cd auth-service/
ls
./mvnw clean package -DskipTests
docker images
docker build . -t auth-service:4.0
ls
cd ..
cd university-monolith/
docker-compose up -d
docker ps
docker logs -f 45beb221702f
tree
cd ..
cd auth-service/
ls
tree
history |grep -i curl
curl -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret"
curl -X POST "http://localhost:8081/auth/login?username=ashish&password=secret" -v
curl -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret"-v
curl -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret" -v
curl -v -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret"
tree
tree src/
cat src/main/java/com/demo/auth/config/SecurityConfig.java 
curl -v -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret"
curl -v -X POST "http://localhost:8081/auth/register?username=ashish&password=secret"
curl -v -X POST http://localhost:8081/auth/register   -d "username=ashish"   -d "password=secret"
docker logs auth-service | grep -i "generated security password"
docker ps
docker logs 45beb221702f|grep -i "generated security password"
docker images
cd ..
cd university-monolith/
docker-compose down -d
docker-compose down
vi docker-compose.yaml 
docker-compose up -d
docker ps
curl -v -X POST http://localhost:8081/auth/register   -d "username=ashish"   -d "password=secret"
echo $?
curl -v -X POST http://localhost:8081/auth/register   -d "username=ashish"   -d "password=secret"
curl -X POST "http://localhost:8081/auth/login?username=ashish&password=secret" -v
export TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hpc2giLCJpYXQiOjE3Nzc1NDA5NDcsImV4cCI6MTc3NzU0NDU0N30.Yut_lzE44-KRIFSKwBDD-gcYdRwOhgMybn-wSLWoAPs
echo $TOKEN
history |grep -i bearer
history |grep -i students
curl -X POST "http://localhost:8081/students" -H "Authorization: Bearer $TOKEN"-v
curl -X POST "http://localhost:8080/students" -H "Authorization: Bearer $TOKEN"-v
curl -X POST "http://localhost:8081/students" -H "Authorization: Bearer $TOKEN"-v
curl -X POST "http://localhost:8080/students" -H "Authorization: Bearer $TOKEN" -v
curl -X POST "http://localhost:8081/students" -H "Authorization: Bearer $TOKEN" -v
curl -X POST http://localhost:8080/students   -H "Authorization: Bearer $TOKEN"   -H "Content-Type: application/json"   -d '{"name":"Ashish","email":"ashish@example.com"}'
curl http://localhost:8080/students   -H "Authorization: Bearer $TOKEN"
cd ..
cd auth-service/
tree
cd ..
mkdir nginx
cd nginx/
cd ..
cd university-monolith/
docker ps
docker-compose donw
docker-compose down
free -m
vi docker-compose.yaml 
realpath ../nginx/
vi docker-compose.yaml 
cat docker-compose.yaml |grep -i conf
vi ../nginx/nginx.conf
vi docker-compose.yaml 
docker-compose up -d
docker ps
curl http://localhost/students   -H "Authorization: Bearer $TOKEN"
curl http://localhost:8080/students   -H "Authorization: Bearer $TOKEN"
docker ps
docker-compose down 
cp -p docker-compose.yaml docker-compose.yaml.orig
vi docker-compose.yaml
docker-compose up -d
docker ps
cat ../nginx/nginx.conf 
docker ps
curl http://localhost:8080/students   -H "Authorization: Bearer $TOKEN"
curl http://localhost/students   -H "Authorization: Bearer $TOKEN"
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN"
echo $?
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" -v
echo "$TOKEN" | cut -d '.' -f2 | base64 -d
date +%s
curl -s http://localhost/auth/login   -d "username=ashish"   -d "password=secret"
curl -s http://localhost/auth/login/   -d "username=ashish"   -d "password=secret"
curl -s http://localhost/auth/login   -d "username=ashish"   -d "password=secret"
less ../nginx/nginx.conf 
docker ps
docker exec -it 68cec2d3453c bash
docker exec -it 68cec2d3453c sh
curl -s http://localhost/auth/login   -d "username=ashish"   -d "password=secret"
cat ../nginx/nginx.conf 
docker exec -it 68cec2d3453c sh
vi ../nginx/nginx.conf 
docker exec -it 68cec2d3453c sh
docker compose stop gateway
docker-compose stop gateway
docker-compose start gateway
docker ps
docoker ps
docker ps
docker exec -it 68cec2d3453c bash
docker exec -it 68cec2d3453c sh
curl http://localhost/auth/login -d "username=ashish" -d "password=secret"
export TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hpc2giLCJpYXQiOjE3Nzc1NDM5MjAsImV4cCI6MTc3NzU0NzUyMH0.vpi6dGH1h8fjtIoVec20K1WzjcIfm_Na8DtAW7lJTZc
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/students   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" -v
cat nginx/nginx.conf 
vi nginx/nginx.conf 
cd university-monolith/
docker ps
docker-compose restart gateway
docker ps
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" -v
cat ../nginx/nginx.conf 
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" 
echo $?
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" -v
cat ../nginx/nginx.conf 
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" -v
cat docker-compose.yaml
cat src/main/java/com/demo/university/config/SecurityConfig.java 
vi ../nginx/nginx.conf 
docker-compose restart gateway
docker ps
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN" -v
docker ps
docker exec -it 68cec2d3453c
docker exec -it 68cec2d3453c sh
TOKEN=$(curl -s http://localhost/auth/login \
  -d "username=ashish" \
  -d "password=secret")
curl -v http://localhost/students   -H "Authorization: Bearer $TOKEN"
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
docker ps
docker logs 68cec2d3453c
vi ../nginx/nginx.conf 
docker-compose restart gateway
docker ps
vi ../nginx/nginx.conf 
docker-compose down
docker-compose up -d
docker ps
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
TOKEN=$(curl -s http://localhost/auth/login \
  -d "username=ashish" \
  -d "password=secret")
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
curl -v http://localhost/students   -H "Authorization: Bearer $TOKEN"
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
cat ../nginx/nginx.conf 
vi ../nginx/nginx.conf 
docker-compose restart gateway
docker ps
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
curl -v http://localhost/students   -H "Authorization: Bearer $TOKEN"
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
vi ../nginx/nginx.conf 
docker-compose restart gateway
docker ps
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN"
cat ../nginx/nginx.conf 
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN"
docker ps
docker-compose stop
sudo shutdown -h now
docker ps
cd university-monolith/
ls -l
mkdir student-service
tar -cvzf university-monolith.tgz university-monolith
cd student-service/
ls -l
curl -L https://start.spring.io/starter.zip   -d type=maven-project   -d language=java   -d bootVersion=3.5.0   -d groupId=com.demo   -d artifactId=student-service   -d name=student-service   -d packageName=com.demo.student   -d javaVersion=21   -d dependencies=web,data-jpa,security,mariadb   -o student-service.zip
ls
unzip student-service.zip 
ls -l
cd ..
ls -l
pwd
mv student-service ../
cd ..
cd student-service/
cp -frv ../university-monolith/src/main/java/com/demo/university/student/* src/main/java/com/demo/student/
cd src/main/java/com/demo/student/
ls
rm StudentServiceApplication.java
ls
vi Student.java 
vi StudentController.java 
vi StudentRepository.java 
vi StudentService.java 
mkdir auth
cd auth/
cp -frv ~/university-monolith/src/main/java/com/demo/university/auth/Jwt* .
ls
cd ..
mkdir config
cd config/
vi SecurityConfig.java
cd ..
ls
cd pwd
pwd
cd ..
ls
cd resources/
ls
vi application.properties 
cd
cd student-service/
./mvnw clean package -DskipTests
vi src/main/java/com/demo/student/auth/JwtFilter.java 
vi src/main/java/com/demo/student/auth/JwtUtil.java 
./mvnw clean package -DskipTests
vi src/main/java/com/demo/student/auth/JwtFilter.java 
ls
mv target target.old
./mvnw clean package -DskipTests
grep -ir university *
vi src/main/java/com/demo/student/auth/JwtUtil.java
pwd
vi src/main/java/com/demo/student/auth/JwtUtil.java
grep -ir university *
./mvnw clean package -DskipTests
vi pom.xml 
./mvnw clean package -DskipTests
vi /home/ec2-user/student-service/src/main/java/com/demo/student/auth/JwtFilter.java:
vi /home/ec2-user/student-service/src/main/java/com/demo/student/auth/JwtFilter.java
./mvnw clean package -DskipTests
vi src/main/java/com/demo/student/StudentServiceApplication.java
./mvnw clean package -DskipTests
cp ../auth-service/Dockerfile .
vi Dockerfile 
docker build . -t student-service:1.0
cd ..
cd university-monolith/
vi docker-compose.yaml
cat src/main/resources/application.properties 
vi docker-compose.yaml
cd student-service/
ls
cd src/
ls
cat main/resources/application.properties 
docker ps
free -m
cd university-monolith/
cat ../nginx/nginx.conf 
vi ../nginx/nginx.conf 
docker-compose up -d
docker ps
history |grep -i curl
curl -v -X POST   "http://localhost:8081/auth/register?username=ashish&password=secret"
curl -v -X POST   "http://localhost/auth/register?username=ashish&password=secret"
curl -v -X POST http://localhost/auth/register   -d "username=ashish"   -d "password=secret"
curl -v -X POST http://localhost/auth/register   -d "username=ashish123"   -d "password=secret"
history 
history |grep -i curl
curl http://localhost/auth/login -d "username=ashish123" -d "password=secret"
export TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hpc2gxMjMiLCJpYXQiOjE3Nzc1NjMyODIsImV4cCI6MTc3NzU2Njg4Mn0.Hd-ORYJlwR5P4jfc76uvMjqixPPiIPI03XkCwvzMkbg
echo $TOKEN
curl -v http://localhost/students/   -H "Authorization: Bearer $TOKEN"
curl  http://localhost/students/   -H "Authorization: Bearer $TOKEN"
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  --H "Authorization: Bearer $TOKEN" -d '{"name":"mark","email":"mark@example.com"}
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  --H "Authorization: Bearer $TOKEN" -d '{"name":"mark","email":"mark@example.com"}'
curl -X POST http://localhost:8080/students  -H "Content-Type: application/json"  -H "Authorization: Bearer $TOKEN" -d '{"name":"mark","email":"mark@example.com"}'
curl -X POST http://localhost/students  -H "Content-Type: application/json"  -H "Authorization: Bearer $TOKEN" -d '{"name":"mark","email":"mark@example.com"}'
curl -X POST http://localhost/students/  -H "Content-Type: application/json"  -H "Authorization: Bearer $TOKEN" -d '{"name":"mark","email":"mark@example.com"}'
curl  http://localhost/students/   -H "Authorization: Bearer $TOKEN"
curl  http://localhost/students/   -H "Authorization: Bearer $TOKEN";echo
curl  http://localhost/users/   -H "Authorization: Bearer $TOKEN";echo
docker ps
docker exec -it 9253d1e3044e
docker exec -it 9253d1e304 sh
docker exec -it 9253d1e3044e
docker exec -it 9253d1e3044e sh
cat ../nginx/nginx.conf 
docker ps
docker exec -it 66b30f5ce5bd bash
docker ps
docker-compose stop university-monolith-app-1
docker stop university-monolith-app-1
docker ps
curl  http://localhost/students/   -H "Authorization: Bearer $TOKEN";echo
docker stop university-monolith-db-1
docker ps
curl  http://localhost/students/   -H "Authorization: Bearer $TOKEN";echo
cd ..
ls -l
mkdir course-service
cd course-service/
curl -L https://start.spring.io/starter.zip   -d type=maven-project   -d language=java   -d bootVersion=3.5.0   -d groupId=com.demo   -d artifactId=course-service   -d name=course-service   -d packageName=com.demo.course   -d javaVersion=21   -d dependencies=web,data-jpa,security,mariadb   -o course-service.zip
ls
unzip course-service.zip 
ls
ls -l src/main/java/com/demo/course/
cp -frv ../university-monolith/src/main/java/com/demo/university/course/* src/main/java/com/demo/course/
ls -l
cd src/main/java/com/demo/course
ls
vi Course.java 
sed -i -e 's/com.demo.university.course/com.demo.course/g' Course.java 
vi Course.java 
for i in `ls`;do sed -i -e 's/com.demo.university.course/com.demo.course/g' $i;done
ls
cat CourseServiceApplication.java 
ls
mkdir auth
cd auth/
cp ~/student-service/src/main/java/com/demo/student/auth/* .
ls
for i in `ls`;do sed -i -e 's/com.demo.university.course/com.demo.course/g' $i;done
ls
cat JwtFilter.java 
for i in `ls`;do sed -i -e 's/com.demo.student.auth/com.demo.course.auth/g' $i;done
cat JwtFilter.java |less
cd ..
mkdir config
cd config/
vi SecurityConfig.java
cd ..
vi CourseServiceApplication.java
cd ..
ls
cd main/
ls
cd resources/
ls
vi application.properties 
cd ..
vi pom.xml 
./mvnw clean package -DskipTests
cp ../auth-service/Dockerfile .
vi Dockerfile 
docker build . -t course-service:1.0
cd ..
cd university-monolith/
vi docker-compose.yaml
vi ../nginx/nginx.conf 
vi docker-compose.yaml
vi ../nginx/nginx.conf 
docker-compose up -d
vi docker-compose.yaml
docker ps
TOKEN=$(curl -s http://localhost/auth/login \
  -d "username=ashish" \
  -d "password=secret")
echo $TOKEN
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN"
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN"
vi ../nginx/nginx.conf 
vi docker-compose.yaml
vi ../nginx/nginx.conf 
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN"
curl http://localhost/courses/courses   -H "Authorization: Bearer $TOKEN"
curl http://localhost/courses/courses/   -H "Authorization: Bearer $TOKEN"
curl http://localhost/course   -H "Authorization: Bearer $TOKEN"
curl http://localhost/students   -H "Authorization: Bearer $TOKEN"
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN"
docker-compose restart gateway
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN"
docker ps
docker-compose restart gateway
docker ps
docker ps -a
docker logs 9253d1e3044e
docker ps 
docker ps -a|grep -i course
vi docker-compose.yaml
docker-compose up -d
docker ps 
docker logs 226738bcf92c
vi docker-compose.yaml
docker-compose up -d
docker ps 
curl http://localhost/students/   -H "Authorization: Bearer $TOKEN"
curl http://localhost/course   -H "Authorization: Bearer $TOKEN"
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN"
docker ps
docker logs 3671a7c4f86f
docker ps
docker logs 3671a7c4f86f
docker-compose down
docker-compose up -d
docker ps
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN"
docker ps
docker logs university-monolith-course-db-1
vi docker-compose.yaml
docker-compose up -d
docker ps
docker logs university-monolith-course-service-1
cat docker-compose.yaml
docker-compose down
vi docker-compose.yaml
docker-compose up -d
docker ps
docker logs 5e98c5800a0e
docker-compose down
docker storage ls
docker volume ls
docker volume rm university-monolith_course_db_data
docker volume ls
docker-compose up -d
docker ps
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN"
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN" -v
docker ps
TOKEN=$(curl -s http://localhost/auth/login \
  -d "username=ashish" \
  -d "password=secret")
echo $TOKEN
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/courses/courses   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN" -v
docker ps
docker logs 4f581d74e7c5
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN" -v
docker exec 4f581d74e7c5 sh
docker exec -it 4f581d74e7c5 sh
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN" -v
vi ../nginx/nginx.conf 
docker-compose restart gateway
docker ps
curl http://localhost/courses/   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" -v
vi ../nginx/nginx.conf 
docker-compose restart gateway
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" -v
cat ../nginx/nginx.conf 
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" -v
curl -X POST http://localhost/courses   -H "Authorization: Bearer $TOKEN"   -H "Content-Type: application/json"   -d '{
    "name": "Spring Boot Fundamentals",
    "description": "Intro to Spring Boot and REST APIs",
    "credits": 4
  }'

curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" -v
curl -X POST http://localhost/courses   -H "Authorization: Bearer $TOKEN"   -H "Content-Type: application/json"   -d '{
    "name": "Spring Boot Fundamentals",
    "description": "Intro to Spring Boot and REST APIs",
    "credits": 4
  }'
curl -X POST http://localhost/courses   -H "Authorization: Bearer $TOKEN"   -H "Content-Type: application/json"   -d '{
    "name": "Spring Boot Fundamentals",
    "description": "Intro to Spring Boot and REST APIs",
    "credits": 4
  }'
curl -X POST http://localhost/courses   -H "Authorization: Bearer $TOKEN"   -H "Content-Type: application/json"   -d '{
    "id": 1,
    "code": "ABC",
    "title": "Spring Boot Fundamentals"
  }'
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" -v
curl http://localhost/courses   -H "Authorization: Bearer $TOKEN" 
cd course-service/
ls
cat src/main/resources/application.properties 
docker images
docker volume ls
cd src/main/java/com/demo/
ls
cd course/
ls
vi Course.java 
vi CourseController.java 
cd
cd course-service/
ls
vi ../nginx/nginx.conf 
pwd
cat src/main/resources/application.properties 
cd ..
cd university-monolith/
docker-compose down 
docker ps
top
top
ls -l
ls -l university-monolith/
ls -l university-monolith/src/main/java/com/demo/university/
ls -l
mkdir enrollment
cd enrollment/
curl -L https://start.spring.io/starter.zip   -d type=maven-project   -d language=java   -d groupId=com.demo   -d artifactId=enrollment-service   -d name=enrollment-service   -d packageName=com.demo.enrollment   -d javaVersion=21   -d dependencies=web,data-jpa,security,mariadb   -o enrollment-service.zip
ls -l
unzip enrollment-service.zip 
ls
cd src/main/java/com/demo/enrollment/
ls
vi Enrollment.java
vi EnrollmentRepository.java
vi EnrollmentService.java
vi EnrollmentController.java
mkdir auth
cd auth/
vi JwtFilter.java
cp -p ~/student-service/src/main/java/com/demo/student/auth/Jwt* .
ls -l
vi JwtFilter.java 
vi JwtUtil.java 
cd ..
mkdir config
cd config/
vi SecurityConfig.java
cd ..
vi EnrollmentServiceApplication.java
pwd
cd ..
ls
cd ..
ls
cd resources/
ls
vi application.properties 
cd ..
ls
cd ..
cp ../student-service/Dockerfile .
vi Dockerfile 
./mvnw clean package -DskipTests
mv pom.xml pom.xml.bak
vi pom.xml
./mvnw clean package -DskipTests
vi src/main/java/com/demo/enrollment/Enrollment.java
vi src/main/java/com/demo/enrollment/EnrollmentRepository.java 
vi src/main/java/com/demo/enrollment/EnrollmentService.java 
vi src/main/java/com/demo/enrollment/EnrollmentController.java 
vi src/main/java/com/demo/enrollment/EnrollmentService
vi src/main/java/com/demo/enrollment/EnrollmentServiceApplication.java 
vi src/main/java/com/demo/enrollment/config/SecurityConfig.java 
vi src/main/java/com/demo/enrollment/auth/JwtFilter.java 
cd ..
cd enrollment/
./mvnw clean package -DskipTests
vi /home/ec2-user/enrollment/src/main/java/com/demo/enrollment/EnrollmentService.java
vi /home/ec2-user/enrollment/src/main/java/com/demo/enrollment/Enrollment.java 
./mvnw clean package -DskipTests
cat Dockerfile 
docker build . -t enrollment-service:1.0
cd .
cd ..
cd university-monolith/
ls
vi docker-compose.yaml
vi ../nginx/nginx.conf 
docker-compose up -d
history |grep -i token
export TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hpc2gxMjMiLCJpYXQiOjE3Nzc1NjMyODIsImV4cCI6MTc3NzU2Njg4Mn0.Hd-ORYJlwR5P4jfc76uvMjqixPPiIPI03XkCwvzMkbg
curl -X POST http://localhost/enrollments   -H "Authorization: Bearer $TOKEN"   --data-urlencode "studentId=1"   --data-urlencode "courseId=1"
curl http://localhost/enrollments/student/1   -H "Authorization: Bearer $TOKEN"
curl -X POST http://localhost/enrollments   -H "Authorization: Bearer $TOKEN"   --data-urlencode "studentId=1"   --data-urlencode "courseId=1" -v
history |grep -i login
curl -s http://localhost/auth/login   -d "username=ashish"   -d "password=secret"
export TOKEN=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhc2hpc2giLCJpYXQiOjE3Nzc3MTExMTksImV4cCI6MTc3NzcxNDcxOX0.4a0WRZQ-FyG14a80lAOZbojDfIGejtpJTYKNH3eXGS8
curl -X POST http://localhost/enrollments   -H "Authorization: Bearer $TOKEN"   --data-urlencode "studentId=1"   --data-urlencode "courseId=1" -v
curl http://localhost/enrollments/student/1   -H "Authorization: Bearer $TOKEN"
curl http://localhost/enrollments/student/1   -H "Authorization: Bearer $TOKEN";echo
ls
cd ..
ls -l
docker ps
cd university-monolith/
ls
cat docker-compose.yaml
vi docker-compose.yaml
cd university-monolith/
vi docker-compose.yaml
cd university-monolith/
ls
docker-compose up -d
docker ps
free -m
docker ps|grep -i jen
docker exec -it 845 bash
docker ps|grep -i jenkins
docker exec -it 845 bash
cd nginx/
vi nginx.conf 
docker-compose list
docker-compose ps
docker ps
vi ../university-monolith/docker-compose.yaml
docker-compose restart gateway
cd ..
cd university-monolith/
docker-compose restart gateway
docker ps
cat ../nginx/nginx.conf 
docker ps
docker logs gateway
docker logs db
curl localhost/jenkins
curl localhost/jenkins/
ls
echo "# spring-app" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ashishnair86/spring-app.git
git push -u origin main
