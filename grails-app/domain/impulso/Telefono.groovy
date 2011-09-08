package impulso

class Telefono {
    String numero
    String lada
    String tipo

    static belongsTo = [paciente:Paciente]
    
    static constraints = {
        numero(blank:false,size:5..20)
        lada(blank:true,size:0..10)
        tipo(blank:false,inList:["CELULAR","NEXTEL","FIJO"])
    }
    
}
