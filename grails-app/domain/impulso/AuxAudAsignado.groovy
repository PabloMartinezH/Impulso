package impulso

class AuxAudAsignado {
    String serie
    String oido
    AuxiliarAuditivo auxAud
    TipoAuxAud tipoAuxAud
    
    static belongsTo = [asigAuxAud:AsignacionAuxAud] 
    
    static mapping = {
        auxAud lazy:false
        tipoAuxAud lazy:false
    }
    
    static constraints = {
        serie(blank:false,size:2..200)
        oido(blank:false,inList:["IZQUIERDO","DERECHO"])
        auxAud(nullable:false)
    }
}
