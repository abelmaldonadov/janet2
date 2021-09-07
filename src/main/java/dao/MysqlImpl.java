/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abelm
 */
public class MysqlImpl implements Driver{
    
    private static final String DRIVER = "mysql";
    private static final String HOST = "127.0.0.1";
    private static final String PORT = "3306";
    private static final String USER = "root";
    private static final String PASS = "";
    private static final String DB = "bd_tienda";
    private static final String DSN = "jdbc:"+DRIVER+"://"+HOST+":"+PORT+"/"+DB;
    
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException  ex) {
            Logger.getLogger(MysqlImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return DriverManager.getConnection(DSN, USER, PASS);
    }

    @Override
    public ArrayList<LinkedHashMap> getData(String procedure, ArrayList arrParams) throws SQLException {
        Connection conn = this.getConnection();
        String sql = "call "+procedure+"(?";
        for (int i = 1; i < arrParams.size(); i++) sql += ", ?";
        sql += ")";
        
        PreparedStatement stmt = conn.prepareCall(sql);
        for (int i = 0; i < arrParams.size(); i++) {
            stmt.setObject(i+1, arrParams.get(i));
        }
        ResultSet result = stmt.executeQuery();
        
        ResultSetMetaData meta = result.getMetaData();
        int numCols = meta.getColumnCount();
        ArrayList<LinkedHashMap> table = new ArrayList();
        while (result.next()) {
            LinkedHashMap<String, String> row = new LinkedHashMap();
            for (int i = 0; i < numCols; i++) {
                row.put(meta.getColumnName(i+1), result.getString(i+1));
            }
            table.add(row);
        }
        result.close();
        stmt.close();
        conn.close();
        System.out.println(table);
        return table;
    }

    @Override
    public ArrayList<LinkedHashMap> getData(String procedure) throws SQLException {
        Connection conn = this.getConnection();
        PreparedStatement stmt = conn.prepareCall("call "+procedure+"()");
        ResultSet result = stmt.executeQuery();
        
        ResultSetMetaData meta = result.getMetaData();
        int numCols = meta.getColumnCount();
        ArrayList<LinkedHashMap> table = new ArrayList();
        while (result.next()) {
            LinkedHashMap<String, String> row = new LinkedHashMap();
            for (int i = 0; i < numCols; i++)
                row.put(meta.getColumnName(i+1), result.getString(i+1));
            table.add(row);
        }
        result.close();
        stmt.close();
        conn.close();
        System.out.println(table);
        return table;
    }

    @Override
    public void exec(String procedure, ArrayList<String> arrParams) throws SQLException {
        Connection conn = this.getConnection();
        String sql = "call "+procedure+"(?";
        for (int i = 1; i < arrParams.size(); i++) sql += ", ?";
        sql += ")";
        
        PreparedStatement stmt = conn.prepareCall(sql);
        for (int i = 0; i < arrParams.size(); i++)
            stmt.setObject(i+1, arrParams.get(i));
        
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    @Override
    public void exec(String procedure) throws SQLException {
        Connection conn = this.getConnection();
        PreparedStatement stmt = conn.prepareCall("call "+procedure+"()");
        stmt.executeUpdate();
        
        stmt.close();
        conn.close();
    }
    
}
