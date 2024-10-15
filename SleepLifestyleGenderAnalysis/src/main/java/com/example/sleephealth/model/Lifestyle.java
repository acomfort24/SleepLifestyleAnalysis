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
 * Represents lifestyle-related data of a person stored in the database.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot version '3.1.2'
 * @version io.spring.dependency-management version '1.1.2'
 */
@Entity
@Table(name = "LIFESTYLE")
public class Lifestyle {

    /**
     * The unique identifier for a person's lifestyle record.
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
     * The stress level of the person.
     */
    @Column(name = "Stress_Level")
    private int stressLevel;

    /**
     * The number of daily steps taken by the person.
     */
    @Column(name = "Daily_Steps")
    private int dailySteps;

    /**
     * The level of physical activity of the person.
     */
    @Column(name = "Physical_Activity")
    private Double physicalActivity;
}
