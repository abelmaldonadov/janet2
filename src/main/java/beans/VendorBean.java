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
public class VendorBean implements Serializable {
    
    private String id;
    private String name;
    private String channel;
    private String phone;
    private String email;
    private String addr;
    private String deals;
    private String score;
    private String merit;
    private String notes;
    private String state;
    
    private String userIns;
    private String dateIns;
    private String hostIns;
    private String userUpd;
    private String dateUpd;
    private String hostUpd;
    
    public VendorBean() {
    }
    
    public VendorBean(LinkedHashMap row) {
        this.id = String.valueOf(row.get("ven_id"));
        this.name = String.valueOf(row.get("ven_name"));
        this.channel = String.valueOf(row.get("ven_channel"));
        this.phone = String.valueOf(row.get("ven_phone"));
        this.email = String.valueOf(row.get("ven_email"));
        this.addr = String.valueOf(row.get("ven_addr"));
        this.deals = String.valueOf(row.get("ven_deals"));
        this.score = String.valueOf(row.get("ven_score"));
        this.merit = String.valueOf(row.get("ven_merit"));
        this.notes = String.valueOf(row.get("ven_notes"));
        this.state = String.valueOf(row.get("ven_state"));
        
        this.userIns = String.valueOf(row.get("audi_user_ins"));
        this.dateIns = String.valueOf(row.get("audi_date_ins"));
        this.hostIns = String.valueOf(row.get("audi_host_ins"));
        this.userUpd = String.valueOf(row.get("audi_user_upd"));
        this.dateUpd = String.valueOf(row.get("audi_date_upd"));
        this.hostUpd = String.valueOf(row.get("audi_host_upd"));
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getDeals() {
        return deals;
    }

    public void setDeals(String deals) {
        this.deals = deals;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getMerit() {
        return merit;
    }

    public void setMerit(String merit) {
        this.merit = merit;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
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

    public String getUserUpd() {
        return userUpd;
    }

    public void setUserUpd(String userUpd) {
        this.userUpd = userUpd;
    }

    public String getDateUpd() {
        return dateUpd;
    }

    public void setDateUpd(String dateUpd) {
        this.dateUpd = dateUpd;
    }

    public String getHostUpd() {
        return hostUpd;
    }

    public void setHostUpd(String hostUpd) {
        this.hostUpd = hostUpd;
    }
    
}
