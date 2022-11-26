
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
public class data 
{
    static Connection c()
    {
        Connection con=null;
       
        try
        {     
            
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/shopping1","yasir","yasir");
        }
        catch(Exception e1)
        {
            out.println(e1);
        }
     return con;
    }  
}
