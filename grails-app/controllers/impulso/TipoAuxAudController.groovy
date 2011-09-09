package impulso

import grails.plugins.springsecurity.Secured;

class TipoAuxAudController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 50, 50)
        [tipoAuxAudInstanceList: TipoAuxAud.list(params), tipoAuxAudInstanceTotal: TipoAuxAud.count()]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def create = {
        def tipoAuxAudInstance = new TipoAuxAud()
        tipoAuxAudInstance.properties = params
        return [tipoAuxAudInstance: tipoAuxAudInstance]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def save = {
        def tipoAuxAudInstance = new TipoAuxAud(params)
        if (tipoAuxAudInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), tipoAuxAudInstance.id])}"
            redirect(action: "show", id: tipoAuxAudInstance.id)
        }
        else {
            render(view: "create", model: [tipoAuxAudInstance: tipoAuxAudInstance])
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def show = {
        def tipoAuxAudInstance = TipoAuxAud.get(params.id)
        if (!tipoAuxAudInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tipoAuxAudInstance: tipoAuxAudInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def edit = {
        def tipoAuxAudInstance = TipoAuxAud.get(params.id)
        if (!tipoAuxAudInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tipoAuxAudInstance: tipoAuxAudInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def update = {
        def tipoAuxAudInstance = TipoAuxAud.get(params.id)
        if (tipoAuxAudInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tipoAuxAudInstance.version > version) {
                    
                    tipoAuxAudInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud')] as Object[], "Another user has updated this TipoAuxAud while you were editing")
                    render(view: "edit", model: [tipoAuxAudInstance: tipoAuxAudInstance])
                    return
                }
            }
            tipoAuxAudInstance.properties = params
            if (!tipoAuxAudInstance.hasErrors() && tipoAuxAudInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), tipoAuxAudInstance.id])}"
                redirect(action: "show", id: tipoAuxAudInstance.id)
            }
            else {
                render(view: "edit", model: [tipoAuxAudInstance: tipoAuxAudInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def delete = {
        def tipoAuxAudInstance = TipoAuxAud.get(params.id)
        if (tipoAuxAudInstance) {
            try {
                tipoAuxAudInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoAuxAud.label', default: 'TipoAuxAud'), params.id])}"
            redirect(action: "list")
        }
    }
}
