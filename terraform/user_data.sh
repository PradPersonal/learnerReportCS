#!/bin/bash
# Update and install Java
apt-get update -y
apt-get install -y openjdk-11-jdk curl gnupg

# Add Jenkins repo and install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update -y
apt-get install -y jenkins git

# Start Jenkins
systemctl start jenkins
systemctl enable jenkins

# Wait for Jenkins to initialize
sleep 30

# Install plugins via CLI
JENKINS_CLI=/var/lib/jenkins/jenkins-cli.jar
wget http://localhost:8080/jnlpJars/jenkins-cli.jar -O $JENKINS_CLI

# Get initial admin password
ADMIN_PASS=$(cat /var/lib/jenkins/secrets/initialAdminPassword)

# Install plugins (GitHub, Pipeline, etc.)
java -jar $JENKINS_CLI -s http://localhost:8080/ -auth admin:$ADMIN_PASS install-plugin \
  git github workflow-aggregator credentials-binding

# Restart Jenkins to apply plugins
java -jar $JENKINS_CLI -s http://localhost:8080/ -auth admin:$ADMIN_PASS safe-restart