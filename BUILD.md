# Build the Spring Boot scaffold

The original README describes the earlier placeholder-only stage and has been
preserved unchanged. Maven configuration and Spring Boot startup files now exist.
Member pages and data files are unchanged; application features remain future work.

## Requirements and build

Use JDK 21. Maven is downloaded by the official Maven wrapper on first use;
an installed Maven is not required. Initial builds need internet access.

From this repository in PowerShell:

```powershell
# Set this to your local JDK 21 directory if Java 21 is not the default.
$env:JAVA_HOME = 'C:\Program Files\Java\jdk-21.0.10'
.\mvnw.cmd clean package
```

On Linux/macOS with JDK 21 selected, use `sh ./mvnw clean package`.

The build produces `target/vehicle-rental-service-platform-0.0.1-SNAPSHOT.war`.
It compiles the bootstrap classes and packages the existing JSPs and static files.
No application tests have been added at this structure-only stage.

## Optional startup

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target/vehicle-rental-service-platform-0.0.1-SNAPSHOT.war
```

The executable WAR can also be deployed to a compatible external Tomcat 10.1
container running Java 21. Tomcat and Jasper use provided scope to support both
deployment modes. Spring Boot manages dependency versions, including Jakarta JSTL.

There are no controllers or page routes. A request to `/` returning 404 is expected;
JSPs under WEB-INF cannot be opened directly. View resolver properties are ready for
future controllers. No database, security, or business logic is configured.

The wrapper scripts are from Apache Maven Wrapper 3.3.4's official only-script
distribution and download Maven 3.9.11 from Maven Central. No wrapper JAR is needed.
