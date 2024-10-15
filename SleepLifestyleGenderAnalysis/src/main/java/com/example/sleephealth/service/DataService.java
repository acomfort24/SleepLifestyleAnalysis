package com.example.sleephealth.service;

import com.example.sleephealth.repository.DataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataService {

    @Autowired
    private DataRepository dataRepository;
    @Autowired
    private DataRepository personRepository;

    public List<String> getAllDistinctOccupations() {
        return personRepository.getAllDistinctOccupations();
    }

    public List<String> getAllDistinctLocations() {
        return dataRepository.getAllDistinctLocations();
    }

    public List<String> getAllDistinctGenders() {
        return personRepository.findDistinctGenders();
    }

    public List<Object[]> getSleepQualityByLocationAndGender(@Nullable String gender, @Nullable String location) {
        return dataRepository.getSleepQualityByLocationAndGender(gender, location);
    }

    public List<Object[]> getSleepDisordersByOccupationAndGender(@Nullable String theGender, @Nullable String theOccupation) {
        return dataRepository.getSleepDisordersByOccupationAndGender(theGender, theOccupation);
    }

    public List<Object[]> analyzeGenderStressAndBloodPressure(@Nullable String theGender, @Nullable String theBloodPressure) {
        return dataRepository.analyzeGenderStressAndBloodPressure(theGender, theBloodPressure);
    }

    public List<Object[]> getPhysicalActivityImpactOnSleepQuality(@Nullable String theGender, @Nullable String activityStatus) {
        return dataRepository.getPhysicalActivityImpactOnSleepQuality(theGender, activityStatus);
    }
}
