/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Kieu Tri Hung
 */
public class image {
    String id;
    String type;
    String humanCode;
    String url;
    
    public image() {
    }

    public image(String id, String type, String humanCode, String url) {
        this.id = id;
        this.type = type;
        this.humanCode = humanCode;
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

  

    public String getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public String getHumanCode() {
        return humanCode;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setHumanCode(String humanCode) {
        this.humanCode = humanCode;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "image{" + "id=" + id + ", type=" + type + ", humanCode=" + humanCode + ", url=" + url + '}';
    }
    
    
    
    
}
