package impulso

class MedicoMilitar {
    String nombre
    String apePaterno
    String apeMaterno
    String area
    
    static constraints = {
        nombre(blank:false,size:2..70)
        apePaterno(blank:false,size:2..70)
        apeMaterno(blank:true,size:2..70)
        area(blank:false,size:2..70)
    }
}
