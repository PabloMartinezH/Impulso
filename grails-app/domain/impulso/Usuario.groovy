package impulso

class Usuario extends SecUser {
    String nombre
    String empresa
    
    static belongsTo = [oficina:Oficina] 
    
    static constraints = {
        nombre(blank:false,size:5..50)
        empresa(blank:false,inList:["RDR","SEDENA","IMPULSO"])
    }
}
