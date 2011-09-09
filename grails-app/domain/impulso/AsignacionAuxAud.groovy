package impulso

class AsignacionAuxAud {
    
    Date fechaAsignacion
    boolean pacienteRecibeAuxAud
    String nombreRecibeAuxAud
    String nivelServicio 
    String comentarios
    boolean firmaRecibido
    EstadoChecks estadoChecks
    
    static belongsTo = [paciente:Paciente]
    
    static hasMany = [auxAudAsigns:AuxAudAsignado]
      
    static mapping = {
        estadoChecks lazy:false
        auxAudAsigns lazy:false
    }
    
    static constraints = {
        fechaAsignacion(blank:false)
        pacienteRecibeAuxAud(blank:false)
        nombreRecibeAuxAud(blank:true,size:2..200)
        firmaRecibido(blank:false)
        nivelServicio(blank:false,inList:["MUY BUENO","BUENO","REGULAR","MALO"])
        comentarios(blank:true,size:2..300)
    }
}
