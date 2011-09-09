package impulso

import grails.plugins.springsecurity.Secured;

class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    
    def index = {
        redirect(action: "list", params: params)
    }

    
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        params.sort = "empresa"
        params.order = "asc"
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def create = {
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def save = {
        params.putAt("enabled",true)
        def usuarioInstance = new Usuario(params)
        if (usuarioInstance.save(flush: true)) {
            
            def rol = Rol.get(params.rol.id) 
            SecUserSecRole.create usuarioInstance, rol
            
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
            redirect(action: "show", id: usuarioInstance.id)
        }
        else {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def show = {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [usuarioInstance: usuarioInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def edit = {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [usuarioInstance: usuarioInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def update = {
        def usuarioInstance = Usuario.get(params.id)
        if (usuarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (usuarioInstance.version > version) {
                    
                    usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'usuario.label', default: 'Usuario')] as Object[], "Another user has updated this Usuario while you were editing")
                    render(view: "edit", model: [usuarioInstance: usuarioInstance])
                    return
                }
            }
            usuarioInstance.properties = params
            if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
                
                def user = Usuario.get(params.id)
                def rol = Rol.get(params.rol.id) 
                SecUserSecRole.create user, rol
                
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
                redirect(action: "show", id: usuarioInstance.id)
            }
            else {
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def delete = {
        def usuarioInstance = Usuario.get(params.id)
        if (usuarioInstance) {
            try {
                SecUserSecRole.remove usuarioInstance, usuarioInstance.rol
                usuarioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }
}
