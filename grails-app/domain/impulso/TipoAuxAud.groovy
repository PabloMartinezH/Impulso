package impulso

class TipoAuxAud {
    String modelo
    String nombre
    
    //static belongsTo = [auxiliarAuditivo:AuxiliarAuditivo] 
    
    static constraints = {
        modelo(blank:false,size:2..20)
        nombre(blank:false,size:2..200)
    }
   
}
