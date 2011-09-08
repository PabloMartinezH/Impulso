package impulso

class AuxiliarAuditivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [auxiliarAuditivoInstanceList: AuxiliarAuditivo.list(params), auxiliarAuditivoInstanceTotal: AuxiliarAuditivo.count()]
    }

    def create = {
        def auxiliarAuditivoInstance = new AuxiliarAuditivo()
        auxiliarAuditivoInstance.properties = params
        return [auxiliarAuditivoInstance: auxiliarAuditivoInstance]
    }

    def save = {
        def auxiliarAuditivoInstance = new AuxiliarAuditivo(params)
        if (auxiliarAuditivoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), auxiliarAuditivoInstance.id])}"
            redirect(action: "show", id: auxiliarAuditivoInstance.id)
        }
        else {
            render(view: "create", model: [auxiliarAuditivoInstance: auxiliarAuditivoInstance])
        }
    }

    def show = {
        def auxiliarAuditivoInstance = AuxiliarAuditivo.get(params.id)
        if (!auxiliarAuditivoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [auxiliarAuditivoInstance: auxiliarAuditivoInstance]
        }
    }

    def edit = {
        def auxiliarAuditivoInstance = AuxiliarAuditivo.get(params.id)
        if (!auxiliarAuditivoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [auxiliarAuditivoInstance: auxiliarAuditivoInstance]
        }
    }

    def update = {
        def auxiliarAuditivoInstance = AuxiliarAuditivo.get(params.id)
        if (auxiliarAuditivoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (auxiliarAuditivoInstance.version > version) {
                    
                    auxiliarAuditivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo')] as Object[], "Another user has updated this AuxiliarAuditivo while you were editing")
                    render(view: "edit", model: [auxiliarAuditivoInstance: auxiliarAuditivoInstance])
                    return
                }
            }
            auxiliarAuditivoInstance.properties = params
            if (!auxiliarAuditivoInstance.hasErrors() && auxiliarAuditivoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), auxiliarAuditivoInstance.id])}"
                redirect(action: "show", id: auxiliarAuditivoInstance.id)
            }
            else {
                render(view: "edit", model: [auxiliarAuditivoInstance: auxiliarAuditivoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def auxiliarAuditivoInstance = AuxiliarAuditivo.get(params.id)
        if (auxiliarAuditivoInstance) {
            try {
                auxiliarAuditivoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo'), params.id])}"
            redirect(action: "list")
        }
    }
}
