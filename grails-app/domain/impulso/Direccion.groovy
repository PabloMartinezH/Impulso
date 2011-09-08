package impulso

class Direccion {
    
    String calle
    String numExt
    String numInt
    String colonia
    String cp
    String ciudad
    String pais
    String estado
    
    static belongsTo = [paciente:Paciente]  
    
    static constraints = {
        calle(blank:false,size:5..100)
        numExt(blank:false,size:1..25)
        numInt(blank:true,size:1..25)
        colonia(blank:false,size:5..100)
        cp(blank:false,size:5..5)
        ciudad(blank:false,size:1..100)
        pais(blank:false,inList:["MEXICO"])
        estado(blank:false,inList:[
        "AGUASCALIENTES",
        "BAJA CALIFORNIA",
        "CAMPECHE",
        "CHIAPAS",
        "CHIHUAHUA",
        "COAHUILA",
        "COLIMA",
        "DISTRITO FEDERAL",
        "DURANGO",
        "GUANAJUATO",
        "GUERRERO",
        "HIDALGO",
        "JALISCO",
        "MICHOACÁN",
        "MORELOS",
        "ESTADO DE MEXICO",
        "DISTRITO FEDERAL",
        "NAYARIT",
        "NUEVO LEON",
        "OAXACA",
        "PUEBLA",
        "QUERETARO",
        "QUINTANA ROO",
        "SAN LUIS POTOSI",
        "SINALOA",
        "SONORA",
        "TABASCO",
        "TAMAULIPAS",
        "TLAXCALA",
        "VERACRUZ",        
        "ZACATECAS"])
    }
}
