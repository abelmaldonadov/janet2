/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import java.time.Instant;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 *
 * @author abelm
 */
public class InfoBean implements Serializable {
    
    private boolean prod = false; // Produccion = true, Desarrollo = false
    private String date = String.valueOf(Instant.now());
    
    private ArrayList states = new ArrayList();
    private ArrayList typeOfDocuments = new ArrayList();
    private ArrayList bool = new ArrayList();
    private ArrayList score = new ArrayList();
    private ArrayList category = new ArrayList();
    private ArrayList tags = new ArrayList();
    private ArrayList channel = new ArrayList();
    private ArrayList delivery = new ArrayList();
    
    public InfoBean() {
    }
    
    public InfoBean(ArrayList table) {
        for (Object row : table) {
            LinkedHashMap newRow = (LinkedHashMap) row;
            String id = String.valueOf(newRow.get("fie_table_id"));
            
            if (id.equals("1")) this.states.add(new AuxBean(newRow));
            else if (id.equals("2")) this.typeOfDocuments.add(new AuxBean(newRow));
            else if (id.equals("3")) this.bool.add(new AuxBean(newRow));
            else if (id.equals("4")) this.score.add(new AuxBean(newRow));
            else if (id.equals("5")) this.category.add(new AuxBean(newRow));
            else if (id.equals("6")) this.tags.add(new AuxBean(newRow));
            else if (id.equals("7")) this.channel.add(new AuxBean(newRow));
            else if (id.equals("8")) this.delivery.add(new AuxBean(newRow));
        }
    }

    public ArrayList getDelivery() {
        return delivery;
    }

    public void setDelivery(ArrayList delivery) {
        this.delivery = delivery;
    }

    public ArrayList getCategory() {
        return category;
    }

    public void setCategory(ArrayList category) {
        this.category = category;
    }

    public ArrayList getTags() {
        return tags;
    }

    public void setTags(ArrayList tags) {
        this.tags = tags;
    }

    public ArrayList getChannel() {
        return channel;
    }

    public void setChannel(ArrayList channel) {
        this.channel = channel;
    }

    public ArrayList getBool() {
        return bool;
    }

    public void setBool(ArrayList bool) {
        this.bool = bool;
    }

    public ArrayList getScore() {
        return score;
    }

    public void setScore(ArrayList score) {
        this.score = score;
    }

    public boolean isProd() {
        return prod;
    }

    public void setProd(boolean prod) {
        this.prod = prod;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public ArrayList getStates() {
        return states;
    }

    public void setStates(ArrayList states) {
        this.states = states;
    }

    public ArrayList getTypeOfDocuments() {
        return typeOfDocuments;
    }

    public void setTypeOfDocuments(ArrayList typeOfDocuments) {
        this.typeOfDocuments = typeOfDocuments;
    }
    
}
