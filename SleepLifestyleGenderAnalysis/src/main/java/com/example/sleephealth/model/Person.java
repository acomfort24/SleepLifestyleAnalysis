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
 * Represents a person's basic information stored in the database.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot version '3.1.2'
 * @version io.spring.dependency-management version '1.1.2'
 */
@Entity
@Table(name = "PERSON")
public class Person {

    /**
     * The unique identifier for a person.
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
     * The age of the person.
     */
    @Column(name = "Age")
    private int age;

    /**
     * The occupation of the person.
     */
    @Column(name = "Occupation")
    private String occupation;

    /**
     * The residence identifier of the person.
     */
    @Column(name = "Res_ID")
    private int resId;

}