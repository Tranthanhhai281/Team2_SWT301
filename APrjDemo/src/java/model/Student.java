/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Kieu Tri Hung
 */
public class Student {
    String id;
    String name;
    String DoB;
    String username;
    String password;

    public Student() {
    }

    public Student(String id, String name, String DoB, String username, String password) {
        this.id = id;
        this.name = name;
        this.DoB = DoB;
        this.username = username;
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDoB() {
        return DoB;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDoB(String DoB) {
        this.DoB = DoB;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + name + ", DoB=" + DoB + ", username=" + username + ", password=" + password + '}';
    }
 
    
    
}
