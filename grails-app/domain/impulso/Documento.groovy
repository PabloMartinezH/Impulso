package impulso

class Documento {
    int    ordenDoc
    String codigoDoc
    String nombreDoc
    String caracteristicas
    
    static belongsTo = [tipoCita:TipoCita]
    
    static constraints = {
        ordenDoc(blank:false,range:1..20,unique:true)
        codigoDoc(blank:false,size:1..20,unique:true)
        nombreDoc(blank:false,size:5..50)
        caracteristicas(blank:false,size:5..100)
    }

}
