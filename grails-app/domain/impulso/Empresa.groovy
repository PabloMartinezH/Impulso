package impulso

class Empresa {
    String codigoEmp
    String nombreEmp

    static constraints = {
        codigoEmp(blank:false,size:2..12)
        nombreEmp(blank:false,size:4..50)
    }
}
