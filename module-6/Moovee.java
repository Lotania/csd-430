package com.example.dataselect;

public class Moovee {
    private int id;
    private String movie_name;
    private String production_company;
    private int runtime_minutes;
    private int budget_USD;
    private long box_office_USD; //bigint must convert to long
    private java.sql.Date release_date;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getMovieName() { return movie_name; }
    public void setMovieName(String movie_name) { this.movie_name = movie_name; }
    public String getProductionCompany() { return production_company; }
    public void setProductionCompany(String production_company) { this.production_company = production_company; }
    public int getRuntimeMinutes() { return runtime_minutes; }
    public void setRuntimeMinutes(int runtime_minutes) { this.runtime_minutes = runtime_minutes; }
    public int getBudgetUSD() { return budget_USD; }
    public void setBudgetUSD(int budget_USD) { this.budget_USD = budget_USD; }
    public long getBoxOfficeUSD() { return box_office_USD; }
    public void setBoxOfficeUSD(long box_office_USD) { this.box_office_USD = box_office_USD; }
    public java.sql.Date getReleaseDate() { return release_date; }
    public void setReleaseDate(java.sql.Date release_date) { this.release_date = release_date; }
}
