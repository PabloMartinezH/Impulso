package impulso

class EstadoDocumento {
    Documento documento
    boolean status
    String fechaVigencia
    
    static mapping = {
        documento lazy:false
    }
    
    static constraints = {
        status(blank:false)
        fechaVigencia(nullable:true,blank:false)
    }
}
