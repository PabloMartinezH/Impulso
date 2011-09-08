import impulso.GrupoMenu
import impulso.ItemGrupoMenu
import impulso.TipoPaciente
import impulso.TipoCita
import impulso.Documento
import impulso.Empresa
import impulso.TipoAuxAud
import impulso.AuxiliarAuditivo
import impulso.Estado
import impulso.EscalonServicioSanidad
import impulso.Oficina
import impulso.Usuario
import impulso.Rol
import impulso.SecUserSecRole
import impulso.CheckEntrega


class BootStrap {

    // def springSecurityService
    
    def init = { servletContext ->
        
        if (!TipoPaciente.count()) {
            new TipoPaciente(codigo: "DHA",nombre: "DERECHOHABIENTE ACTIVO").save(failOnError: true)
            new TipoPaciente(codigo: "DHR",nombre: "DERECHOHABIENTE RETIRADO").save(failOnError: true)
            new TipoPaciente(codigo: "MA",nombre: "MILITAR ACTIVO").save(failOnError: true)
            new TipoPaciente(codigo: "MR",nombre: "MILITAR RETIRADO").save(failOnError: true)
            new TipoPaciente(codigo: "PEN",nombre: "PENSIONADO").save(failOnError: true)
        }
        
         if (!EscalonServicioSanidad.count()) {
            new EscalonServicioSanidad(codigoESS:"1aZM-HCM",zonaMilitar:"1/a. ZONA MILITAR",nombreInst:"HOSPITAL CENTRAL MILITAR",domicilioInst:"AV. PERIFERICO, ESQ. JUAN CABRAL, COL. LOMAS DE SOTELO, DF.").save(failOnError: true)
            new EscalonServicioSanidad(codigoESS:"1aZM-EM-1A",zonaMilitar:"1/a. ZONA MILITAR",nombreInst:"EFERMERIA DEL CAMPO MILITAR No. 1-A, DF",domicilioInst:"PTA. 7, CAMPO MILITAR No.1-A, DF.").save(failOnError: true)
            new EscalonServicioSanidad(codigoESS:"1aZM-CH-EMP",zonaMilitar:"1/a. ZONA MILITAR",nombreInst:"CENTRO HOSPITALARIO DEL ESTADO MAYOR PRESIDENCIAL",domicilioInst:"AV. CONSTITUYENTES 270, ESQ. PERIFERICO COL. AMPLIACION DANIEL GARZA, DELEG. MIGUEL HIDALGO. DF.").save(failOnError: true)
            new EscalonServicioSanidad(codigoESS:"15aZM-HMR-GJ",zonaMilitar:"15/a. ZONA MILITAR",nombreInst:"HOSPITAL MILITAR REGIONAL DE GUADALAJARA, JAL",domicilioInst:"CALLE MEDRANO No. 701").save(failOnError: true)
            new EscalonServicioSanidad(codigoESS:"16aZM-HMR-IG",zonaMilitar:"16/a. ZONA MILITAR",nombreInst:"HOSPITAL MILITAR REGIONAL DE IRAPUATO, GTO",domicilioInst:"AV. PASEO DE LA SOLIDARIDAD No. 8169").save(failOnError: true)
            new EscalonServicioSanidad(codigoESS:"8aZM-HMR-TT",zonaMilitar:"8/a. ZONA MILITAR",nombreInst:"HOSPITAL MILITAR REGIONAL DE TAMPICO, TAMPS",domicilioInst:"CALLE VENUSTIANO CARRANZA 701 PONIENTE").save(failOnError: true)
            new EscalonServicioSanidad(codigoESS:"6aZM-EM-BV",zonaMilitar:"6/a. ZONA MILITAR",nombreInst:"EFERMERIA MILITAR DE LA BOTICARIA, VER",domicilioInst:"CAMPO MILITAR 26-B, JOSÉ GONZALEZ HERRERA S/N. COL. EJIDO 1/o. DE MAYO, MPCIO. BOCA DEL RIO").save(failOnError: true)
            new EscalonServicioSanidad(codigoESS:"25aZM-EM-PP",zonaMilitar:"25/a. ZONA MILITAR",nombreInst:"HOSPITAL MILITAR REGIONAL DE PUEBLA, PUE",domicilioInst:"AV. LA CARRERA No. 49").save(failOnError: true)
        }
         
        if (!Documento.count() && !TipoCita.count()) {
            
            // Documentos
            def doc1 = new Documento(ordenDoc:1,codigoDoc:"IFE",nombreDoc: "CREDENCIAL IFE",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            def doc2 = new Documento(ordenDoc:2,codigoDoc:"ISSFAM",nombreDoc: "IDENTIFICACION OFICIAL ISSFAM",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            def doc3 = new Documento(ordenDoc:3,codigoDoc:"RECETA",nombreDoc: "RECETA MEDICA",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            def doc4 = new Documento(ordenDoc:4,codigoDoc:"CARTA",nombreDoc: "CARTA DE AFILIACIÓN",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS. REQUERIDA CUANDO FALTA ISSFAM")
            def doc5 = new Documento(ordenDoc:5,codigoDoc:"AUDIOGRAMA",nombreDoc: "AUDIOGRAMA",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            
            def doc6 = new Documento(ordenDoc:6,codigoDoc:"AUDIOGRAMA-PRO",nombreDoc: "AUDIOGRAMA PROVEEDOR",caracteristicas: "ORIGINAL Y 6 COPIAS")
            def doc7 = new Documento(ordenDoc:7,codigoDoc:"CARTA-PODER",nombreDoc: "CARTA PODER",caracteristicas: "ORIGINAL Y 6 COPIAS. FIRMADA POR PACIENTE Y APODERADO, Y 2 TESTIGOS")
            def doc8 = new Documento(ordenDoc:8,codigoDoc:"IDENTI-PACIENTE",nombreDoc: "IDENTIFICACIÓN DE PACIENTE",caracteristicas: "ORIGINAL Y 6 COPIAS")
            def doc9 = new Documento(ordenDoc:9,codigoDoc:"IDENTI-APODERADO",nombreDoc: "IDENTIFICACIÓN DE APODERADO",caracteristicas: "ORIGINAL Y 6 COPIAS")
            def doc10 = new Documento(ordenDoc:10,codigoDoc:"IDENTI-TESTIGOS",nombreDoc: "IDENTIFICACIÓN DE TESTIGOS",caracteristicas: "ORIGINAL Y 6 COPIAS")
            
            // Estados del proceso
            def tipoCita1 = new TipoCita(codigo:"ENTREGA DOCS Y MOLDES",nombre:"ENTREGA DE DOCS Y TOMA DE MOLDES",secuencia:1)
            tipoCita1.addToDocumentos(doc1)
            tipoCita1.addToDocumentos(doc2)
            tipoCita1.addToDocumentos(doc3)
            tipoCita1.addToDocumentos(doc4)
            tipoCita1.addToDocumentos(doc5)
            if(!tipoCita1.save(flush: true) ) {
                tipoCita1.errors.each {
                    println it
                }
            }

            // Estados del proceso
            def tipoCita2 = new TipoCita(codigo:"ENTREGA AUXILIAR AUD",nombre:"ENTREGA DE AUXILIAR AUDITIVO",secuencia:2)
            tipoCita2.addToDocumentos(doc6)
            tipoCita2.addToDocumentos(doc7)
            tipoCita2.addToDocumentos(doc8)
            tipoCita2.addToDocumentos(doc9)
            tipoCita2.addToDocumentos(doc10)
            
            if(!tipoCita2.save(flush: true) ) {
                tipoCita2.errors.each {
                    println it
                }
            }
        }
        
        if (!Estado.count()) {
             def edo1 = new Estado(secuencia:1,boton:"Verificar Docs",nombre:"VERIFICAR DOCS PARA TOMA DE MOLDES").save(failOnError: true)
             def edo2 = new Estado(secuencia:2,boton:"Completar Info",nombre:"COMPLETAR INFO DEL PACIENTE Y RECETA").save(failOnError: true)
             def edo3 = new Estado(secuencia:3,boton:"Siguiente Cita",nombre:"PROGRAMAR CITA PARA ENTREGAR AUXILIAR AUDITIVO").save(failOnError: true)
             def edo4 = new Estado(secuencia:4,boton:"Verificar Docs",nombre:"VERIFICAR DOCS PARA ENTREGAR AUXILIAR AUDITIVO").save(failOnError: true)
             def edo5 = new Estado(secuencia:5,boton:"Documentar Entrega",nombre:"DOCUMENTAR ENTREGA DE AUXILIAR AUDITIVO").save(failOnError: true)
             def edo6 = new Estado(secuencia:6,boton:"Terminado",nombre:"AUXILIAR AUDITIVO ENTREGADO").save(failOnError: true)
         }
        
        
        if (!TipoAuxAud.count()) {
            
            def ta1 = new TipoAuxAud(modelo:"CURVETA-LMS",nombre:"AUXILIARES AUDITIVOS 100% DIGITALES TIPO CURVETA PARA PERDIDAS LEVES, MEDIAS, Y SEVERAS").save(failOnError: true)
            def ta2 = new TipoAuxAud(modelo:"CURVETA-PRO",nombre:"AUXILIARES AUDITIVOS 100% DIGITALES TIPO CURVETA PARA PERDIDAS PROFUNDAS INCLUYENDO RESTOS AUDITIVOS").save(failOnError: true)
            def ta3 = new TipoAuxAud(modelo:"CURVETA-ITC",nombre:"AUXILIARES AUDITIVOS 100% DIGITALES TIPO CURVETA HECHOS A LA MEDIDA, TIPO ITC PARA HIPOACUSIA LEVE Y MEDIA").save(failOnError: true)
            def ta4 = new TipoAuxAud(modelo:"DIADEMA-VIB",nombre:"AUXILIARES AUDITIVOS TIPO DIADEMA CON UN VIBRADOR OSEO CON AUXILIAR AUDITIVO").save(failOnError: true)
          
            def aa1 = new AuxiliarAuditivo(marca:"BIOTRONIK")
            aa1.addToTiposAuxAud(ta1)
            aa1.addToTiposAuxAud(ta2)
            aa1.addToTiposAuxAud(ta3)
            
            def aa2 = new AuxiliarAuditivo(marca:"PERRY BAROMEDICAL")
            aa2.addToTiposAuxAud(ta2)
            aa2.addToTiposAuxAud(ta3)
            aa2.addToTiposAuxAud(ta4)
            
            if(!aa1.save(flush: true) ) {
                aa1.errors.each {
                    println it
                }
            }
            
            if(!aa2.save(flush: true) ) {
                aa2.errors.each {
                    println it
                }
            }
        }
        
        
        if(!CheckEntrega.count()) {
            def ce1 = new CheckEntrega(
                secuencia:1,necesario:true,
                descripcion:"UN ESTUCHE.").save(failOnError: true)
            def ce2 = new CheckEntrega(
                secuencia:2,necesario:true,
                descripcion:"Un kit de limpieza.").save(failOnError: true)
            def ce3 = new CheckEntrega(
                secuencia:3,necesario:true,
                descripcion:"Un deshumidificador reutilizable para evitar la formación de sales de óxido.").save(failOnError: true)
            def ce4 = new CheckEntrega(
                secuencia:4,necesario:true,
                descripcion:"Un probador de pilas.").save(failOnError: true)
            def ce5 = new CheckEntrega(
                secuencia:5,necesario:true,
                descripcion:"Seis paquetes con seis pilas cada uno.").save(failOnError: true)
            def ce6 = new CheckEntrega(
                secuencia:6,necesario:true,
                descripcion:"Un molde para el oído hecho a la medida.").save(failOnError: true)
            def ce7 = new CheckEntrega(
                secuencia:7,necesario:false,
                descripcion:"En caso de haber recibido auxiliar auditivo tipo ITC, se entregará dos kit de filtros para los auxiliares auditivos tipo hechos a la medida.").save(failOnError: true)
            def ce8 = new CheckEntrega(
                secuencia:8,necesario:false,
                descripcion:"Para pacientes pediátricos, se entregará sin costo extra un par de sujetadores y tres pares de moldes de silicón.").save(failOnError: true)
        }
        
        
        /*
         if (!Empresa.count()) {
             def emp1 = new Empresa(codigoEmp:"RDR",nombreEmp:"REPRESENTACIONES Y DISTRIBUCIONES DEL RELLO").save(failOnError: true)
             def emp2 = new Empresa(codigoEmp:"SEDENA",nombreEmp:"SECRETARIA DE LA DEFENESA NACIONAL").save(failOnError: true)
             def emp3 = new Empresa(codigoEmp:"IMPULSO",nombreEmp:"IMPULSO MEXICANO").save(failOnError: true)
         }*/
        
               
          // Roles

        def adminIRole = Rol.findByAuthority("ROLE_ADMIN_IM") ?: new Rol(authority: "ROLE_ADMIN_IM",nombre:"ROL ADMINISTRADOR").save(failOnError: true)
        def operaPRole = Rol.findByAuthority("ROLE_OPERA_P") ?: new Rol(authority: "ROLE_OPERA_P",nombre:"ROL PARA ACTIVIDADES DE OPERADOR DEL PROVEEDOR").save(failOnError: true)
        def superPRole = Rol.findByAuthority("ROLE_SUPER_P") ?: new Rol(authority: "ROLE_SUPER_P",nombre:"ROL PARA ACTIVIDADES DEL SUPERVISOR DEL PROVEEDOR").save(failOnError: true)
        def operaIRole = Rol.findByAuthority("ROLE_OPERA_IM") ?: new Rol(authority: "ROLE_OPERA_IM",nombre:"ROL PARA ACTIVIDADES DEL OPERADOR DE IMPULSO MEXICANO").save(failOnError: true)
        def consuIRole = Rol.findByAuthority("ROLE_CONSUL_IM") ?: new Rol(authority: "ROLE_CONSUL_IM",nombre:"ROL PARA ACTIVIDADES DE CONSULTA DE IMPULSO MEXICANO").save(failOnError: true)
        def consuSRole = Rol.findByAuthority("ROLE_CONSUL_S") ?: new Rol(authority: "ROLE_CONSUL_S",nombre:"ROL PARA ACTIVIDADES DE CONSULTA DE SEDENA").save(failOnError: true)


        // Oficinas
        if (!Oficina.count() && (!Usuario.count())) {
                def ofi1 = new Oficina(sucursal:"GUADALAJARA",direccion:"Jesús García # 2447 int. 304 Col. Prados ProvidenciaGuadalajara Jalisco.")
                def ofi2 = new Oficina(sucursal:"TAMPICO",direccion:"Médica Universidad Priv. Universidad #102, Col. HospitalRegional Tampico, Tamaulipas")
                def ofi3 = new Oficina(sucursal:"IRAPUATO",direccion:"Av. Reforma #286 Consultorio 8 Fraccionamiento Gámez,Irapuato, Guanajuato")
                def ofi4 = new Oficina(sucursal:"PUEBLA",direccion:"13 Sur # 1905 2do Piso – 7 Col. Santiago Puebla, Puebla")
                def ofi5 = new Oficina(sucursal:"VERACRUZ",direccion:"VERACRUZ")
                def ofi6 = new Oficina(sucursal:"IMPULSO",direccion:"DISTRITO FEDERAL")
                def ofi7 = new Oficina(sucursal:"SEDENA",direccion:"DISTRITO FEDERAL")
                
                // Usuarios
                def usu1 = new Usuario(nombre:"ALFREDO ZAMORA",empresa:"IMPULSO",username:"ALFREDO",password:"ALFREDO",enabled:true)
                def usu2 = new Usuario(nombre:"DAVID ROJAS",empresa:"RDR",username:"DAVID",password:"DAVID",enabled:true)   
                def usu3 = new Usuario(nombre:"JULIAN LEON",empresa:"RDR",username:"JULIAN",password:"JULIAN",enabled:true)   
                
                ofi6.addToUsuarios(usu1)
                ofi2.addToUsuarios(usu2)
                ofi3.addToUsuarios(usu3)
                
                ofi1.save(failOnError: true)
                ofi2.save(failOnError: true)
                ofi3.save(failOnError: true)
                ofi4.save(failOnError: true)
                ofi5.save(failOnError: true)
                ofi6.save(failOnError: true)
                ofi7.save(failOnError: true)
            
            
                SecUserSecRole.create usu1, operaIRole
                SecUserSecRole.create usu2, operaPRole
                SecUserSecRole.create usu3, operaPRole
                
            }
        
      
        // Menu
        if (!GrupoMenu.count()) {
            new GrupoMenu(codigo: "1",nombre: "ADMIN",ruta: "/index.html").save(failOnError: true)
            new GrupoMenu(codigo: "2",nombre: "OPERACION",ruta: "/index.html").save(failOnError: true)
            new GrupoMenu(codigo: "3",nombre: "REPORTES",ruta: "/index.html").save(failOnError: true)
        }
        
        // Menu Items
        if (!ItemGrupoMenu.count()) {
            def gm1 = GrupoMenu.find("from GrupoMenu as gm where gm.codigo='1'")
            gm1.addToItems(new ItemGrupoMenu(codigo: "1.1",nombre: "AXULIARES AUDITIVOS",ruta: "auxiliarAuditivo/list"))
            gm1.addToItems(new ItemGrupoMenu(codigo: "1.2",nombre: "TIPOS PACIENTE",ruta: "tipoPaciente/list"))
            gm1.addToItems(new ItemGrupoMenu(codigo: "1.3",nombre: "DOCUMENTOS",ruta: "documento/list"))
            gm1.addToItems(new ItemGrupoMenu(codigo: "1.4",nombre: "ESTADOS DEL PROCESO",ruta: "estado/list"))
            gm1.addToItems(new ItemGrupoMenu(codigo: "1.5",nombre: "EMPRESAS",ruta: "empresa/list"))
            gm1.addToItems(new ItemGrupoMenu(codigo: "1.6",nombre: "ESCALONES SERV. SAN.",ruta: "escalonServicioSanidad/list"))
            gm1.addToItems(new ItemGrupoMenu(codigo: "2.4",nombre: "EXPEDIENTES",ruta: "paciente/listExped"))
            
           
            def gm2 = GrupoMenu.find("from GrupoMenu as gm where gm.codigo='2'")
            gm2.addToItems(new ItemGrupoMenu(codigo: "2.1",nombre: "CITAS",ruta: "cita/list"))
            gm2.addToItems(new ItemGrupoMenu(codigo: "2.2",nombre: "ENTREGA DOCS",ruta: "cita/listRecepDocs"))
            gm2.addToItems(new ItemGrupoMenu(codigo: "2.3",nombre: "ENTREGA AUX AUD",ruta: "cita/listEntregaAA"))
            gm2.addToItems(new ItemGrupoMenu(codigo: "2.4",nombre: "PACIENTES",ruta: "paciente/list"))
            
            
            def gm3 = GrupoMenu.find("from GrupoMenu as gm where gm.codigo='3'")
            gm3.addToItems(new ItemGrupoMenu(codigo: "2.4",nombre: "PACIENTES",ruta: "paciente/list?usuario:SEDENA"))
            
            gm1.save()
            gm2.save()
            gm3.save()
        }
        
    }
    def destroy = {
    }
}
