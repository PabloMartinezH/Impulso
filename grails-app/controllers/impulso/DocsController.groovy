package impulso

import com.lucastex.grails.fileuploader.UFile

class DocsController {

        def altaExpediente = { 
		//log.debug "Uploaded file with id=${params.ufileId}"
                System.out.println("Uploaded file with id=${params.ufileId}")
                System.out.println("params:"+params)
		[files: UFile.list(), params:params]
	}
	
	def delete = {
		def ufile = UFile.get(params.id)
		ufile.delete()
		redirect action:altaExpediente
	}
}
