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
 * Represents health-related data of a person stored in the database.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot version '3.1.2'
 * @version io.spring.dependency-management version '1.1.2'
 */
@Entity
@Table(name = "HEALTH")
public class Health {

    /**
     * The unique identifier for a person's health record.
     */
    @Id
    @Column(name = "Person_ID")
    private int personId;


    /**
     * The gender of the person.
     */
    @Column(name = "Gender")
    private String gender;

    /**
     * The Body Mass Index (BMI) of the person.
     */
    @Column(name = "BMI")
    private String bmi;

    /**
     * The heart rate of the person.
     */
    @Column(name = "Heart_Rate")
    private String heartRate;

    /**
     * The blood pressure reading of the person.
     */
    @Column(name = "Blood_Pressure")
    private Double bloodPressure;

}