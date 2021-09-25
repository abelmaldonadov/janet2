/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 * Contiene métodos que convierten una serie de parametros en formato URL a formato json 
 * @author amaldonado
 */
public class Request {
    
    private static String[] deco(HttpServletRequest request) {
        // Obtener parametros en una sola cadena
        InputStreamReader reader;
        String line = new String();
        try {
            reader = new InputStreamReader(request.getInputStream());
            BufferedReader br = new BufferedReader(reader);
            line = br.readLine();
        } catch (IOException ex) {
            Logger.getLogger(Request.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Reemplazar caracteres URI x caracteres ASCII
        String json = new String();
        try {
            json = URLDecoder.decode(line, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(Request.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Separar los parametors en key y content
        String[] arrJson = json.split("[=]", 2);
        
        
        return arrJson;
    }
    
    /**
     * Toma varios parametros en formato URL y los convierte a formato array asociativo
     * @param request
     * @return
     */
    public static LinkedHashMap getParameters(HttpServletRequest request) {
        // Obtener parametros en una sola cadena
        String[] arrJson;
        arrJson = deco(request);

        // Retornar linkedHashMap con los objetos recibidos
        LinkedHashMap<String, String> mapJson = new LinkedHashMap();
        for (int i = 0; i < arrJson.length; i++) {
            mapJson.put(arrJson[i], arrJson[i+1]);
            i++;
        }
        return mapJson;
    }
    
    /**
     * Toma un solo parametro en formato URL y lo convierte a formato array asociativo
     * @param request
     * @param param
     * @return
     */
    public static String getParameter(HttpServletRequest request, String param) {
        // Obtener parametros en una sola cadena
        String[] arrJson = deco(request);

        // Retornar linkedHashMap con los objetos recibidos
        LinkedHashMap<String, String> mapJson = new LinkedHashMap();
        for (int i = 0; i < arrJson.length; i++) {
            mapJson.put(arrJson[i], arrJson[i+1]);
            i++;
        }
        return mapJson.get(param);
    }
}
