package impulso

class TipoPacienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoPacienteInstanceList: TipoPaciente.list(params), tipoPacienteInstanceTotal: TipoPaciente.count()]
    }

    def create = {
        def tipoPacienteInstance = new TipoPaciente()
        tipoPacienteInstance.properties = params
        return [tipoPacienteInstance: tipoPacienteInstance]
    }

    def save = {
        def tipoPacienteInstance = new TipoPaciente(params)
        if (tipoPacienteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), tipoPacienteInstance.id])}"
            redirect(action: "show", id: tipoPacienteInstance.id)
        }
        else {
            render(view: "create", model: [tipoPacienteInstance: tipoPacienteInstance])
        }
    }

    def show = {
        def tipoPacienteInstance = TipoPaciente.get(params.id)
        if (!tipoPacienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tipoPacienteInstance: tipoPacienteInstance]
        }
    }

    def edit = {
        def tipoPacienteInstance = TipoPaciente.get(params.id)
        if (!tipoPacienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tipoPacienteInstance: tipoPacienteInstance]
        }
    }

    def update = {
        def tipoPacienteInstance = TipoPaciente.get(params.id)
        if (tipoPacienteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tipoPacienteInstance.version > version) {
                    
                    tipoPacienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tipoPaciente.label', default: 'TipoPaciente')] as Object[], "Another user has updated this TipoPaciente while you were editing")
                    render(view: "edit", model: [tipoPacienteInstance: tipoPacienteInstance])
                    return
                }
            }
            tipoPacienteInstance.properties = params
            if (!tipoPacienteInstance.hasErrors() && tipoPacienteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), tipoPacienteInstance.id])}"
                redirect(action: "show", id: tipoPacienteInstance.id)
            }
            else {
                render(view: "edit", model: [tipoPacienteInstance: tipoPacienteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tipoPacienteInstance = TipoPaciente.get(params.id)
        if (tipoPacienteInstance) {
            try {
                tipoPacienteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoPaciente.label', default: 'TipoPaciente'), params.id])}"
            redirect(action: "list")
        }
    }
}
