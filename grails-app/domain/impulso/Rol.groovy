package impulso

class Rol extends SecRole {

     String nombre
    
    static constraints = {
         nombre(size:10..150,blank: false)
    }
}
