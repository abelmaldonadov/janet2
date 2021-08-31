/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package factory;

import dao.Driver;
import dao.MysqlImpl;
import static utils.Config.DB_DRIVER;

/**
 *
 * @author abelm
 */
public class DaoFactory {
    public static Driver createDao() {
        switch (DB_DRIVER) {
            case "mysql": return new MysqlImpl();
            default: return new MysqlImpl();
        }
    }
    
}
