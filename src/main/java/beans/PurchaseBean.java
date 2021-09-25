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
public class PurchaseBean implements Serializable {
    
    private String id;
    private String amount;
    private String productId;
    private String providerId;
    private String arrivalDate;
    private String notes;
    private String state;
    
    private String providerName;
    private String productName;
    private String unitary;
    
    private String userIns;
    private String dateIns;
    private String hostIns;
    private String userUpd;
    private String dateUpd;
    private String hostUpd;
    
    public PurchaseBean() {
    }
    
    public PurchaseBean(LinkedHashMap row) {
        this.id = String.valueOf(row.get("pur_id"));
        this.amount = String.valueOf(row.get("pur_amount"));
        this.productId = String.valueOf(row.get("pur_product_id"));
        this.providerId = String.valueOf(row.get("pur_provider_id"));
        this.arrivalDate = String.valueOf(row.get("pur_arrival_date"));
        this.notes = String.valueOf(row.get("pur_notes"));
        this.state = String.valueOf(row.get("pur_state"));
        
        this.productName = String.valueOf(row.get("pur_product_name"));
        this.providerName = String.valueOf(row.get("pur_provider_name"));
        this.unitary = String.valueOf(row.get("pur_unitary"));
        
        this.userIns = String.valueOf(row.get("audi_user_ins"));
        this.dateIns = String.valueOf(row.get("audi_date_ins"));
        this.hostIns = String.valueOf(row.get("audi_host_ins"));
        this.userUpd = String.valueOf(row.get("audi_user_upd"));
        this.dateUpd = String.valueOf(row.get("audi_date_upd"));
        this.hostUpd = String.valueOf(row.get("audi_host_upd"));
    }

    public String getUnitary() {
        return unitary;
    }

    public void setUnitary(String unitary) {
        this.unitary = unitary;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProviderName() {
        return providerName;
    }

    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProviderId() {
        return providerId;
    }

    public void setProviderId(String providerId) {
        this.providerId = providerId;
    }

    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
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
