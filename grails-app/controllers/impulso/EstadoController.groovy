package impulso

class EstadoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estadoInstanceList: Estado.list(params), estadoInstanceTotal: Estado.count()]
    }

    def create = {
        def estadoInstance = new Estado()
        estadoInstance.properties = params
        return [estadoInstance: estadoInstance]
    }

    def save = {
        def estadoInstance = new Estado(params)
        if (estadoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])}"
            redirect(action: "show", id: estadoInstance.id)
        }
        else {
            render(view: "create", model: [estadoInstance: estadoInstance])
        }
    }

    def show = {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])}"
            redirect(action: "list")
        }
        else {
            [estadoInstance: estadoInstance]
        }
    }

    def edit = {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [estadoInstance: estadoInstance]
        }
    }

    def update = {
        def estadoInstance = Estado.get(params.id)
        if (estadoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (estadoInstance.version > version) {
                    
                    estadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'estado.label', default: 'Estado')] as Object[], "Another user has updated this Estado while you were editing")
                    render(view: "edit", model: [estadoInstance: estadoInstance])
                    return
                }
            }
            estadoInstance.properties = params
            if (!estadoInstance.hasErrors() && estadoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])}"
                redirect(action: "show", id: estadoInstance.id)
            }
            else {
                render(view: "edit", model: [estadoInstance: estadoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def estadoInstance = Estado.get(params.id)
        if (estadoInstance) {
            try {
                estadoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])}"
            redirect(action: "list")
        }
    }
}
