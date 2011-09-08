package impulso

class EstadoCheck {
    boolean status
    CheckEntrega checkEntrega
    
    static mapping = {
        checkEntrega lazy:false
    }
    
    static constraints = {
        status(nullable:false)
    }
}
