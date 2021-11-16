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
public class AuxBean implements Serializable {
    
    private String tableId = "";
    private String tableName = "";
    private String key = "";
    private String value = "";
    private String abbr = "";
    private String color = "";
    
    public AuxBean() {
    }
    
    public AuxBean(LinkedHashMap row) {
        this.tableId = String.valueOf(row.get("fie_tab_id"));
        this.tableName = String.valueOf(row.get("tab_name"));
        this.key = String.valueOf(row.get("fie_key"));
        this.value = String.valueOf(row.get("fie_value"));
        this.abbr = String.valueOf(row.get("fie_abbr"));
        this.color = String.valueOf(row.get("fie_color"));
    }

    public String getTableId() {
        return tableId;
    }

    public void setTableId(String tableId) {
        this.tableId = tableId;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getAbbr() {
        return abbr;
    }

    public void setAbbr(String abbr) {
        this.abbr = abbr;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}
