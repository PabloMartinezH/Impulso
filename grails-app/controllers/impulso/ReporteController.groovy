package impulso

import grails.plugins.springsecurity.Secured;

class ReporteController {
    def springSecurityService
    
    @Secured(['ROLE_ADMIN_IM','ROLE_OPERA_IM','ROLE_OPERA_P','ROLE_SUPER_P','ROLE_CONSUL_S','IS_AUTHENTICATED_FULLY'])
    def consultarReportes = {
        if(params.idEstado==null
            && params.idTipoAuxAud==null
            && params.idOficina==null
            && params.fechaInicio==null
            && params.fechaFin==null) {
            def pacientes = new ArrayList<Paciente>()
            [pacienteInstanceList:pacientes]
        }else {
            
            
            if(esBusquedaXCita()) {
                def query = "from Cita as c where"
                def estado = false
                def tipoAuxAud = false
                
                if(params.fechaFin!="") {
                    query += " (c.fechaCita >= '"+params.fechaInicio+"' and c.fechaCita <= '"+params.fechaFin+"')"
                }else {
                    Date date = new Date();
                    java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
                    String fechaActual = sdf.format(date);
                    System.out.println("fechaActual: "+fechaActual)
                    query += " (c.fechaCita >= '"+params.fechaInicio+"' and c.fechaCita <= '"+fechaActual+"')"
                    System.out.println("Query-generarReportes: "+query)
                }
                
                if(params.idEstado!="") {
                    query += "AND (c.paciente.estado.id="+params.idEstado+")"
                    estado = true
                }
                if(params.idTipoAuxAud!="") {
                    if(estado) {
                        query += " and (c.paciente.tipoAuxAud.id="+params.idTipoAuxAud+")"
                    }else {
                        query += " (c.paciente.tipoAuxAud.id="+params.idTipoAuxAud+")"
                    }
                    tipoAuxAud = true
                }
                
                
                def queryUser = "from Usuario as u where u.username='"+springSecurityService.principal.username+"'"
                System.out.println("query-usuario: "+queryUser)
                def usuario = Usuario.find(queryUser)
                System.out.println("usuario-usuario: "+usuario)
                def rol = usuario.rol.authority
                System.out.println("rol-rol: "+rol)
            
            
                if(rol.equals("ROLE_ADMIN_IM") || rol.equals("ROLE_OPERA_IM") || rol.equals("ROLE_CONSUL_S")) {
                    if((params.idOficina).isEmpty()) {
                        // Cualquier oficina
                    }else {
                        def oficina = Oficina.get(params.idOficina)
                        query +=  " and (c.paciente.oficina='"+oficina.sucursal+"')"
                    }
                }else {
                    def sucursal = usuario.oficina.sucursal
                    query +=  "and (c.paciente.oficina='"+sucursal+"')"
                     /*System.out.println("estado: "+estado)
                     System.out.println("tipoAuxAud: "+tipoAuxAud)*/
                }
                System.out.println("Query-esBusquedPorCita: "+query)
                def citas = Cita.findAll(query)
                
                citas.each() {
                    println it
                }
               [citaInstanceList:citas]
                //render (view:"consultarReportesCitas.gsp", modelo:[citaInstanceList:citas])
                
            }else {
                System.out.println("generarReportes-PARAMS: "+params)
                def estado = false
                def tipoAuxAud = false
                def query = "from Paciente as p where"
                if(params.idEstado!="") {
                    query += "(p.estado.id="+params.idEstado+")"
                    estado = true
                }
                if(params.idTipoAuxAud!="") {
                    if(estado) {
                        query += " and (p.tipoAuxAud.id="+params.idTipoAuxAud+")"
                    }else {
                        query += " (p.tipoAuxAud.id="+params.idTipoAuxAud+")"
                    }
                    tipoAuxAud = true
                }
            
                def queryUser = "from Usuario as u where u.username='"+springSecurityService.principal.username+"'"
                System.out.println("query-usuario: "+queryUser)
                def usuario = Usuario.find(queryUser)
                System.out.println("usuario-usuario: "+usuario)
                def rol = usuario.rol.authority
                System.out.println("rol-rol: "+rol)
            
            
                if(rol.equals("ROLE_ADMIN_IM") || rol.equals("ROLE_OPERA_IM") || rol.equals("ROLE_CONSUL_S")) {
                    if((params.idOficina).isEmpty()) {
                        // Cualquier oficina
                    }else {
                        def oficina = Oficina.get(params.idOficina)
                        if(estado || tipoAuxAud) {
                            query +=  " and (p.oficina='"+oficina.sucursal+"')"
                        }else {
                            query +=  " (p.oficina='"+oficina.sucursal+"')"
                        }
                    }
                }else {
                    def sucursal = usuario.oficina.sucursal
                    if(estado || tipoAuxAud) {
                        query +=  "and (p.oficina='"+sucursal+"')"
                    }else {
                        query +=  "(p.oficina='"+sucursal+"')"
                    }
                }
                System.out.println("Query-generarReportes: "+query)
                def pacientes = Paciente.findAll(query)
                [pacienteInstanceList:pacientes]
            }

            /*            
            System.out.println("Query-generarReportes: "+query)
            def pacientes = Paciente.findAll(query)
            [pacienteInstanceList:pacientes]*/
        } 
    }
    
    private boolean esBusquedaXCita() {
        if(params.fechaInicio!="") {
            return true
        }else {
            return false
        }
    }
}
