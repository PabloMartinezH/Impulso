package impulso

import grails.plugins.springsecurity.Secured;

class CheckEntregaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 50, 50)
        [checkEntregaInstanceList: CheckEntrega.list(params), checkEntregaInstanceTotal: CheckEntrega.count()]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def create = {
        def checkEntregaInstance = new CheckEntrega()
        checkEntregaInstance.properties = params
        return [checkEntregaInstance: checkEntregaInstance]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def save = {
        def checkEntregaInstance = new CheckEntrega(params)
        if (checkEntregaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), checkEntregaInstance.id])}"
            redirect(action: "show", id: checkEntregaInstance.id)
        }
        else {
            render(view: "create", model: [checkEntregaInstance: checkEntregaInstance])
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def show = {
        def checkEntregaInstance = CheckEntrega.get(params.id)
        if (!checkEntregaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), params.id])}"
            redirect(action: "list")
        }
        else {
            [checkEntregaInstance: checkEntregaInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def edit = {
        def checkEntregaInstance = CheckEntrega.get(params.id)
        if (!checkEntregaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [checkEntregaInstance: checkEntregaInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def update = {
        def checkEntregaInstance = CheckEntrega.get(params.id)
        if (checkEntregaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (checkEntregaInstance.version > version) {
                    
                    checkEntregaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'checkEntrega.label', default: 'CheckEntrega')] as Object[], "Another user has updated this CheckEntrega while you were editing")
                    render(view: "edit", model: [checkEntregaInstance: checkEntregaInstance])
                    return
                }
            }
            checkEntregaInstance.properties = params
            if (!checkEntregaInstance.hasErrors() && checkEntregaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), checkEntregaInstance.id])}"
                redirect(action: "show", id: checkEntregaInstance.id)
            }
            else {
                render(view: "edit", model: [checkEntregaInstance: checkEntregaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def delete = {
        def checkEntregaInstance = CheckEntrega.get(params.id)
        if (checkEntregaInstance) {
            try {
                checkEntregaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'checkEntrega.label', default: 'CheckEntrega'), params.id])}"
            redirect(action: "list")
        }
    }
}
