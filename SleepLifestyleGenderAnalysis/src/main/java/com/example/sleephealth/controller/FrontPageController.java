/**
 * Sleep, Health and Gender Study
 * Summer 2023
 */

package com.example.sleephealth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller class responsible for handling requests related to the front page of the application.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot' version '3.1.2
 * @version 'io.spring.dependency-management' version '1.1.2'
 */
@Controller
public class FrontPageController {

    /**
     * Handles a GET request to display the front page.
     *
     * @return The view name for the front page template.
     */
    @GetMapping("/front-page")
    public String frontPage() {
        return "frontpage";
    }
}