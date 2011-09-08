package impulso

class Oficina {
    String sucursal
    String direccion
    
    static hasMany = [usuarios:Usuario]
    
    static mapping = {
        usuarios lazy:false
    }
    
    static constraints = {
        sucursal(blank:false,size:2..50)
        direccion(blank:false,size:0..200)
    }
}
