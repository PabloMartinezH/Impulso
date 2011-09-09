package impulso

import grails.plugins.springsecurity.Secured;
import com.lucastex.grails.fileuploader.UFile

class DocsController {

        def springSecurityService
        
        @Secured(['ROLE_ADMIN_IM','ROLE_OPERA_IM','IS_AUTHENTICATED_FULLY'])
        def altaExpediente = { 
		//log.debug "Uploaded file with id=${params.ufileId}"
                System.out.println("Uploaded file with id=${params.ufileId}")
                System.out.println("params:"+params)
		[files: UFile.list(), params:params]
	}
	
        @Secured(['ROLE_ADMIN_IM','ROLE_OPERA_IM','IS_AUTHENTICATED_FULLY'])
	def delete = {
		def ufile = UFile.get(params.id)
		ufile.delete()
		redirect action:altaExpediente
	}
}
