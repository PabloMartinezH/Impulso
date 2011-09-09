package impulso

import grails.plugins.springsecurity.Secured;

class OficinaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [oficinaInstanceList: Oficina.list(params), oficinaInstanceTotal: Oficina.count()]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def create = {
        def oficinaInstance = new Oficina()
        oficinaInstance.properties = params
        return [oficinaInstance: oficinaInstance]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def save = {
        def oficinaInstance = new Oficina(params)
        if (oficinaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'oficina.label', default: 'Oficina'), oficinaInstance.id])}"
            redirect(action: "show", id: oficinaInstance.id)
        }
        else {
            render(view: "create", model: [oficinaInstance: oficinaInstance])
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def show = {
        def oficinaInstance = Oficina.get(params.id)
        if (!oficinaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficina.label', default: 'Oficina'), params.id])}"
            redirect(action: "list")
        }
        else {
            [oficinaInstance: oficinaInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def edit = {
        def oficinaInstance = Oficina.get(params.id)
        if (!oficinaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficina.label', default: 'Oficina'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [oficinaInstance: oficinaInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def update = {
        def oficinaInstance = Oficina.get(params.id)
        if (oficinaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (oficinaInstance.version > version) {
                    
                    oficinaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'oficina.label', default: 'Oficina')] as Object[], "Another user has updated this Oficina while you were editing")
                    render(view: "edit", model: [oficinaInstance: oficinaInstance])
                    return
                }
            }
            oficinaInstance.properties = params
            if (!oficinaInstance.hasErrors() && oficinaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'oficina.label', default: 'Oficina'), oficinaInstance.id])}"
                redirect(action: "show", id: oficinaInstance.id)
            }
            else {
                render(view: "edit", model: [oficinaInstance: oficinaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficina.label', default: 'Oficina'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def delete = {
        def oficinaInstance = Oficina.get(params.id)
        if (oficinaInstance) {
            try {
                oficinaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'oficina.label', default: 'Oficina'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'oficina.label', default: 'Oficina'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficina.label', default: 'Oficina'), params.id])}"
            redirect(action: "list")
        }
    }
}
