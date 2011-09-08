package impulso

class EstadoChecks {
    static hasMany = [checks:EstadoCheck]
    
    static belongsTo = [asigAuxAud:AsignacionAuxAud] 
    
    static mapping = {
        checks lazy:false
    }
}
