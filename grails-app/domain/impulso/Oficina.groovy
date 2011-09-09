package impulso

class Oficina {
    String sucursal
    String direccion
        
    static constraints = {
        sucursal(blank:false,size:2..50)
        direccion(blank:false,size:0..300)
    }
}
