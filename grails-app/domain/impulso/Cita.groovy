package impulso

class Cita {
    
    Date fechaRegistro
    String horaRegistro
    
    Date fechaCita
    String horaCita
    
    Date fechaReal
    String horaReal
    
    String tipoCita
    int numeroCita
    String status
    
    String razonCancelacion

    EstadoDocumentos estadoDocumentos
    
    String oficina
    
    static belongsTo = [paciente:Paciente] 
    
    static mapping = {
        estadoDocumentos lazy:false
    }
    
    static constraints = {
        
        ArrayList<String> horas = new ArrayList<String>()
        horas.add("8:00")
        horas.add("8:30")
        horas.add("9:00")
        horas.add("9:30")
        horas.add("10:00")
        horas.add("10:30")
        horas.add("11:00")
        horas.add("11:30")
        horas.add("12:00")
        horas.add("12:30")
        horas.add("13:00")
        horas.add("13:30")
        horas.add("14:00")
        horas.add("14:30")
        horas.add("15:00")
        horas.add("15:30")
        horas.add("16:00")
        horas.add("16:30")
        horas.add("17:00")
        horas.add("17:30")
        horas.add("18:00")
        horas.add("18:30")
        horas.add("19:00")
        horas.add("19:30")
        horas.add("20:00")
        
        ArrayList<String> razones = new ArrayList<String>()
        razones.add("Falta de documentos requeridos.")
        razones.add("El paciente no llegó a la cita")
        razones.add("El paciente llegó tarde a la cita")

        
        fechaRegistro(blank:false)
        horaRegistro(blank:false)
        
        fechaCita(blank:true)
        horaCita(blank:true,inList:horas)
        
        fechaReal(nullable:true,blank:true)
        horaReal(nullable:true,blank:true)
        
        razonCancelacion(nullable:true,inList:razones)
        status(blank:false,inList:["PROGRAMADA","REALIZADA","CANCELADA"])
        tipoCita(blank:false,inList:["ENTREGA DOCS Y MOLDES","ENTREGA AUXILIAR AUD"])
        numeroCita(blank:false,range:0..10)

        oficina(nullable:true,size:2..50)
        
        estadoDocumentos(nullable:true)
    }
}
