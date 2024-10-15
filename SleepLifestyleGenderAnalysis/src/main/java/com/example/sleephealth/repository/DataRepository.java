/**
 * Sleep, Health and Gender Study
 * Summer 2023
 */

package com.example.sleephealth.repository;

import com.example.sleephealth.model.Sleep;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository interface for accessing and querying sleep-related data in the database.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot version '3.1.2'
 * @version io.spring.dependency-management version '1.1.2'
 */
@Repository
public interface DataRepository extends JpaRepository<Sleep, Long> {

    /**
     * Retrieves a list of distinct occupations from the PERSON table.
     */
    @Query(nativeQuery = true, value = "SELECT DISTINCT Occupation FROM PERSON")
    List<String> getAllDistinctOccupations();

    /**
     * Retrieves a list of distinct department locations from the RESEARCHER table.
     */
    @Query(nativeQuery = true, value = "SELECT DISTINCT Dept_Location FROM RESEARCHER")
    List<String> getAllDistinctLocations();

    /**
     * Retrieves a list of distinct genders from the PERSON table.
     */
    @Query("SELECT DISTINCT p.gender FROM Person p")
    List<String> findDistinctGenders();

    /**
     * Retrieves sleep quality data by location and gender, along with average sleep quality.
     */
    @Query(nativeQuery = true, value =
            "SELECT PERSON.Gender, RESEARCHER.Dept_Location, ROUND(AVG(Sleep_Quality), 2) AS 'Avg Sleep Quality' " +
                    "FROM RESEARCHER, PERSON, SLEEP " +
                    "WHERE RESEARCHER.Researcher_ID = PERSON.Res_ID AND PERSON.Person_ID = SLEEP.Person_ID AND " +
                    "(:gender IS NULL OR PERSON.Gender = :gender) AND " +
                    "(:location IS NULL OR RESEARCHER.Dept_Location = :location) " +
                    "GROUP BY RESEARCHER.Dept_Location, PERSON.Gender")
    List<Object[]> getSleepQualityByLocationAndGender(@Param("gender") String gender, @Param("location") String location);


    /**
     * Retrieves sleep disorder data by occupation and gender, along with statistics.
     */
    @Query(nativeQuery = true, value =
            "SELECT Person.Gender, Person.Occupation, " +
                    "SUM(IF(Sleep.Sleep_Disorder <> 'None', 1, 0)) AS 'Number of People w/ Sleep Disorder', " +
                    "COUNT(Sleep.Person_ID) AS 'Total Number of People', " +
                    "CONCAT(ROUND(SUM(IF(Sleep.Sleep_Disorder <> 'None', 1, 0)) / COUNT(Sleep.Person_ID) * 100), '%') " +
                    "AS 'Percent w/ Sleep Disorder' " +
                    "FROM Person " +
                    "JOIN Sleep ON Person.Person_ID = Sleep.Person_ID " +
                    "WHERE (:gender IS NULL OR Person.Gender = :gender) " +
                    "AND (:occupation IS NULL OR Person.Occupation = :occupation) " +
                    "GROUP BY Person.Gender, Person.Occupation " +
                    "ORDER BY ROUND(SUM(IF(Sleep.Sleep_Disorder <> 'None', 1, 0)) / COUNT(Sleep.Person_ID) * 100) DESC")
    List<Object[]> getSleepDisordersByOccupationAndGender(@Param("gender") String gender, @Param("occupation") String occupation);

    /**
     * Analyzes gender, stress, and blood pressure data, including sleep-related metrics.
     */
    @Query(value =
            "SELECT " +
                    "    Person.Gender, Blood_Pressure AS 'Blood Pressure', " +
                    "    ROUND(AVG(Stress_Level), 1) AS 'Stress Level', " +
                    "    ROUND(AVG(Sleep_Duration), 1) AS 'Sleep Duration (Hours)', " +
                    "    ROUND(AVG(Sleep_Quality), 1) AS 'Sleep Quality' " +
                    "FROM " +
                    "    Person " +
                    "JOIN " +
                    "    Health ON Person.Person_ID = Health.Person_ID " +
                    "JOIN " +
                    "    Lifestyle ON Person.Person_ID = Lifestyle.Person_ID " +
                    "JOIN " +
                    "    Sleep ON Person.Person_ID = Sleep.Person_ID " +
                    "WHERE " +
                    "    (:gender IS NULL OR Person.Gender = :gender) " +
                    "AND " +
                    "    (:bloodPressure IS NULL OR Health.Blood_Pressure = :bloodPressure) " +
                    "GROUP BY " +
                    "    Person.Gender, Blood_Pressure " +
                    "ORDER BY " +
                    "    AVG(Stress_Level) DESC", nativeQuery = true)
    List<Object[]> analyzeGenderStressAndBloodPressure(@Param("gender") String gender, @Param("bloodPressure") String bloodPressure);

    /**
     * Retrieves the impact of physical activity on sleep quality by gender and activity status.
     */
    @Query(nativeQuery = true, value =
            "SELECT Lifestyle.Gender, " +
                    "CASE WHEN Physical_Activity >= 60 THEN 'Active' ELSE 'Inactive' END AS 'Activity Status', " +
                    "ROUND(AVG(Sleep_Quality), 2) AS 'Avg Sleep Quality' " +
                    "FROM Lifestyle " +
                    "JOIN Sleep ON Lifestyle.Person_ID = Sleep.Person_ID " +
                    "WHERE (:gender IS NULL OR Lifestyle.Gender = :gender) " +
                    "AND (:activityStatus IS NULL OR (CASE WHEN Physical_Activity >= 60 THEN 'Active' ELSE 'Inactive' END) = :activityStatus) " +
                    "GROUP BY Lifestyle.Gender, CASE WHEN Physical_Activity >= 60 THEN 'Active' ELSE 'Inactive' END " +
                    "ORDER BY Lifestyle.Gender")
    List<Object[]> getPhysicalActivityImpactOnSleepQuality(@Param("gender") String gender, @Param("activityStatus") String activityStatus);
}