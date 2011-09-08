package impulso

class Receta {
    String folio
    String matricula 
    String caracter
    String observaciones
    Date   fechaReceta
    
    EscalonServicioSanidad escalonServSanidad
    MedicoMilitar medicoMilitar
    TipoAuxAud tipoAuxAud
    
    static mapping = {
        escalonServSanidad lazy:false
        medicoMilitar lazy:false
        tipoAuxAud lazy:false
    }
    
    static constraints = {
        caracter(blank:false,inList:["ORDINARIO","URGENTE","MUY URGENTE"])
        fechaReceta(blank:false)
        folio(blank:false,size:1..50)
        matricula(blank:false,size:1..50)
        observaciones(blank:true,size:5..200)
    }
}
