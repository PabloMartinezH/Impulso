package impulso

class AsignacionAuxAud {
    
    Date fechaAsignacion
    boolean pacienteRecibeAuxAud
    String nombreRecibeAuxAud
    String nivelServicio 
    String comentarios
    boolean firmaRecibido
    AuxAudAsignado auxAudAsign
    EstadoChecks estadoChecks
    
    static belongsTo = [paciente:Paciente]
    
     static mapping = {
        auxAudAsign lazy:false
        estadoChecks lazy:false
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
