/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import java.util.LinkedHashMap;

/**
 *
 * @author abelm
 */
public class UserBean implements Serializable {
    
    private String user;
    private String name;
    private String store;
    private String role;
    private String state;
    
    private String userIns;
    private String dateIns;
    private String hostIns;
    private String userAct;
    private String dateAct;
    private String hostAct;
    
    public UserBean() {
    }
    
    public UserBean(LinkedHashMap row) {
        this.user = String.valueOf(row.get("use_user"));
        this.name = String.valueOf(row.get("use_name"));
        this.store = String.valueOf(row.get("use_store"));
        this.role = String.valueOf(row.get("use_role"));
        this.state = String.valueOf(row.get("use_state"));
        
        this.userIns = String.valueOf(row.get("audi_userIns"));
        this.dateIns = String.valueOf(row.get("audi_dateIns"));
        this.hostIns = String.valueOf(row.get("audi_hostIns"));
        this.userAct = String.valueOf(row.get("audi_userAct"));
        this.dateAct = String.valueOf(row.get("audi_dateAct"));
        this.hostAct = String.valueOf(row.get("audi_hostAct"));
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUserIns() {
        return userIns;
    }

    public void setUserIns(String userIns) {
        this.userIns = userIns;
    }

    public String getDateIns() {
        return dateIns;
    }

    public void setDateIns(String dateIns) {
        this.dateIns = dateIns;
    }

    public String getHostIns() {
        return hostIns;
    }

    public void setHostIns(String hostIns) {
        this.hostIns = hostIns;
    }

    public String getUserAct() {
        return userAct;
    }

    public void setUserAct(String userAct) {
        this.userAct = userAct;
    }

    public String getDateAct() {
        return dateAct;
    }

    public void setDateAct(String dateAct) {
        this.dateAct = dateAct;
    }

    public String getHostAct() {
        return hostAct;
    }

    public void setHostAct(String hostAct) {
        this.hostAct = hostAct;
    }
    
    
    
}
