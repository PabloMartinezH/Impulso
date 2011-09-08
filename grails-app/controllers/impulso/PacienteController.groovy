package impulso

class PacienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.int('max') : 100, 100)
        /*println("list paciente")
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pacienteInstanceList: Paciente.list(params)]*/
        
        
        def query = "from Paciente as p where p.oficina='"+getOficina()+"'"
        println("list query: "+query)
        def pacientes = Paciente.findAll(query)
        [pacienteInstanceList: pacientes] 
    }
    
    
    def listExped = {
        //params.max = Math.min(params.max ? params.int('max') : 100, 100)
        /*println("list paciente")
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pacienteInstanceList: Paciente.list(params)]*/
        
        
        /*def query = "from Paciente as p where p.oficina='"+getOficina()+"'"
        println("list query: "+query)
        def pacientes = Paciente.findAll(query)*/
        def pacientes = Paciente.list()
        [pacienteInstanceList: pacientes] 
    }

    def create = {
        def pacienteInstance = new Paciente()
        pacienteInstance.properties = params
        return [pacienteInstance: pacienteInstance]
    }

    def completarInfo = {
       System.out.println("params.idPaciente: "+params.idPaciente)
       return [pacienteInstance: Paciente.get(params.idPaciente)]
    }
    
    
    def guardarInfoCompleta = {
        
        def direccion = new Direccion(
        calle:params.calle,
        numExt:params.numExt,
        numInt:params.numInt,
        colonia:params.colonia,
        cp:params.cp,
        ciudad:params.ciudad,
        estado:params.estado,
        pais:params.pais)
        
        def medicoMiliar = new MedicoMilitar(
            nombre:params.nombreMM,
            apePaterno:params.apePaternoMM,
            apeMaterno:params.apeMaternoMM,
            area:params.areaMM)
        
        if(!medicoMiliar.save(flush: true) ) {
            medicoMiliar.errors.each {
                println it
            }
        }
        
        
        def tipoAuxAud = TipoAuxAud.get(params.idTipoAuxAud)
        def escSerSan = EscalonServicioSanidad.get(params.idEscSerSan)
        
        System.out.println("params-receta:"+params)
        
        java.sql.Date fechaReceta = java.sql.Date.valueOf(params.fechaReceta)
        params.putAt("fechaReceta",fechaReceta)
        
        
        def receta = new Receta(
        fechaReceta:params.fechaReceta,
        folio:params.folio,
        matricula:params.matricula,
        caracter:params.caracter,
        tipoAuxAud:tipoAuxAud,
        escalonServSanidad:escSerSan,
        medicoMilitar:medicoMiliar,
        observaciones:params.observaciones)
        
        if(!receta.save(flush: true) ) {
            receta.errors.each {
                println it
            }
        }
        
        def tipoPaciente = TipoPaciente.get(params.idTipoPaciente)
        // Pasa al siguiente estado - ENTREGA DE AUX AUD
        def estado = Estado.find("from Estado as e where e.secuencia="+3)
        System.out.println("params.idPaciente: "+params.idPaciente)
        
        //Crear objeto paciente
        def paciente = Paciente.get(params.idPaciente)
        paciente.nombre = params.nombre
        paciente.apePaterno = params.apePaterno
        paciente.apeMaterno = params.apeMaterno
        paciente.sexo = params.sexo
        paciente.edad = Integer.parseInt(params.edad)
        paciente.rango = params.rango
        paciente.estado = estado
        paciente.tipoPaciente = tipoPaciente
        paciente.direccion = direccion
        paciente.receta = receta
        paciente.tipoAuxAud = tipoAuxAud
        paciente.oficina = getOficina()
        
        if(paciente.save(flush: true) ) {
            redirect(controller:"cita",action:"listRecepDocs")
        }else{
            paciente.errors.each {
                println it
            }
        }
        
    }
    
    def documentarEntregaAA = {
       def cita = Cita.get(params.idCita) 
       def paciente = Paciente.get(cita.paciente.id) 
        
       java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd , hh:mm a")
       Date date = new Date() 
       String fechaActual = sdf.format(date)
       
       def auxsAuditivos = AuxiliarAuditivo.list(sort:"marca", order:"desc")
       def asigAuxAud = new AsignacionAuxAud() 
       def auxAudAsignado = new AuxAudAsignado()
        
       render(view: "documentarEntregaAA", 
           model: [fechaActual:fechaActual,
               asigAuxAudInstance:asigAuxAud,
               auxAudAsignadoInstance:auxAudAsignado,
                auxsAuditivosInstance:auxsAuditivos,
                 pacienteInstance:paciente,
                 citaInstance:cita])
    }
    
    def guardarDocumentarEntregaAA = {
        System.out.println("Controller - guardarDocumentarEntregaAA")
        System.out.println("params : "+params)
      
        def paciente = Paciente.get(params.idPaciente)
        def cita = Cita.get(params.idCita)
        def tipoAuxAud = TipoAuxAud.get(params.idTipoAuxAud)
        def auxAud = AuxiliarAuditivo.get(params.idAuxAud)
        

        // Crear objeto AsignacionAuxAud
        def fechaAsignacion = new Date()
        def pacienteRecibeAuxAud = null
        def nombreRecibeAuxAud = null
        if (params.pacienteRecibe.equals("true")) {
            pacienteRecibeAuxAud = true
            nombreRecibeAuxAud = params.nombreRecibe
        }else {
            pacienteRecibeAuxAud = false
            nombreRecibeAuxAud = ""
        }
        def nivelServicio = params.nivelServicio
        def comentarios = params.comentarios
        def firmaRecibido = null
        if(params.firmaRecibido.equals("true")) {
            firmaRecibido = true
            
        }else {
            firmaRecibido = false;
        }
        def asigAuxAud = new AsignacionAuxAud(
            fechaAsignacion:fechaAsignacion,
            pacienteRecibeAuxAud:pacienteRecibeAuxAud,
            nombreRecibeAuxAud:nombreRecibeAuxAud,
            firmaRecibido:firmaRecibido,
            nivelServicio:nivelServicio,
            comentarios:comentarios) 
                
        def checks = CheckEntrega.list(sort:"secuencia", order:"asc")
        def estadoChecks = new EstadoChecks()
        
         checks.each() {
             System.out.println("secuencia: "+it.secuencia)
             //def secuencia = Integer.parseInt(it.secuencia)
             def status = params.get(it.secuencia)
             def estadoCheck = new EstadoCheck(status:status)
             estadoCheck.checkEntrega = it
             estadoChecks.addToChecks(estadoCheck)
         }
        

        // Crear objeto AuxAudAsignado
        def serie = params.noSerie
        def oido = params.oido
        def auxAudAsign = new AuxAudAsignado(
            serie:serie,
            oido:oido,
            auxAud:auxAud,
            tipoAuxAud:tipoAuxAud)
        
        System.out.println("auxAudAsign: "+auxAudAsign)
        
        asigAuxAud.auxAudAsign = auxAudAsign
        asigAuxAud.estadoChecks = estadoChecks
        
        System.out.println("asigAuxAud: "+asigAuxAud)
         if(!asigAuxAud.save(flush: true) ) {
            asigAuxAud.errors.each {
                println it
            }
        }
        
        def estadoAnt = paciente.estado
        def secuenciaSig = estadoAnt.secuencia+1
            def query = "from Estado as e where e.secuencia="+secuenciaSig
            System.out.println("Query: "+query)
        def estado = Estado.find(query)
        paciente.estado = estado
        
        setFechasHoras(params)
        cita.status = "REALIZADA"
        cita.fechaRegistro = params.fechaRegistro
        cita.horaRegistro = params.horaRegistro
        
        paciente.addToCitas(cita)
        if(!paciente.save(flush: true) ) {
            paciente.errors.each {
                println it
            }
        }
        
        redirect(action: "list")
    }
   
     private void setFechasHoras(def params) {
        
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
        params.putAt("fechaRegistro",fechaActual)
        params.putAt("horaRegistro",hora+":"+minsStr)
    }
    

    def save = {
        def pacienteInstance = new Paciente(params)
        if (pacienteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paciente.label', default: 'Paciente'), pacienteInstance.id])}"
            redirect(action: "show", id: pacienteInstance.id)
        }
        else {
            render(view: "create", model: [pacienteInstance: pacienteInstance])
        }
    }

    def show = {
        def pacienteInstance = Paciente.get(params.id)
        if (!pacienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pacienteInstance: pacienteInstance]
        }
    }

    def edit = {
        def pacienteInstance = Paciente.get(params.id)
        if (!pacienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pacienteInstance: pacienteInstance]
        }
    }

    def update = {
        def pacienteInstance = Paciente.get(params.id)
        if (pacienteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pacienteInstance.version > version) {
                    
                    pacienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paciente.label', default: 'Paciente')] as Object[], "Another user has updated this Paciente while you were editing")
                    render(view: "edit", model: [pacienteInstance: pacienteInstance])
                    return
                }
            }
            pacienteInstance.properties = params
            if (!pacienteInstance.hasErrors() && pacienteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paciente.label', default: 'Paciente'), pacienteInstance.id])}"
                redirect(action: "show", id: pacienteInstance.id)
            }
            else {
                render(view: "edit", model: [pacienteInstance: pacienteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pacienteInstance = Paciente.get(params.id)
        if (pacienteInstance) {
            try {
                pacienteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def altaExpediente = {
        
    }
    
    
    private String getOficina() {
        def usuario = Usuario.get(springSecurityService.principal.id)
        return usuario.oficina.sucursal
    }
}
