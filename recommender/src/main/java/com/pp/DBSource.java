package com.pp;

import java.io.IOException;
import java.sql.*;

/**
 * Created by chaorshi on 2016/7/28.
 */
public class DBSource {

    private String driver;
    private String url;
    private static DBSource instance =null;

    public DBSource() throws IOException, ClassNotFoundException {
        driver = "com.mysql.cj.jdbc.Driver";
        url = "jdbc:mysql://127.0.0.1/deal_bridge?useUnicode=true&characterEncoding=UTF-8";
        Class.forName(driver);
    }

    public static DBSource getInstance() throws IOException, ClassNotFoundException{
        if (instance==null) {
            synchronized (DBSource.class) {
                if(instance==null){
                    instance = new DBSource();
                }
            }
        }
        return instance;
    }
    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, "root", null);
    }
    public void closeAll(ResultSet rs, Statement ps, Connection conn) throws SQLException{
        closeResultSet(rs);
        closeStatement(ps);
        closeConnection(conn);
    }
    public static void closeConnection(Connection con) {
        try {
            if (con != null) {
                con.close();
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void closeStatement(Statement st) {
        try {
            if (st != null) {
                st.close();
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void closeResultSet(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
