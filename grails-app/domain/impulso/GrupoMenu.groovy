package impulso

class GrupoMenu {
    
    String nombre
    String codigo
    String ruta
    
    static hasMany = [items:ItemGrupoMenu]
        
    static constraints = {
        nombre(blank:false,size:2..30)
        codigo(blank:false,size:1..15)
        ruta(blank:true)
        
    }
}
