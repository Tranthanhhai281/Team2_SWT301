/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Kieu Tri Hung
 */
public class Teacher {
    String teacherId;
    String name;
    String phone;
    String discription;

    public Teacher() {
    }

   
     public Teacher(String teacherId, String name, String phone, String discription) {
        this.teacherId = teacherId;
        this.name = name;
        this.phone = phone;
        this.discription = discription; 
    }
    
    
    public String getTeacherId() {
        return teacherId;
    }

    public String getName() {
        return name;    
    }

    public String getPhone() {
        return phone;
    }

    public String getDiscription() {
        return discription;
    }

    
    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

  
    @Override
    public String toString() {
        return "Teacher{" + "teacherId=" + teacherId + ", name=" + name + ", phone=" + phone + ", discription=" + discription + '}';
    }
    
    
    
}
