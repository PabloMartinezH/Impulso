package impulso

class MedicoMilitarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [medicoMilitarInstanceList: MedicoMilitar.list(params), medicoMilitarInstanceTotal: MedicoMilitar.count()]
    }

    def create = {
        def medicoMilitarInstance = new MedicoMilitar()
        medicoMilitarInstance.properties = params
        return [medicoMilitarInstance: medicoMilitarInstance]
    }

    def save = {
        def medicoMilitarInstance = new MedicoMilitar(params)
        if (medicoMilitarInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), medicoMilitarInstance.id])}"
            redirect(action: "show", id: medicoMilitarInstance.id)
        }
        else {
            render(view: "create", model: [medicoMilitarInstance: medicoMilitarInstance])
        }
    }

    def show = {
        def medicoMilitarInstance = MedicoMilitar.get(params.id)
        if (!medicoMilitarInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), params.id])}"
            redirect(action: "list")
        }
        else {
            [medicoMilitarInstance: medicoMilitarInstance]
        }
    }

    def edit = {
        def medicoMilitarInstance = MedicoMilitar.get(params.id)
        if (!medicoMilitarInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [medicoMilitarInstance: medicoMilitarInstance]
        }
    }

    def update = {
        def medicoMilitarInstance = MedicoMilitar.get(params.id)
        if (medicoMilitarInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (medicoMilitarInstance.version > version) {
                    
                    medicoMilitarInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'medicoMilitar.label', default: 'MedicoMilitar')] as Object[], "Another user has updated this MedicoMilitar while you were editing")
                    render(view: "edit", model: [medicoMilitarInstance: medicoMilitarInstance])
                    return
                }
            }
            medicoMilitarInstance.properties = params
            if (!medicoMilitarInstance.hasErrors() && medicoMilitarInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), medicoMilitarInstance.id])}"
                redirect(action: "show", id: medicoMilitarInstance.id)
            }
            else {
                render(view: "edit", model: [medicoMilitarInstance: medicoMilitarInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def medicoMilitarInstance = MedicoMilitar.get(params.id)
        if (medicoMilitarInstance) {
            try {
                medicoMilitarInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'medicoMilitar.label', default: 'MedicoMilitar'), params.id])}"
            redirect(action: "list")
        }
    }
}
