package impulso

class EstadoDocumento {
    Documento documento
    boolean status
    int ordenDoc
    String fechaVigencia
    
    static mapping = {
        documento lazy:false
    }
    
    static constraints = {
        ordenDoc(blank:false,range:1..20)
        status(blank:false)
        fechaVigencia(nullable:true,blank:false)
    }
    
}
