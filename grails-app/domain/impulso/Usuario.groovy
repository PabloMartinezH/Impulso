package impulso

class Usuario extends SecUser {
    String nombre
    String empresa
    Rol rol
    
    Oficina oficina
    
    static mapping = {
        rol lazy:false
        oficina lazy:false
    }
    
    static constraints = {
        nombre(blank:false,size:5..150)
        empresa(blank:false,inList:["RDR","SEDENA","IMPULSO"])
        oficina(nullable:true)
    }
}
