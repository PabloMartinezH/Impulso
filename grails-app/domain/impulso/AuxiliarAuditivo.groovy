package impulso

class AuxiliarAuditivo {
    String marca
    
    static hasMany = [tiposAuxAud:TipoAuxAud]
    
    static mapping = {
        tiposAuxAud lazy:false
    }
    
    static constraints = {
        marca(blank:false,size:2..100,unique:true)
    }
}
