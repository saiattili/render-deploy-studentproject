# Use the official Tomcat image
FROM tomcat:9.0-jre11-slim

# Clean out the default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the webapps folder as ROOT.war
COPY Student_Project.war /usr/local/tomcat/webapps/ROOT.war

# Force unzip to ensure it loads properly on Render
RUN mkdir -p /usr/local/tomcat/webapps/ROOT && \
    unzip /usr/local/tomcat/webapps/ROOT.war -d /usr/local/tomcat/webapps/ROOT

# Expose port 8080
EXPOSE 8080
CMD ["catalina.sh", "run"]
