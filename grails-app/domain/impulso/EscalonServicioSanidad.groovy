package impulso

class EscalonServicioSanidad {
    String codigoESS 
    String zonaMilitar
    String nombreInst
    String domicilioInst
    
    static constraints = {
        codigoESS(blank:false,size:3..30)
        zonaMilitar(blank:false,size:3..30)
        nombreInst(blank:false,size:3..90)
        domicilioInst(blank:false,size:10..100)
    }
}


