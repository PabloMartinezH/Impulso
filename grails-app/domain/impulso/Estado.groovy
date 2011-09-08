package impulso

class Estado {
    String nombre
    String boton
    int secuencia
    
    static constraints = {
        nombre(blank:false,size:1..100)
        boton(blank:false,size:1..20)
        secuencia(blank:false,range:1..20,unique:true)
    }
}
