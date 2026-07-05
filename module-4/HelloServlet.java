package com.example.beanform;

import java.io.Serializable;

public class HelloServlet implements Serializable {
    private String name;
    private String nickname;
    private String admitted;
    private String population;
    private String landmarks;

    // Public no-argument constructor is required for JavaBeans
    public HelloServlet() {}
    //getters and setters for all 5 fields

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAdmitted() {
        return admitted;
    }
    public void setAdmitted(String admitted) {
        this.admitted = admitted;
    }

    public String getPopulation() {
        return population;
    }
    public void setPopulation(String population) {
        this.population = population;
    }

    public String getLandmarks() {
        return landmarks;
    }
    public void setLandmarks(String landmarks) {
        this.landmarks = landmarks;
    }
}