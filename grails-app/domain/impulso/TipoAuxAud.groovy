package impulso

class TipoAuxAud {
    String modelo
    String descripcion
    
    //static belongsTo = [auxiliarAuditivo:AuxiliarAuditivo] 
    
    static constraints = {
        modelo(blank:false,size:2..20)
        descripcion(blank:false,size:2..400)
    }
   
}
