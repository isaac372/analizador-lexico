
import java.io.FileInputStream;
public class Main {

    public static void main(String[] args) {
    
       // interpretar("entrada.txt");
    }
    private static void interpretar(String path) {
      
        try {
          //  pars=new analizadores.Sintactico(new analizadores.Lexico(new FileInputStream(path)));
          // pars.parse();     
        // analizadores.sample p=new analizadores.Lexico(new FileInputStream(path));
        
         // pars.parse();
        } catch (Exception ex) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println("Causa: "+ex.getCause());
        } 
    }
}
