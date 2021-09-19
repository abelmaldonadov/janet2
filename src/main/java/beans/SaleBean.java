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
public class SaleBean implements Serializable {
    
    private String id;
    private String inventoryId;
    private String productName;
    private String unitPrice;
    private String amount;
    private String totalPrice;
    private String deliveryDate;
    private String payment;
    private String customerId;
    private String customerName;
    private String notes;
    private String state;
    
    private String userIns;
    private String dateIns;
    private String hostIns;
    private String userUpd;
    private String dateUpd;
    private String hostUpd;
    
    public SaleBean() {
    }
    
    public SaleBean(LinkedHashMap row) {
        this.id = String.valueOf(row.get("sal_id"));
        this.inventoryId = String.valueOf(row.get("sal_inventory_id"));
        this.productName = String.valueOf(row.get("sal_product_name"));
        this.unitPrice = String.valueOf(row.get("sal_unit_price"));
        this.amount = String.valueOf(row.get("sal_amount"));
        this.totalPrice = String.valueOf(row.get("sal_total_price"));
        this.deliveryDate = String.valueOf(row.get("sal_delivery_date"));
        this.payment = String.valueOf(row.get("sal_payment"));
        this.customerId = String.valueOf(row.get("sal_customer_id"));
        this.customerName = String.valueOf(row.get("sal_customer_name"));
        this.notes = String.valueOf(row.get("sal_notes"));
        this.state = String.valueOf(row.get("sal_state"));
        
        this.userIns = String.valueOf(row.get("audi_user_ins"));
        this.dateIns = String.valueOf(row.get("audi_date_ins"));
        this.hostIns = String.valueOf(row.get("audi_host_ins"));
        this.userUpd = String.valueOf(row.get("audi_user_upd"));
        this.dateUpd = String.valueOf(row.get("audi_date_upd"));
        this.hostUpd = String.valueOf(row.get("audi_host_upd"));
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(String inventoryId) {
        this.inventoryId = inventoryId;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
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
