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
public class CostBean implements Serializable {
    
    private String id;
    private String productId;
    private String product;
    private String shipping;
    private String taxes;
    private String others;
    private String unitary;
    private String listPrice;
    private String profit;
    private String selected;
    private String state;
    
    private String userIns;
    private String dateIns;
    private String hostIns;
    private String userUpd;
    private String dateUpd;
    private String hostUpd;
    
    public CostBean(){
    }
    
    public CostBean(LinkedHashMap row) {
        this.id = String.valueOf(row.get("cos_id"));
        this.productId = String.valueOf(row.get("cos_product_id"));
        this.product = String.valueOf(row.get("cos_product"));
        this.shipping = String.valueOf(row.get("cos_shipping"));
        this.taxes = String.valueOf(row.get("cos_taxes"));
        this.others = String.valueOf(row.get("cos_others"));
        this.unitary = String.valueOf(row.get("cos_unitary"));
        this.listPrice = String.valueOf(row.get("cos_list_price"));
        this.profit = String.valueOf(row.get("cos_profit"));
        this.selected = String.valueOf(row.get("cos_selected"));
        this.state = String.valueOf(row.get("cos_state"));
        
        this.userIns = String.valueOf(row.get("audi_user_ins"));
        this.dateIns = String.valueOf(row.get("audi_date_ins"));
        this.hostIns = String.valueOf(row.get("audi_host_ins"));
        this.userUpd = String.valueOf(row.get("audi_user_upd"));
        this.dateUpd = String.valueOf(row.get("audi_date_upd"));
        this.hostUpd = String.valueOf(row.get("audi_host_upd"));
    }

    public String getSelected() {
        return selected;
    }

    public void setSelected(String selected) {
        this.selected = selected;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getShipping() {
        return shipping;
    }

    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    public String getTaxes() {
        return taxes;
    }

    public void setTaxes(String taxes) {
        this.taxes = taxes;
    }

    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
    }

    public String getUnitary() {
        return unitary;
    }

    public void setUnitary(String unitary) {
        this.unitary = unitary;
    }

    public String getListPrice() {
        return listPrice;
    }

    public void setListPrice(String listPrice) {
        this.listPrice = listPrice;
    }

    public String getProfit() {
        return profit;
    }

    public void setProfit(String profit) {
        this.profit = profit;
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
