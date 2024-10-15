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
 * Represents sleep-related data of a person stored in the database.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot version '3.1.2'
 * @version io.spring.dependency-management version '1.1.2'
 */
@Entity
@Table(name = "SLEEP")
public class Sleep {

    /**
     * The unique identifier for a person's sleep record.
     */
    @Id
    @Column(name = "Person_ID")
    private Long personId;

    /**
     * The gender of the person.
     */
    @Column(name = "Gender")
    private String gender;

    /**
     * The sleep disorder status of the person.
     */
    @Column(name = "Sleep_Disorder")
    private String sleepDisorder;

    /**
     * The duration of sleep of the person.
     */
    @Column(name = "Sleep_Duration")
    private Double sleepDuration;

    /**
     * The quality of sleep of the person.
     */
    @Column(name = "Sleep_Quality")
    private Double sleepQuality;

}
