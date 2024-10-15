To run the project:
1. Open MySQL workbench and ensure you have a local instance at port 3306, make sure to remember your username and password.
2. Create a new schema named sleephealth.
3. Open and run the queries.sql file in MySQL workbench to create the tables and populate the database.
4. Open the SleepLifestyleGenderAnalysis folder in IntelliJ to access the project.
5. Navigate to src/main/resources/application.properties and enter the username and password of the local instance created in step 1 on lines 3 and 5.
6. Click build to allow gradle to build the project.
7. Click run application, there should be a default run configuration but if not the entry point of the application is src/main/java/com/example/sleephealth/SleepHealthApplication.java
8. In a web browser, enter http://localhost:8080/front-page in the URL bar to find the front page of the application.

This project was created using MySQL workbench, IntelliJ, and Java SpringBoot. The folders are laid out in typical Java Spring boot fashion with the model, controller, repository, and entrypoint in the src/main/java folder and the front end files found in the src/main/resources folder.
