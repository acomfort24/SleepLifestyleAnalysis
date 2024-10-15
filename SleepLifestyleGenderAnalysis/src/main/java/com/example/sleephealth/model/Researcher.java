/**
 * Sleep, Health and Gender Study
 * Summer 2023
 */

package com.example.sleephealth.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 * Represents a researcher's information stored in the database.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot version '3.1.2'
 * @version io.spring.dependency-management version '1.1.2'
 */
@Entity
@Table(name = "RESEARCHER")
public class Researcher {

    /**
     * The unique identifier for a researcher.
     */
    @Id
    @Column(name = "Researcher_ID")
    private Long researcherId;

    /**
     * The first name of the researcher.
     */
    @Column(name = "First_Name")
    private String firstName;

    /**
     * The last name of the researcher.
     */
    @Column(name = "Last_Name")
    private String lastName;

    /**
     * The department location of the researcher.
     */
    @Column(name = "Dept_Location")
    private String deptLocation;

}
