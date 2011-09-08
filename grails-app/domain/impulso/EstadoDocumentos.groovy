package impulso

class EstadoDocumentos {

    static hasMany = [documentos:EstadoDocumento]
    
    static mapping = {
        documentos lazy:false
    }
}
