# mule4-skeleton-system-api
This is a Mule 4.x example of an API using API Management that can be used as a starting point for building system APIs in Mule 4.x. 


## Uses

The project contains examples using:


* The secure property connector (formally called the secure-property-placeholder),
* Maven deployment using the mule-maven-plugin descriptor,
* Api Manager gateway auto-discovery registration,
* Using the Maven filter "feature" to add Maven properties to code in files stored in the resources-filtered directory...specifically, updating the api.base and log4j2 configurations with the project name.

## Purpose

This project is an example that can be deployed and will run when properly configured. However, the main usage for this is a starting point for building new APIs.
Developers of an API can copy this project to get all the "boilerplate" elements for an API project. Then begin adding and modifying these elements to create the new API. 

### Configuration Properties

The configuration properties are stored in the src/main/resources-filtered/env-${mule.env}.yaml file:

* api.id contains the Api Manager instance's autodiscovery api id,
* api.base is the base uri for the API,
* http.listener.port is the port number of the Api's HTTP listener in VPC,
* my.client-id is the client id this API uses to call other APIs
* my.client-secret is the client secret registered for this API to use for calling other APIs



## Runtime properties

The properties mule.env and mule.key need to be set in the Mule runtime in order for the property configurations to be located. Additionally, if the Mule runtime is not configured to connect to API Manager, the API will be disabled (by default).

For Studio, add the following VM argument values when running the API:

 -Danypoint.platform.gatekeeper=disabled -Dmule.env=dev -Dmule.key=Mulesoft12345678

## Maven Settingss

The Mule deployment assumes that certain deployment properties will come from profiles specified when the mvn command is executed. This is a standard feature of Maven and is described in its online documentation.  Then use this maven command to deploy the API project:
Example to deploy to a development environment the command would be
```

mvn clean install  deploy -DmuleDeploy -P DEV  -Dmule.key=Mulesoft12345678 -Dworkers=1 -DworkerType=MICRO -Danypoint.userName=<xxx> -Danypoint.password=<xxx> 


```
Replacing the xxx's with the appropriate values. Where

   - anypoint.userName is the username for Anypoint platform
   - anypoint.password is the password for the Anypoint account


Also adjust workers and worker type based on application requirements.

Ps: Usually the builds are packaged by CI/CD team by integrating with Maven.

