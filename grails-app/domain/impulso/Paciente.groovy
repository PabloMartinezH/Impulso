package impulso

class Paciente {
    String nombre
    String apePaterno
    String apeMaterno
    int edad
    String sexo
    String rango
    String procedencia
    
    Direccion direccion
    TipoPaciente tipoPaciente
    Receta receta
    Estado estado
    TipoAuxAud tipoAuxAud
    AsignacionAuxAud asigAuxAud
    
    String oficina
    
    static hasMany = [telefonos:Telefono,citas:Cita]
    
    static mapping = {
        
        direccion lazy:false
        tipoPaciente lazy:false
        receta lazy:false
        estado lazy:false
        tipoAuxAud lazy:false
        asigAuxAud lazy:false
        
        telefonos lazy:false
        citas lazy:false
    }
    
    static constraints = {
        nombre(blank:false,size:3..70)
        apePaterno(blank:false,size:3..70)
        apeMaterno(nullable:true,blank:true,size:3..70)
        edad(blank:false,range:0..110)
        sexo(nullable:true,blank:false,inList:["F","M"])
        rango(nullable:true,blank:true,inList:["SARGENTO","CABO","GENERAL","TENIENTE","SOLDADO","OTRO"])
        procedencia(nullable:true,blank:true,size:5..50)
        
        direccion(nullable:true)
        tipoPaciente(nullable:false)
        receta(nullable:true)
        estado(nullable:false)
        tipoAuxAud(nullable:false)
        asigAuxAud(nullable:true)
        
        oficina(nullable:true,size:2..50)
    }
}
