package impulso

class CheckEntrega {
    String descripcion
    int secuencia
    boolean necesario
    static constraints = {
        secuencia(blank:false,unique:true)
        descripcion(blank:false,size:2..200)
        necesario(blank:false)
    }
}
