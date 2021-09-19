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
public class InventoryBean implements Serializable {
    
    private String id;
    private String storeId;
    private String storeName;
    private String productId;
    private String productName;
    private String costId;
    private String listPrice;
    private String purchaseId;
    private String stock;
    private String initialStock;
    private String minStock;
    private String notes;
    private String state;
    
    private String userIns;
    private String dateIns;
    private String hostIns;
    private String userUpd;
    private String dateUpd;
    private String hostUpd;
    
    public InventoryBean() {
    }
    
    public InventoryBean(LinkedHashMap row) {
        this.id = String.valueOf(row.get("inv_id"));
        this.storeId = String.valueOf(row.get("inv_store_id"));
        this.storeName = String.valueOf(row.get("inv_store_name"));
        this.productId = String.valueOf(row.get("inv_product_id"));
        this.productName = String.valueOf(row.get("inv_product_name"));
        this.costId = String.valueOf(row.get("inv_cost_id"));
        this.listPrice = String.valueOf(row.get("inv_cost_list_price"));
        this.purchaseId = String.valueOf(row.get("inv_purchase_id"));
        this.stock = String.valueOf(row.get("inv_stock"));
        this.initialStock = String.valueOf(row.get("inv_initial_stock"));
        this.minStock = String.valueOf(row.get("inv_min_stock"));
        this.notes = String.valueOf(row.get("inv_notes"));
        this.state = String.valueOf(row.get("inv_state"));
        
        this.userIns = String.valueOf(row.get("audi_user_ins"));
        this.dateIns = String.valueOf(row.get("audi_date_ins"));
        this.hostIns = String.valueOf(row.get("audi_host_ins"));
        this.userUpd = String.valueOf(row.get("audi_user_upd"));
        this.dateUpd = String.valueOf(row.get("audi_date_upd"));
        this.hostUpd = String.valueOf(row.get("audi_host_upd"));
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getListPrice() {
        return listPrice;
    }

    public void setListPrice(String listPrice) {
        this.listPrice = listPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getCostId() {
        return costId;
    }

    public void setCostId(String costId) {
        this.costId = costId;
    }

    public String getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(String purchaseId) {
        this.purchaseId = purchaseId;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getInitialStock() {
        return initialStock;
    }

    public void setInitialStock(String initialStock) {
        this.initialStock = initialStock;
    }

    public String getMinStock() {
        return minStock;
    }

    public void setMinStock(String minStock) {
        this.minStock = minStock;
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
