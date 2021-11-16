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
public class AreaBean implements Serializable {
    
    private String id = "";
    private String name = "";
    private String description = "";
    private String route = "";
    private String image = "";
    private String state = "";
    
    private String notiTotal = "";
    private String notiAct = "";
    private String notiPen = "";
    private String notiIna = "";
    private String notiEli = "";
    
    public AreaBean() {
    }
    
    public AreaBean(LinkedHashMap row) {
        this.id = String.valueOf(row.get("are_id"));
        this.name = String.valueOf(row.get("are_name"));
        this.description = String.valueOf(row.get("are_description"));
        this.route = String.valueOf(row.get("are_route"));
        this.image = String.valueOf(row.get("are_image"));
        this.state = String.valueOf(row.get("are_state"));
        
        this.notiTotal = String.valueOf(row.get("total"));
        this.notiAct = String.valueOf(row.get("act"));
        this.notiPen = String.valueOf(row.get("pen"));
        this.notiIna = String.valueOf(row.get("ina"));
        this.notiEli = String.valueOf(row.get("eli"));
    }

    public String getNotiTotal() {
        return notiTotal;
    }

    public void setNotiTotal(String notiTotal) {
        this.notiTotal = notiTotal;
    }

    public String getNotiAct() {
        return notiAct;
    }

    public void setNotiAct(String notiAct) {
        this.notiAct = notiAct;
    }

    public String getNotiPen() {
        return notiPen;
    }

    public void setNotiPen(String notiPen) {
        this.notiPen = notiPen;
    }

    public String getNotiIna() {
        return notiIna;
    }

    public void setNotiIna(String notiIna) {
        this.notiIna = notiIna;
    }

    public String getNotiEli() {
        return notiEli;
    }

    public void setNotiEli(String notiEli) {
        this.notiEli = notiEli;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    
}
