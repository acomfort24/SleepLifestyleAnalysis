/**
 * Sleep, Health and Gender Study
 * Summer 2023
 */

package com.example.sleephealth.controller;

import com.example.sleephealth.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Controller class responsible for handling data-related requests and managing data presentation.
 * @author Caroline El Jazmi
 * @author Andy Comfort
 * @version org.springframework.boot' version '3.1.2
 * @version 'io.spring.dependency-management' version '1.1.2'
 */
@Controller
public class DataController {

    @Autowired
    private DataService myDataService;

    @Autowired
    private DataService myPersonService;

    /**
     * Handles a GET request to retrieve sleep quality data by location and gender.
     *
     * @param gender   The gender parameter (optional, can be 'male', 'female', 'both').
     * @param location The location parameter (optional).
     * @param model    The Model object for passing attributes to the view.
     * @return The view name for displaying sleep quality by location and gender.
     */
    @GetMapping("/sleep-quality-by-location-gender")
    public String getSleepQualityByLocationAndGender(
            @RequestParam(value = "gender", required = false) String gender,
            @RequestParam(value = "location", required = false) String location,
            Model model) {

        if ("both".equalsIgnoreCase(gender)) {
            gender = null; // Setting to null for both genders
        }

        model.addAttribute("data", myDataService.getSleepQualityByLocationAndGender(gender, location));
        model.addAttribute("locations", myDataService.getAllDistinctLocations());
        model.addAttribute("genders", myPersonService.getAllDistinctGenders());

        return "sleepQualityByLocationAndGender";
    }

    /**
     * Handles a GET request to retrieve sleep disorders data by occupation and gender.
     *
     * @param model      The Model object for passing attributes to the view.
     * @param gender     The gender parameter (optional, can be 'male', 'female', 'both').
     * @param occupation The occupation parameter (optional).
     * @return The view name for displaying sleep disorders by occupation and gender.
     */
    @GetMapping("/sleep-disorders-by-occupation-gender")
    public String getSleepDisordersByOccupationAndGender(Model model,
                                                         @RequestParam(value = "gender", required = false) String gender,
                                                         @RequestParam(value = "occupation", required = false) String occupation) {

        model.addAttribute("data", myDataService.getSleepDisordersByOccupationAndGender(gender, occupation));
        model.addAttribute("occupations", myPersonService.getAllDistinctOccupations());
        model.addAttribute("genders", myPersonService.getAllDistinctGenders());

        return "sleepDisordersByOccupationAndGender";
    }

    /**
     * Handles a GET request to analyze gender, stress, and blood pressure data.
     *
     * @param model         The Model object for passing attributes to the view.
     * @param gender        The gender parameter (optional, can be 'male', 'female', 'both').
     * @param bloodPressure The blood pressure parameter (optional).
     * @return The view name for displaying gender, stress, and blood pressure analysis.
     */
    @GetMapping("/gender-stress-blood-pressure-analysis")
    public String analyzeGenderStressAndBloodPressure(Model model,
                                                      @RequestParam(name="gender", required=false) String gender,
                                                      @RequestParam(name="bloodPressure", required=false) String bloodPressure) {
        // Check if gender parameter is "both" and set it to null
        if ("both".equalsIgnoreCase(gender)) {
            gender = null;
        }

        // Check if gender parameter is "both" and set it to null
        if ("both".equalsIgnoreCase(bloodPressure)) {
            bloodPressure = null;
        }

        model.addAttribute("data", myDataService.analyzeGenderStressAndBloodPressure(gender, bloodPressure));
        return "genderStressBloodPressureAnalysis";
    }

    /**
     * Handles a GET request to retrieve the impact of physical activity on sleep quality.
     *
     * @param gender        The gender parameter (optional, can be 'male', 'female', 'both').
     * @param activityStatus The activity status parameter (optional).
     * @param model         The Model object for passing attributes to the view.
     * @return The view name for displaying physical activity impact on sleep quality.
     */
    @GetMapping("/physical-activity-impact-sleep-quality")
    public String getPhysicalActivityImpactOnSleepQuality(@RequestParam(value = "gender", required = false) String gender,
                                                          @RequestParam(value = "activityStatus", required = false) String activityStatus,
                                                          Model model) {
        if ("both".equalsIgnoreCase(gender)) {
            gender = null; // Setting to null for both genders
        }
        model.addAttribute("data", myDataService.getPhysicalActivityImpactOnSleepQuality(gender, activityStatus));
        return "physicalActivityImpactOnSleepQuality";
    }

}
