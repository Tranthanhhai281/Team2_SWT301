/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Kieu Tri Hung
 */
public class Course {
    String id;
    String name;
    String credit;
    String fee;

    public Course() {
    }

    public Course(String id, String name, String credit, String fee) {
        this.id = id;
        this.name = name;
        this.credit = credit;
        this.fee = fee;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCredit() {
        return credit;
    }

    public String getFee() {
        return fee;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    @Override
    public String toString() {
        return "Course{" + "id=" + id + ", name=" + name + ", credit=" + credit + ", fee=" + fee + '}';
    }
    
    
    
}
