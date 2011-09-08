package impulso

class TipoCita {
    String codigo
    String nombre
    int secuencia

    static hasMany = [documentos:Documento]
    
    static mapping = {
        documentos lazy:false
    }
    
    static constraints = {
        codigo(blank:false,size:2..25)
        nombre(blank:false,size:2..100)
        secuencia(blank:false,range:1..10,unique:true)
    }
}
