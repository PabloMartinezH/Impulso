package impulso

class MedicoMilitar {
    String nombre
    String apePaterno
    String apeMaterno
    String area
    
    static constraints = {
        nombre(blank:false,size:5..70)
        apePaterno(blank:false,size:5..70)
        apeMaterno(blank:true,size:5..70)
        area(blank:false,size:5..70)
    }
}
