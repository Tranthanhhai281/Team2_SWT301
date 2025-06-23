/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Kieu Tri Hung
 */
public class Form {
    String formId;
    String userIdRe;
    String userIdSe;
    String typeOfForm;
    String reason;

    public Form() {
    }

    public Form(String formId, String userIdRe, String userIdSe, String typeOfForm, String reason) {
        this.formId = formId;
        this.userIdRe = userIdRe;
        this.userIdSe = userIdSe;
        this.typeOfForm = typeOfForm;
        this.reason = reason;
    }

    public String getFormId() {
        return formId;
    }

    public String getUserIdRe() {
        return userIdRe;
    }

    public String getUserIdSe() {
        return userIdSe;
    }

    public String getTypeOfForm() {
        return typeOfForm;
    }

    public String getReason() {
        return reason;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public void setUserIdRe(String userIdRe) {
        this.userIdRe = userIdRe;
    }

    public void setUserIdSe(String userIdSe) {
        this.userIdSe = userIdSe;
    }

    public void setTypeOfForm(String typeOfForm) {
        this.typeOfForm = typeOfForm;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "Form{" + "formId=" + formId + ", userIdRe=" + userIdRe + ", userIdSe=" + userIdSe + ", typeOfForm=" + typeOfForm + ", reason=" + reason + '}';
    }
    
    
    
}
