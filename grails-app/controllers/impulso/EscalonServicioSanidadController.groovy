package impulso

class EscalonServicioSanidadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [escalonServicioSanidadInstanceList: EscalonServicioSanidad.list(params), escalonServicioSanidadInstanceTotal: EscalonServicioSanidad.count()]
    }

    def create = {
        def escalonServicioSanidadInstance = new EscalonServicioSanidad()
        escalonServicioSanidadInstance.properties = params
        return [escalonServicioSanidadInstance: escalonServicioSanidadInstance]
    }

    def save = {
        def escalonServicioSanidadInstance = new EscalonServicioSanidad(params)
        if (escalonServicioSanidadInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), escalonServicioSanidadInstance.id])}"
            redirect(action: "show", id: escalonServicioSanidadInstance.id)
        }
        else {
            render(view: "create", model: [escalonServicioSanidadInstance: escalonServicioSanidadInstance])
        }
    }

    def show = {
        def escalonServicioSanidadInstance = EscalonServicioSanidad.get(params.id)
        if (!escalonServicioSanidadInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), params.id])}"
            redirect(action: "list")
        }
        else {
            [escalonServicioSanidadInstance: escalonServicioSanidadInstance]
        }
    }

    def edit = {
        def escalonServicioSanidadInstance = EscalonServicioSanidad.get(params.id)
        if (!escalonServicioSanidadInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [escalonServicioSanidadInstance: escalonServicioSanidadInstance]
        }
    }

    def update = {
        def escalonServicioSanidadInstance = EscalonServicioSanidad.get(params.id)
        if (escalonServicioSanidadInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (escalonServicioSanidadInstance.version > version) {
                    
                    escalonServicioSanidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad')] as Object[], "Another user has updated this EscalonServicioSanidad while you were editing")
                    render(view: "edit", model: [escalonServicioSanidadInstance: escalonServicioSanidadInstance])
                    return
                }
            }
            escalonServicioSanidadInstance.properties = params
            if (!escalonServicioSanidadInstance.hasErrors() && escalonServicioSanidadInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), escalonServicioSanidadInstance.id])}"
                redirect(action: "show", id: escalonServicioSanidadInstance.id)
            }
            else {
                render(view: "edit", model: [escalonServicioSanidadInstance: escalonServicioSanidadInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def escalonServicioSanidadInstance = EscalonServicioSanidad.get(params.id)
        if (escalonServicioSanidadInstance) {
            try {
                escalonServicioSanidadInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad'), params.id])}"
            redirect(action: "list")
        }
    }
}
