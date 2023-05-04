import java.sql.*;

public class jc_mariadb {


    /* Declaramos 4 variables con el driver, la bbdd, usuario y contraseña*/
    private static final String driver="org.mariadb.jdbc.Driver";
    private static final String bbdd="jdbc:mariadb://192.168.209.235:3306/mariadb";
    private static final String usuario ="jblasco";
    private static final String clave="Naci24";
    /* Creamos el método para conectarnos a la base de datos. Este método devolverá un objeto de tipo Connection.*/
    public static Connection Conexion(){
        /*Declaramos una variable para almacenar la cadena de conexión.  Primero la iniciamos en null.*/
        Connection conex = null;
        Statement st = null;
        String sentenciaSQL = null;
        ResultSet rs = null;

        //Controlamos la excepciones que puedan surgir al conectarnos a la BBDD
        try {
            //Registrar el driver
            //Class.forName(driver);
            //MongoClient mongoClient = new MongoClient();

            //Creamos una conexión a la Base de Datos

            conex = DriverManager.getConnection(bbdd, usuario, clave);

            // conex = DriverManager.getConnection("jdbc:mariadb://localhost:3306/labdb?user=root&password=eeupqtc,10");

            // Si hay errores informamos al usuario.

            st = conex.createStatement();

            sentenciaSQL = "SELECT * FROM Usuarios";
            rs = st.executeQuery(sentenciaSQL);

            while (rs.next()) {
                System.out.print(rs.getString(1) + "\t");
                System.out.print(rs.getString(2) + "\t");
            }

        } catch (Exception e) {
            System.out.println("Error al conectar con la base de datos.\n" + e.getMessage().toString());
        }
        // Devolvemos la conexión.
        return conex;
    }
    public static void cerrarConexion(Connection conex){
        try{
            // Cerramos la conexión
            conex.close();
        }catch(SQLException e){
            /* Controlamos excepción en caso de que se pueda producira la hora de cerrar la conexión*/
            System.out.println(e.getMessage().toString());
        }
    }
    public static void main(String[] args) {
        /*Declaramos una variable para almacenar la conexión que nos va a devolver el método Conexion(). Primero la iniciamos en null.*/
        Connection conex=null;
        /*Almacenamos lo que nos devuelve el método Conexion() en la variable conex*/
        conex = Conexion();
        // Si la variable objeto conex es diferente de nulo
        if(conex != null){
            // Informamos que la conexión es correcta
            System.out.println("Conectado correctamente");
            cerrarConexion(conex);
        }else{ // Sino informamos que no nos podemos conectar.
            System.out.println("No has podido conectarte");
        }
    }
}
