package impulso

import grails.plugins.springsecurity.Secured;

class PacienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    @Secured(['ROLE_ADMIN_IM','ROLE_OPERA_IM','ROLE_OPERA_P','ROLE_SUPER_P','ROLE_CONSUL_S','IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
        /*def tiposPaciente = TipoPaciente.list(sort:"codigo", order:"desc")
        def oficinas = Oficina.list(sort:"sucursal", order:"desc")
        render(view: "list", model: [tiposPaciente:tiposPaciente,oficinas:oficinas,params:params])*/
    }

    @Secured(['ROLE_ADMIN_IM','ROLE_OPERA_IM','ROLE_OPERA_P','ROLE_SUPER_P','ROLE_CONSUL_S','IS_AUTHENTICATED_FULLY'])
    def list = {
        
        System.out.println("List")
        System.out.println("params: "+params)
        
         ArrayList<Paciente> pacientes = new ArrayList<String>()
         def query="from Paciente as p where "
         
        def nombre=false
        def tipoPaciente=false
        
        
        if((params.nombre==null) 
            && (params.idTipoPaciente==null) 
            && (params.idOficina==null)) {
           //No hary parametro de busqueda
        }else {
            if(!(params.nombre).isEmpty()){
                query +=  "((p.nombre like '%"+params.nombre+"%') OR (p.apePaterno like '%"+params.nombre+"%'))"
                nombre = true
            }
            if(!(params.idTipoPaciente).isEmpty()) {
                if(nombre) {
                    query +=  "and (p.tipoPaciente.id='"+params.idTipoPaciente+"')"
                }else {
                    query +=  "(p.tipoPaciente.id='"+params.idTipoPaciente+"')"
                }
                tipoPaciente = true
            }
            
            def queryUser = "from Usuario as u where u.username='"+springSecurityService.principal.username+"'"
            System.out.println("query-usuario: "+queryUser)
            def usuario = Usuario.find(queryUser)
            System.out.println("usuario-usuario: "+usuario)
            def rol = usuario.rol.authority
            System.out.println("rol-rol: "+rol)
            
            if(rol.equals("ROLE_ADMIN_IM") || rol.equals("ROLE_OPERA_IM") || rol.equals("ROLE_CONSUL_S")) {
                if((params.idOficina).isEmpty()) {
                    // Cualquier oficina
                }else {
                    def oficina = Oficina.get(params.idOficina)
                    if(tipoPaciente || nombre) {
                        query +=  "and (p.oficina='"+oficina.sucursal+"')"
                    }else {
                        query +=  "(p.oficina='"+oficina.sucursal+"')"
                    }
                }
            }else {
                def sucursal = usuario.oficina.sucursal
                if(tipoPaciente || nombre) {
                    query +=  "and (p.oficina='"+sucursal+"')"
                }else {
                    query +=  "(p.oficina='"+sucursal+"')"
                }
            }
            
            query += " order by p.nombre"
            println("list-paciente query: "+query)
            pacientes = Paciente.findAll(query)
        }
        
        render(view: "list", model: [pacienteInstanceList:pacientes])
    }
    
    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
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
        paciente.telefono = params.telefono
        paciente.celular = params.celular
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
    
    
    private void agregarAuxAudAsignados(def asigAuxAud) {
        System.out.println("agregarAuxAudAsignados: "+params)
        if(params.oidoIzq.equals("true")) {
            def tipoAuxAudIzq = TipoAuxAud.get(params.idTipoAuxAudIzq)
            def auxAudIzq = AuxiliarAuditivo.get(params.idAuxAudIzq)
            
            def auxAudAsignIzq = new AuxAudAsignado(
                serie:params.noserieIzq,
                oido:"IZQUIERDO",
                auxAud:auxAudIzq,
                tipoAuxAud:tipoAuxAudIzq)
            
            System.out.println("auxAudAsignIzq: "+auxAudAsignIzq)
            asigAuxAud.addToAuxAudAsigns(auxAudAsignIzq)
        }
        if(params.oidoDer.equals("true")) {
            def tipoAuxAudDer = TipoAuxAud.get(params.idTipoAuxAudDer)
            def auxAudDer = AuxiliarAuditivo.get(params.idAuxAudDer)
            
            def auxAudAsignDer = new AuxAudAsignado(
                serie:params.noserieDer,
                oido:"DERECHO",
                auxAud:auxAudDer,
                tipoAuxAud:tipoAuxAudDer)
            System.out.println("auxAudAsignDer: "+auxAudAsignDer)
            asigAuxAud.addToAuxAudAsigns(auxAudAsignDer)
        }
    }
    
    def guardarDocumentarEntregaAA = {
        System.out.println("Controller - guardarDocumentarEntregaAA")
        System.out.println("params : "+params)
      
        def paciente = Paciente.get(params.idPaciente)
        def cita = Cita.get(params.idCita)


        // Crear objeto AsignacionAuxAud
        def fechaAsignacion = new Date()
        def pacienteRecibeAuxAud = null
        def nombreRecibeAuxAud = null
        
        def firmaRecibido = null
        if (params.pacienteRecibe.equals("false")) {
            pacienteRecibeAuxAud = false
            nombreRecibeAuxAud = params.nombreRecibe
        }else {
            pacienteRecibeAuxAud = true
            nombreRecibeAuxAud = ""
        }
        
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
            nivelServicio:params.nivelServicio,
            comentarios:params.comentarios) 
                
        def checks = CheckEntrega.list(sort:"secuencia", order:"asc")
        def estadoChecks = new EstadoChecks()
        
         checks.each() {
             System.out.println("secuencia: "+it.secuencia)
             def status = params.get(""+it.secuencia)
              System.out.println("secuencia: "+it.secuencia+" STATUS: "+status)
             def estadoCheck = new EstadoCheck(status:status)
             estadoCheck.checkEntrega = it
             estadoChecks.addToChecks(estadoCheck)
         }
        
        agregarAuxAudAsignados(asigAuxAud)
        asigAuxAud.estadoChecks = estadoChecks
         
        paciente.asigAuxAud = asigAuxAud 
        
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
    
    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
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

    @Secured(['ROLE_ADMIN_IM','ROLE_OPERA_IM','ROLE_OPERA_P','ROLE_SUPER_P','ROLE_CONSUL_S','IS_AUTHENTICATED_FULLY'])
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

    @Secured(['ROLE_SUPER_P','IS_AUTHENTICATED_FULLY'])
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

    @Secured(['ROLE_SUPER_P','IS_AUTHENTICATED_FULLY'])
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

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
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
