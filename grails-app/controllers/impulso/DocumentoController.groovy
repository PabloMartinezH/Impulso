package impulso

import grails.plugins.springsecurity.Secured;

class DocumentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 50, 50)
        [documentoInstanceList: Documento.list(params), documentoInstanceTotal: Documento.count()]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def create = {
        def documentoInstance = new Documento()
        documentoInstance.properties = params
        return [documentoInstance: documentoInstance]
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def save = {
        def documentoInstance = new Documento(params)
        if (documentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])}"
            redirect(action: "show", id: documentoInstance.id)
        }
        else {
            render(view: "create", model: [documentoInstance: documentoInstance])
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def show = {
        def documentoInstance = Documento.get(params.id)
        if (!documentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [documentoInstance: documentoInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def edit = {
        def documentoInstance = Documento.get(params.id)
        if (!documentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [documentoInstance: documentoInstance]
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def update = {
        def documentoInstance = Documento.get(params.id)
        if (documentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (documentoInstance.version > version) {
                    
                    documentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'documento.label', default: 'Documento')] as Object[], "Another user has updated this Documento while you were editing")
                    render(view: "edit", model: [documentoInstance: documentoInstance])
                    return
                }
            }
            documentoInstance.properties = params
            if (!documentoInstance.hasErrors() && documentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])}"
                redirect(action: "show", id: documentoInstance.id)
            }
            else {
                render(view: "edit", model: [documentoInstance: documentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_ADMIN_IM','IS_AUTHENTICATED_FULLY'])
    def delete = {
        def documentoInstance = Documento.get(params.id)
        if (documentoInstance) {
            try {
                documentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
    }
}
