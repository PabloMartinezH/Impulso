package impulso

import grails.plugins.springsecurity.Secured;

class TipoCitaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoCitaInstanceList: TipoCita.list(params), tipoCitaInstanceTotal: TipoCita.count()]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def create = {
        def tipoCitaInstance = new TipoCita()
        tipoCitaInstance.properties = params
        return [tipoCitaInstance: tipoCitaInstance]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def save = {
        def tipoCitaInstance = new TipoCita(params)
        if (tipoCitaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), tipoCitaInstance.id])}"
            redirect(action: "show", id: tipoCitaInstance.id)
        }
        else {
            render(view: "create", model: [tipoCitaInstance: tipoCitaInstance])
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def show = {
        def tipoCitaInstance = TipoCita.get(params.id)
        if (!tipoCitaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tipoCitaInstance: tipoCitaInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def edit = {
        def tipoCitaInstance = TipoCita.get(params.id)
        if (!tipoCitaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tipoCitaInstance: tipoCitaInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def update = {
        def tipoCitaInstance = TipoCita.get(params.id)
        if (tipoCitaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tipoCitaInstance.version > version) {
                    
                    tipoCitaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tipoCita.label', default: 'TipoCita')] as Object[], "Another user has updated this TipoCita while you were editing")
                    render(view: "edit", model: [tipoCitaInstance: tipoCitaInstance])
                    return
                }
            }
            tipoCitaInstance.properties = params
            if (!tipoCitaInstance.hasErrors() && tipoCitaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), tipoCitaInstance.id])}"
                redirect(action: "show", id: tipoCitaInstance.id)
            }
            else {
                render(view: "edit", model: [tipoCitaInstance: tipoCitaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def delete = {
        def tipoCitaInstance = TipoCita.get(params.id)
        if (tipoCitaInstance) {
            try {
                tipoCitaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), params.id])}"
            redirect(action: "list")
        }
    }
}
