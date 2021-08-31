/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 *
 * @author abelm
 */
public interface Driver {
    public ArrayList<LinkedHashMap> getData(String procedure, ArrayList<String> arrParams) throws SQLException;
    public ArrayList<LinkedHashMap> getData(String procedure) throws SQLException;
    public void exec(String procedure, ArrayList<String> arrParams) throws SQLException;
    public void exec(String procedure) throws SQLException;
}
