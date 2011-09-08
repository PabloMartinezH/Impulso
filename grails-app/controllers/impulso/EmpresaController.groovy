package impulso

class EmpresaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [empresaInstanceList: Empresa.list(params), empresaInstanceTotal: Empresa.count()]
    }

    def create = {
        def empresaInstance = new Empresa()
        empresaInstance.properties = params
        return [empresaInstance: empresaInstance]
    }

    def save = {
        def empresaInstance = new Empresa(params)
        if (empresaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'empresa.label', default: 'Empresa'), empresaInstance.id])}"
            redirect(action: "show", id: empresaInstance.id)
        }
        else {
            render(view: "create", model: [empresaInstance: empresaInstance])
        }
    }

    def show = {
        def empresaInstance = Empresa.get(params.id)
        if (!empresaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), params.id])}"
            redirect(action: "list")
        }
        else {
            [empresaInstance: empresaInstance]
        }
    }

    def edit = {
        def empresaInstance = Empresa.get(params.id)
        if (!empresaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [empresaInstance: empresaInstance]
        }
    }

    def update = {
        def empresaInstance = Empresa.get(params.id)
        if (empresaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (empresaInstance.version > version) {
                    
                    empresaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'empresa.label', default: 'Empresa')] as Object[], "Another user has updated this Empresa while you were editing")
                    render(view: "edit", model: [empresaInstance: empresaInstance])
                    return
                }
            }
            empresaInstance.properties = params
            if (!empresaInstance.hasErrors() && empresaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'empresa.label', default: 'Empresa'), empresaInstance.id])}"
                redirect(action: "show", id: empresaInstance.id)
            }
            else {
                render(view: "edit", model: [empresaInstance: empresaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def empresaInstance = Empresa.get(params.id)
        if (empresaInstance) {
            try {
                empresaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'empresa.label', default: 'Empresa'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'empresa.label', default: 'Empresa'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), params.id])}"
            redirect(action: "list")
        }
    }
}
