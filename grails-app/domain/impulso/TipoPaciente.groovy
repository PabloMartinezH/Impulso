package impulso

class TipoPaciente {
    String codigo
    String nombre
    
    static constraints = {
        codigo(blank:false,size:2..6)
        nombre(blank:false,size:2..50)
    }
}
