package impulso

import grails.plugins.springsecurity.Secured;

class RolController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 20)
        [rolInstanceList: Rol.list(params), rolInstanceTotal: Rol.count()]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def create = {
        def rolInstance = new Rol()
        rolInstance.properties = params
        return [rolInstance: rolInstance]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def save = {
        def rolInstance = new Rol(params)
        if (rolInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'rol.label', default: 'Rol'), rolInstance.id])}"
            redirect(action: "show", id: rolInstance.id)
        }
        else {
            render(view: "create", model: [rolInstance: rolInstance])
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def show = {
        def rolInstance = Rol.get(params.id)
        if (!rolInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "list")
        }
        else {
            [rolInstance: rolInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def edit = {
        def rolInstance = Rol.get(params.id)
        if (!rolInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [rolInstance: rolInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def update = {
        def rolInstance = Rol.get(params.id)
        if (rolInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (rolInstance.version > version) {
                    
                    rolInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'rol.label', default: 'Rol')] as Object[], "Another user has updated this Rol while you were editing")
                    render(view: "edit", model: [rolInstance: rolInstance])
                    return
                }
            }
            rolInstance.properties = params
            if (!rolInstance.hasErrors() && rolInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rol.label', default: 'Rol'), rolInstance.id])}"
                redirect(action: "show", id: rolInstance.id)
            }
            else {
                render(view: "edit", model: [rolInstance: rolInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def delete = {
        def rolInstance = Rol.get(params.id)
        if (rolInstance) {
            try {
                rolInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "list")
        }
    }
}
