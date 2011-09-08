package impulso

import grails.plugins.springsecurity.Secured;

class CitaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 300, 300)
        
        Date date = new Date();
        java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
        String fechaActual = sdf.format(date);
        System.out.println("fechaActual: "+fechaActual)
        
        def query = "from Cita as c where "
        boolean fechaCita = false;

        if(params.nombre==null && params.fechaCita == null){
            query +=  "((c.fechaCita='"+fechaActual+"')"
            fechaCita = true
        }else {
            boolean nombre = false;
            if(!(params.nombre).isEmpty()){
                query +=  "((c.paciente.nombre like '%"+params.nombre+"%' OR c.paciente.apePaterno like '%"+params.nombre+"%')"
                nombre = true
            }
            if(!(params.fechaCita).isEmpty()) {
                fechaCita = true
                if(nombre) {
                    query +=  "and (c.fechaCita='"+params.fechaCita+"'))"
                }else {
                    query +=  "((c.fechaCita='"+params.fechaCita+"')"
                }
            }
        }
        
         query += " AND (c.oficina = '"+getOficina()+"'))"
        
        if(fechaCita) {
            query += " order by c.horaCita"
        }else {
            query += " order by c.fechaCita"
        }
        
        System.out.println("Query-buscar-citas: "+query)
        [citaInstanceList: Cita.findAll(query)]
    }

    
     def listRecepDocs = {
        params.max = Math.min(params.max ? params.int('max') : 500, 500)
        
        System.out.println("fechaCita: "+params.fechaCita)
        System.out.println("nombre: "+params.nombre)
        
        
        
        Date date = new Date();
        java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
        String fechaActual = sdf.format(date);
        System.out.println("fechaActual: "+fechaActual)
        
        def query = "from Cita as c where "
        boolean fechaCita = false;
        
         
        if(params.nombre==null && params.fechaCita == null){
            System.out.println("params.nombre==null && params.fechaCita == null")
            query +=  "(c.fechaCita='"+fechaActual+"')"
            fechaCita = true
        }else {
            boolean nombre = false;
            if(!(params.nombre).isEmpty()){
                System.out.println("!(params.nombre).isEmpty()")
                query +=  "(c.paciente.nombre like '%"+params.nombre+"%' OR c.paciente.apePaterno like '%"+params.nombre+"%')"
                nombre = true
            }
            if(!(params.fechaCita).isEmpty()) {
                System.out.println("!(params.fechaCita).isEmpty()")
                fechaCita = true
                if(nombre) {
                    query +=  "AND (c.fechaCita='"+params.fechaCita+"')"
                }else {
                    query +=  "(c.fechaCita='"+params.fechaCita+"')"
                }
            }
        }
        
        query += " AND ((c.paciente.estado.secuencia="+1+")"+
                 " OR (c.paciente.estado.secuencia="+2+")"+
                 " OR (c.paciente.estado.secuencia="+3+"))"
        query += " AND (c.status = 'PROGRAMADA')"
        query += " AND (c.oficina = '"+getOficina()+"'))"
        
        if(fechaCita) {
            query += " order by c.horaCita"
        }else {
            query += " order by c.fechaCita"
        }
        
        System.out.println("Query-buscar-citas: "+query)
        [citaInstanceList: Cita.findAll(query)]
    }
    

    def listEntregaAA = {
        System.out.println("CONTROLLER-listEntregaAA")
        params.max = Math.min(params.max ? params.int('max') : 500, 500)
        
        System.out.println("fechaCita: "+params.fechaCita)
        System.out.println("nombre: "+params.nombre)
        
        Date date = new Date();
        java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
        String fechaActual = sdf.format(date);
        System.out.println("fechaActual: "+fechaActual)
        
        def query = "from Cita as c where "
        boolean fechaCita = false;
        
         
        if(params.nombre==null && params.fechaCita == null){
            System.out.println("params.nombre==null && params.fechaCita == null")
            query +=  "((c.fechaCita='"+fechaActual+"')"
            fechaCita = true
        }else {
            boolean nombre = false;
            if(!(params.nombre).isEmpty()){
                System.out.println("!(params.nombre).isEmpty()")
                query +=  "((c.paciente.nombre like '%"+params.nombre+"%' OR c.paciente.apePaterno like '%"+params.nombre+"%')"
                nombre = true
            }
            if(!(params.fechaCita).isEmpty()) {
                System.out.println("!(params.fechaCita).isEmpty()")
                fechaCita = true
                if(nombre) {
                    query +=  "and (c.fechaCita='"+params.fechaCita+"')"
                }else {
                    query +=  "((c.fechaCita='"+params.fechaCita+"')"
                }
            }
        }
        
        query += " AND ((c.paciente.estado.secuencia="+4+") OR (c.paciente.estado.secuencia="+5+"))"
        query += " AND (c.status = 'PROGRAMADA')"
        query += " AND (c.oficina = '"+getOficina()+"'))"
        
        if(fechaCita) {
            query += " order by c.horaCita"
        }else {
            query += " order by c.fechaCita"
        }
        
        System.out.println("Query-buscar-citas: "+query)
        [citaInstanceList: Cita.findAll(query)]
    }
    
    
    def create = {
        def citaInstance = new Cita()
        citaInstance.properties = params
        return [citaInstance: citaInstance]
    }

    def save = {
        def fechaCita = params.fechaCita
        System.out.println("Params-fechaCita: "+fechaCita)
        System.out.println("Params-fechaCita-class: "+fechaCita.getClass())
        
        def citaInstance = new Cita(params)
        if (citaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cita.label', default: 'Cita'), citaInstance.id])}"
            redirect(action: "show", id: citaInstance.id)
        }
        else {
            render(view: "create", model: [citaInstance: citaInstance])
        }
    }

    def show = {
        def citaInstance = Cita.get(params.id)
        if (!citaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])}"
            redirect(action: "list")
        }
        else {
            [citaInstance: citaInstance]
        }
    }

    def edit = {
        def citaInstance = Cita.get(params.id)
        if (!citaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [citaInstance: citaInstance]
        }
    }

    def update = {
        def citaInstance = Cita.get(params.id)
        if (citaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (citaInstance.version > version) {
                    
                    citaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cita.label', default: 'Cita')] as Object[], "Another user has updated this Cita while you were editing")
                    render(view: "edit", model: [citaInstance: citaInstance])
                    return
                }
            }
            
            java.sql.Date fechaCita = java.sql.Date.valueOf(params.fechaCita)
            params.putAt("fechaCita",fechaCita)
            citaInstance.properties = params
            
            if (!citaInstance.hasErrors() && citaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cita.label', default: 'Cita'), citaInstance.id])}"
                redirect(action: "show", id: citaInstance.id)
            }
            else {
                render(view: "edit", model: [citaInstance: citaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def citaInstance = Cita.get(params.id)
        if (citaInstance) {
            try {
                citaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def programarCita = {
        System.out.println("Cita Controller - programarCita")
        System.out.println("params.idPaciente: "+params.idPaciente)
        System.out.println("params.idCita: "+params.idCita)
        System.out.println("params.secuencia: "+params.secuencia)
        
        def cita = Cita.get(params.idCita)
        def mensaje =null;
        def codigoTipoCita=null;
        
        // Se programa cita para entrega de Aux Aud
        
        if(params.razon.equals("PROGRAMACION")) {
            if(params.secuencia.equals("3")) {
                mensaje="Programar Cita para 'Entrega de Auxiliar Auditivo'."
                codigoTipoCita="ENTREGA AUXILIAR AUD"
            }else if (params.secuencia.equals("1")) {
                if(params.docsOK.equals("false")){
                    //mensaje="Se reprograma cita para entrega de Documentos ya que están Incompletos."
                    mensaje="Falta mensaje..."
                    codigoTipoCita="ENTREGA DOCS Y MOLDES"
                }else {
                    mensaje="Se programa cita para 'Entrega de Auxiliar Auditivo'."
                    codigoTipoCita="ENTREGA AUXILIAR AUD"
                }
            }
        }else if (params.razon.equals("CANCELACION")) {
            if(params.docsOK.equals("false")){
                if (params.secuencia.equals("1")) {
                    mensaje="Se reprograma cita 'Entrega de Documentos', debido a documentación incompleta."
                }else if (params.secuencia.equals("2")) {
                    mensaje="Se reprograma cita 'Entrega de Auxiliar Auditivo', debido a documentación incompleta."
                }
            }else {
                mensaje="Cancelar esta cita y re-programar otra cita."
            }
            codigoTipoCita = cita.tipoCita
            
        }
        
        System.out.println("codigoTipoCita: "+codigoTipoCita)
        
        render(view: "programarCita", 
            model: [mensaje:mensaje,
                razon:params.razon,
                tipoCita:codigoTipoCita,
                citaInstance:cita])
    }
    
    private void setFechasHoras(def params) {
        java.sql.Date fechaCita = java.sql.Date.valueOf(params.fechaCita)
        
        Calendar calendar = new GregorianCalendar();
        Date fechaActual = new Date();
        calendar.setTime(fechaActual);
        
        def hora = String.valueOf(calendar.get(Calendar.HOUR_OF_DAY))
        def minsInt = calendar.get(Calendar.MINUTE)
        def minsStr = null
        
        if(minsInt<10) {
            minsStr = "0"+String.valueOf(minsInt)
        }else {
            minsStr = String.valueOf(minsInt)
        }
        params.putAt("fechaCita",fechaCita)
        params.putAt("fechaRegistro",fechaActual)
        params.putAt("horaRegistro",hora+":"+minsStr)
    }
    
    def guardarCitaProgramada = {
        System.out.println("guardarCitaProgramada")
        System.out.println("tipoCita: "+params.tipoCita)
        
        def citaAnt = Cita.get(params.idCita)
        def citaNew = new Cita()
        def paciente = Paciente.get(params.idPaciente)
        
        // set fechaCita, fecha  y hora de registro
        setFechasHoras(params)
        // status de nueva cita
        params.putAt("status","PROGRAMADA")
        
        if(params.razon.equals("CANCELACION")) {
            //def citas = paciente.citas
            def query = "from Cita as c where c.tipoCita='"+citaAnt.tipoCita+"' and c.paciente.id='"+paciente.id+"'"
            System.out.println("query: "+query)
            def citas = Cita.findAll(query)
            
            citaNew.estadoDocumentos = citaAnt.estadoDocumentos
            
            citaAnt.status = "CANCELADA"
            citaAnt.fechaRegistro = params.fechaRegistro
            citaAnt.horaRegistro = params.horaRegistro
            params.putAt("numeroCita",new Integer(citas.size()+1))
               
        }else if (params.razon.equals("PROGRAMACION")) {
            citaAnt.status = "REALIZADA"
            params.putAt("numeroCita",new Integer(1))
            def estadoAnt = paciente.estado
            
            // El edo.secuencia = 3, es un paso antes de entrega de AuxAud
            if(estadoAnt.secuencia == 3) {
                // La cita.secuencia = 2, es la cita de entrega de AuxAud
                asociarDocumentos(citaNew,2)
            }
                        
            def secuenciaSig = estadoAnt.secuencia+1
            def query = "from Estado as e where e.secuencia="+secuenciaSig
            System.out.println("Query: "+query)
            def estado = Estado.find(query)
            paciente.estado = estado
        }

        //System.out.println("params.numeroCita: "+params.numeroCita)
        
        citaNew.fechaRegistro=params.fechaRegistro
        citaNew.horaRegistro=params.horaRegistro
        citaNew.fechaCita=params.fechaCita
        citaNew.horaCita=params.horaCita
        citaNew.tipoCita=params.tipoCita
        citaNew.status=params.status
        citaNew.numeroCita=(params.numeroCita).intValue()
        citaNew.oficina = getOficina()
        
        paciente.addToCitas(citaNew)
        paciente.addToCitas(citaAnt)
        paciente.oficina = getOficina()
        
        if(paciente.save(flush: true) ) {
            redirect(action: "show", id: citaNew.id)
        }else{
            paciente.errors.each {
                println it
            }
        }
    }

    private String getOficina() {
        System.out.println("Controller - getOficina")
        def usuario = Usuario.get(springSecurityService.principal.id)
        System.out.println("usuario: "+usuario)
        def sucursal = usuario.oficina.sucursal
        System.out.println("sucursal: "+sucursal)
        return sucursal
    }
    
    def registrarCita = {
        def tiposPaciente = TipoPaciente.list(sort:"codigo", order:"desc")
        return [tiposPaciente: tiposPaciente]
    }
    
    def verificarDocs1erCita = {
        System.out.println("Controller - verificarDocs1erCita")
        
        def citaAct = Cita.get(params.idCita)
        //def paciente = citaAct.paciente
        //def paciente = Paciente.get(params.idPaciente)
        
        //def citas = paciente.citas
        //def ultimaCita = citas.size()
        /*def query = "from Cita as c where ((c.paciente.id='"+paciente.id+"')"+
                    " and (c.tipoCita='ENTREGA DOCS Y MOLDES')"+
                    " and (c.numeroCita="+ultimaCita+"))"*/
        
        //System.out.println("query: "+query)
        //def citaAct = Cita.find(query)
        
        def edoDocs = citaAct.estadoDocumentos
        def paciente = citaAct.paciente
        def docs = edoDocs.documentos
        docs.each() {
             System.out.println("codigo: "+it.documento.codigoDoc)
             System.out.println("query: "+it.status)
        }
        
        render(view: "verificarDocs1erCita", model: [citaInstance:citaAct,pacienteInstance:paciente])
    }
    
     def verificarDocs2daCita = {
        /*System.out.println("Controller - verificarDocs2daCita")
        def paciente = Paciente.get(params.idPaciente)
        
        def citas = paciente.citas
        def ultimaCita = citas.size()
        def query = "from Cita as c where ((c.paciente.id='"+paciente.id+"')"+
                    " and (c.tipoCita='ENTREGA AUXILIAR AUD')"+
                    " and (c.numeroCita="+ultimaCita+"))"
        
        System.out.println("query: "+query)*/
        
        System.out.println("params.idCita : "+params.idCita)
        
        def citaAct = Cita.get(params.idCita)
        def paciente = citaAct.paciente
        
        System.out.println("citaAct : "+citaAct)
        System.out.println("paciente : "+paciente.estado.secuencia)
        
        def edoDocs = citaAct.estadoDocumentos
        def docs = edoDocs.documentos
        docs.each() {
             System.out.println("codigo: "+it.documento.codigoDoc)
             System.out.println("query: "+it.status)
        }
        
        render(view: "verificarDocs2daCita", model: [citaInstance:citaAct,pacienteInstance:paciente])
    }
    
    
    def guardarVerificarDocs2daCita = {
        System.out.println("Controller - guardarVerificarDocs2daCita")
        System.out.println("Docs : "+params)
        Cita cita = Cita.get(params.idCita)
        def edoDocs = cita.estadoDocumentos
        def docs = edoDocs.documentos
        docs.each() {
            def codigo = it.documento.codigoDoc
            def status = params.get(codigo)
            if (status.equals("true")){
                it.status = true
            }else if (status.equals("false")){
                it.status = false
            }
        }
        edoDocs.documentos = docs
        cita.estadoDocumentos = edoDocs
        cita.oficina = getOficina()
        
        def paciente = Paciente.get(params.idPaciente)
        def estadoAnt = paciente.estado.secuencia
        def nuevoEstado = estadoAnt+1
        def estado = Estado.find("from Estado as e where e.secuencia="+nuevoEstado)
        paciente.estado = estado
        paciente.addToCitas(cita)
        
        if(paciente.save(flush: true) ) {
             redirect(action:"listEntregaAA",params:[fechaCita:params.fechaActual,nombre:paciente.nombre])
        }else{
            paciente.errors.each {
                println it
            }
        }
        
    }
    
    def guardarVerificarDocs1erCita = {
        System.out.println("Controller - guardarVerificarDocs1erCita")
        System.out.println("Docs : "+params)
        
        Cita cita = Cita.get(params.idCita)
        def edoDocs = cita.estadoDocumentos
        def docs = edoDocs.documentos
        docs.each() {
            def codigo = it.documento.codigoDoc
            def status = params.get(codigo)
            if (status.equals("true")){
                it.status = true
            }else if (status.equals("false")){
                it.status = false
            }
        }
        
        edoDocs.documentos = docs
        cita.estadoDocumentos = edoDocs
        cita.oficina = getOficina()
        
        def paciente = Paciente.get(params.idPaciente)
        def estadoAnt = paciente.estado.secuencia
        def nuevoEstado = estadoAnt+1
        def estado = Estado.find("from Estado as e where e.secuencia="+nuevoEstado)
        paciente.estado = estado
        paciente.addToCitas(cita)
        
        if(paciente.save(flush: true) ) {
             redirect(action:"listRecepDocs",params:[fechaCita:params.fechaActual,nombre:paciente.nombre])
        }else{
            paciente.errors.each {
                println it
            }
        }
    }
    
    private void asociarDocumentos(def cita, def secCita) {
        def edoDocs = new EstadoDocumentos()
        def docs = Documento.findAll("from Documento as d where d.tipoCita.secuencia="+secCita+" order by d.ordenDoc")
        System.out.println("docs: "+docs)
        docs.each() {
            def edoDoc = new EstadoDocumento(documento:it,status:false)
            System.out.println("edoDoc.doc: "+edoDoc.documento)
            System.out.println("edoDoc.status: "+edoDoc.status)
            edoDocs.addToDocumentos(edoDoc)
        }
        
        if(edoDocs.save(flush: true) ) {
            cita.estadoDocumentos = edoDocs
        }else{
            edoDocs.errors.each {
                println it
            }
        }
    }
    
    def guardarCita = {
        System.out.println("guardarCita")
        System.out.println("params: "+params)
        
        //Crear objeto cita
        java.sql.Date fechaCita = java.sql.Date.valueOf(params.fechaCita)
        Calendar calendar = new GregorianCalendar();
        Date fechaActual = new Date();
        calendar.setTime(fechaActual);
        
        def hora = String.valueOf(calendar.get(Calendar.HOUR_OF_DAY))
        def minsInt = calendar.get(Calendar.MINUTE)
        def minsStr = null
        
        if(minsInt<10) {
            minsStr = "0"+String.valueOf(minsInt)
        }else {
            minsStr = String.valueOf(minsInt)
        }
        
        params.putAt("fechaCita",fechaCita)
        params.putAt("horaRegistro",hora+":"+minsStr)
        params.putAt("numeroCita",1)
        

        //println("idAuxAud: "+params.idAuxAud)
        
        def tipoAuxAud = TipoAuxAud.get(params.idTipoAuxAud)

        def cita = new Cita(
            fechaRegistro:fechaActual,
            horaRegistro:params.horaRegistro,
            fechaCita:params.fechaCita,
            horaCita:params.horaCita,
            tipoCita:params.tipoCita,
            status:params.status,
            numeroCita:params.numeroCita)
        
        //Cita.secuencia = 1, es la primera cita, de entrega de docs
        asociarDocumentos(cita,1)
        
        cita.oficina = getOficina()
        
        //Crear objeto paciente
        def paciente = new Paciente(nombre:params.nombre,
            apePaterno:params.apePaterno,
            apeMaterno:params.apeMaterno,
            sexo:params.sexo)
        
        def tipoPaciente = TipoPaciente.get(params.idTipoPaciente)
        
        
        def query = "from Estado as e where e.secuencia="+1
        println("query: "+query)
        def estado = Estado.find(query)
        
        paciente.estado = estado
        paciente.tipoPaciente = tipoPaciente
        paciente.tipoAuxAud = tipoAuxAud
        paciente.oficina = getOficina()
        paciente.addToCitas(cita)
        

        //Guardar objetos
        
        if(paciente.save(flush: true) ) {
            redirect(action: "show", id: cita.id)
        }else{
            paciente.errors.each {
                println it
            }
        }
    }
}
