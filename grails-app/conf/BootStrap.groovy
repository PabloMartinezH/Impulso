import impulso.GrupoMenu
import impulso.ItemGrupoMenu
import impulso.TipoPaciente
import impulso.TipoCita
import impulso.Documento
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
            def doc1 = new Documento(ordenDoc:4,codigoDoc:"IFE",nombreDoc: "CREDENCIAL IFE",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            def doc2 = new Documento(ordenDoc:1,codigoDoc:"ISSFAM",nombreDoc: "IDENTIFICACION OFICIAL ISSFAM",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            def doc3 = new Documento(ordenDoc:2,codigoDoc:"RECETA",nombreDoc: "RECETA MEDICA",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            def doc4 = new Documento(ordenDoc:5,codigoDoc:"CARTA",nombreDoc: "CARTA DE AFILIACIÓN",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            def doc5 = new Documento(ordenDoc:3,codigoDoc:"AUDIOGRAMA",nombreDoc: "AUDIOGRAMA",caracteristicas: "ORIGINAL Y 6 COPIAS POR AMBOS LADOS")
            
            def doc6 = new Documento(ordenDoc:6,codigoDoc:"AUDIOGRAMA-PRO",nombreDoc: "AUDIOGRAMA PROVEEDOR",caracteristicas: "ORIGINAL Y 6 COPIAS")
            def doc8 = new Documento(ordenDoc:7,codigoDoc:"IDENTI-PACIENTE",nombreDoc: "IDENTIFICACIÓN DE PACIENTE",caracteristicas: "ORIGINAL Y 6 COPIAS")
            def doc7 = new Documento(ordenDoc:8,codigoDoc:"CARTA-PODER",nombreDoc: "CARTA PODER",caracteristicas: "ORIGINAL Y 6 COPIAS. FIRMADA POR PACIENTE Y APODERADO, Y 2 TESTIGOS")
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
            
            def ta1 = new TipoAuxAud(modelo:"TEGO PRO BTE",descripcion:"AUXILIARES AUDITIVOS 100% DIGITALES TIPO CURVETA PARA PERDIDAS LEVES, MEDIAS Y SEVERAS RESPECTIVAMENTE, PROGRAMABLES DE 6 CANALES 6 BANDAS, CON OPCION DE ADAPTACION ABIERTA 'OPEN FIT' PARA HIPOACUSIA EN TONOS AGUDOS").save(failOnError: true)
            def ta2 = new TipoAuxAud(modelo:"TEGO PRO BTE PW",descripcion:"AUXILIARES AUDITIVOS 100% DIGITALES TIPO CURVETA PARA PERDIDAS LEVES, MEDIAS Y SEVERAS RESPECTIVAMENTE, PROGRAMABLES DE 6 CANALES 6 BANDAS, CON OPCION DE ADAPTACION ABIERTA 'OPEN FIT' PARA HIPOACUSIA EN TONOS AGUDOS").save(failOnError: true)
            def ta3 = new TipoAuxAud(modelo:"SUMO DM",descripcion:"TEGO PRO BTE / TEGO PRO BTE PW AUXILIARES AUDITIVOS 100% DIGITALES TIPO CURVETA PARA PERDIDAS PROFUNDAS INCLUYENDO RESTOS AUDITIVOS, PROGRAMABLES DE 6 CANALES").save(failOnError: true)
            def ta4 = new TipoAuxAud(modelo:"TEGO PRO ITC",descripcion:"AUXILIARES AUDITIVOS 100% DIGITALES TIPO HECHOS A LA MEDIDA, TIPO ITC (INTRACANAL, IN THE CHANNEL) PARA HIPOACUSIA LEVE Y MEDIA PROGRAMABLES DE 6 CANALES 6 BANDAS; Y AUXILIARES AUDITIVOS 100% DIGITALES TIPO HECHOS A LA MEDIDA TIPO ITE ").save(failOnError: true)
            def ta5 = new TipoAuxAud(modelo:"SUMO DM DIAD",descripcion:"AUXILIARES AUDITIVOS TIPO DIADEMA CON UN VIBRADOR OSEO CON AUXILIAR AUDITIVO.").save(failOnError: true)
          
            def aa1 = new AuxiliarAuditivo(marca:"BIOTRONIK")
            aa1.addToTiposAuxAud(ta1)
            aa1.addToTiposAuxAud(ta2)
            aa1.addToTiposAuxAud(ta3)
            
            def aa2 = new AuxiliarAuditivo(marca:"PERRY BAROMEDICAL")
            aa2.addToTiposAuxAud(ta2)
            aa2.addToTiposAuxAud(ta3)
            aa2.addToTiposAuxAud(ta4)
            aa2.addToTiposAuxAud(ta5)
            
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
                descripcion:"UN KIT DE LIMPIEZA.").save(failOnError: true)
            def ce3 = new CheckEntrega(
                secuencia:3,necesario:true,
                descripcion:"UN DESHUMIDIFICADOR REUTILIZABLE PARA EVITAR LA FORMACIÓN DE SALES DE ÓXIDO.").save(failOnError: true)
            def ce4 = new CheckEntrega(
                secuencia:4,necesario:true,
                descripcion:"UN PROBADOR DE PILAS.").save(failOnError: true)
            def ce5 = new CheckEntrega(
                secuencia:5,necesario:true,
                descripcion:"SEIS PAQUETES CON SEIS PILAS CADA UNO.").save(failOnError: true)
            def ce6 = new CheckEntrega(
                secuencia:6,necesario:true,
                descripcion:"UN MOLDE PARA EL OÍDO HECHO A LA MEDIDA.").save(failOnError: true)
            def ce7 = new CheckEntrega(
                secuencia:7,necesario:false,
                descripcion:"EN CASO DE HABER RECIBIDO AUXILIAR AUDITIVO TIPO ITC, SE ENTREGARÁ DOS KIT DE FILTROS PARA LOS AUXILIARES AUDITIVOS TIPO HECHOS A LA MEDIDA.").save(failOnError: true)
            def ce8 = new CheckEntrega(
                secuencia:8,necesario:false,
                descripcion:"PARA PACIENTES PEDIÁTRICOS, SE ENTREGARÁ SIN COSTO EXTRA UN PAR DE SUJETADORES Y TRES PARES DE MOLDES DE SILICÓN.").save(failOnError: true)
        }
        
        
        /*
         if (!Empresa.count()) {
             def emp1 = new Empresa(codigoEmp:"RDR",nombreEmp:"REPRESENTACIONES Y DISTRIBUCIONES DEL RELLO").save(failOnError: true)
             def emp2 = new Empresa(codigoEmp:"SEDENA",nombreEmp:"SECRETARIA DE LA DEFENESA NACIONAL").save(failOnError: true)
             def emp3 = new Empresa(codigoEmp:"IMPULSO",nombreEmp:"IMPULSO MEXICANO").save(failOnError: true)
         }*/
        
               
          // Roles

        def adminIRole = Rol.findByAuthority("ROLE_ADMIN_IM") ?: new Rol(authority: "ROLE_ADMIN_IM",nombre:"ROL ADMINISTRADOR").save(failOnError: true)
        def operaIRole = Rol.findByAuthority("ROLE_OPERA_IM") ?: new Rol(authority: "ROLE_OPERA_IM",nombre:"ROL PARA ACTIVIDADES DEL OPERADOR DE IMPULSO MEXICANO").save(failOnError: true)
        def operaPRole = Rol.findByAuthority("ROLE_OPERA_P") ?: new Rol(authority: "ROLE_OPERA_P",nombre:"ROL PARA ACTIVIDADES DE OPERADOR DEL PROVEEDOR").save(failOnError: true)
        def superPRole = Rol.findByAuthority("ROLE_SUPER_P") ?: new Rol(authority: "ROLE_SUPER_P",nombre:"ROL PARA ACTIVIDADES DEL SUPERVISOR DEL PROVEEDOR").save(failOnError: true)
        def consuSRole = Rol.findByAuthority("ROLE_CONSUL_S") ?: new Rol(authority: "ROLE_CONSUL_S",nombre:"ROL PARA ACTIVIDADES DE CONSULTA DE SEDENA").save(failOnError: true)


        // Oficinas
        if (!Oficina.count() && (!Usuario.count())) {
                def ofi1 = new Oficina(sucursal:"GUADALAJARA",direccion:"Dr. José Figueroa Sterling Tel. 01 (33) 3641 9380 y 01 (33) 3641 5359 Jesús García # 2447 int. 304 Col. Prados Providencia Guadalajara, Jalisco.").save(failOnError: true)
                def ofi2 = new Oficina(sucursal:"TAMPICO",direccion:"Dra. Luz Minerva Cuesta Tel. 01 (833) 241 3639 Médica Universidad Priv. Universidad # 102, Col. Hospital Regional Tampico, Tamaulipas.").save(failOnError: true)
                def ofi3 = new Oficina(sucursal:"IRAPUATO",direccion:"Ing. Santiago Cardozo Tel. 01 (462) 624 4628 Av. Reforma # 286 Consultorio 8 Fraccionamiento Gámez, Irapuato, Guanajuato.").save(failOnError: true)
                def ofi4 = new Oficina(sucursal:"PUEBLA",direccion:"Dra. Pilar Pérez Tel. 01 (222) 237 1066 - 503 13 Sur # 1905 2do Piso- 7 Col. Santiago Puebla, Puebla").save(failOnError: true)
                def ofi5 = new Oficina(sucursal:"VERACRUZ",direccion:"Dra. Rosina Figueroa Campos, Av. 20 de Noviembre 2716, esq. Iglesia y Colón Tel: 012299808822").save(failOnError: true)
                def ofi6 = new Oficina(sucursal:"CD. DE MEXICO",direccion:"Representaciones y Distribuciones Del Rello SA de CV Tel. 56871717 Magdalena 111, entre Romero de Terreros y Luz Saviñon Col. Del Valle DF.").save(failOnError: true)
                
                // Usuarios
                def usu1 = new Usuario(nombre:"DAVID",empresa:"IMPULSO",username:"DAVID",password:"DAVID",enabled:true)
                def usu2 = new Usuario(nombre:"ALFREDO",empresa:"IMPULSO",username:"ALFREDO",password:"ALFREDO",enabled:true)
                def usu3 = new Usuario(nombre:"ALEJANDRO",empresa:"IMPULSO",username:"ALEJANDRO",password:"ALEJANDRO",enabled:true)
                
                def usu4 = new Usuario(nombre:"BRENDA",empresa:"RDR",username:"BRENDA",password:"BRENDA",enabled:true)   
                def usu5 = new Usuario(nombre:"BRUNO",empresa:"RDR",username:"BRUNO",password:"BRUNO",enabled:true) 
                
                def usu6 = new Usuario(nombre:"BERENICE",empresa:"RDR",username:"BERENICE",password:"BERENICE",enabled:true) 
                def usu7 = new Usuario(nombre:"BIANCA",empresa:"RDR",username:"BIANCA",password:"BIANCA",enabled:true) 
                
                def usu8 = new Usuario(nombre:"CESAR",empresa:"SEDENA",username:"CESAR",password:"CESAR",enabled:true)
                def usu9 = new Usuario(nombre:"CAMILO",empresa:"SEDENA",username:"CAMILO",password:"CAMILO",enabled:true)
                
       
                usu4.oficina = ofi3
                usu5.oficina = ofi3
                usu6.oficina = ofi6
                usu7.oficina = ofi6
            
                usu1.rol = adminIRole
                usu2.rol = operaIRole
                usu3.rol = operaIRole
            
                usu4.rol = operaPRole
                usu5.rol = superPRole
                usu6.rol = operaPRole
                usu7.rol = superPRole
            
                usu8.rol = consuSRole
                usu9.rol = consuSRole
            
                usu1.save(failOnError: true)
                usu2.save(failOnError: true)
                usu3.save(failOnError: true)
                usu4.save(failOnError: true)
                usu5.save(failOnError: true)
                usu6.save(failOnError: true)
                usu7.save(failOnError: true)
                usu8.save(failOnError: true)
                usu9.save(failOnError: true)
            
                SecUserSecRole.create usu1, adminIRole
                SecUserSecRole.create usu2, operaIRole
                SecUserSecRole.create usu3, operaIRole
                
                SecUserSecRole.create usu4, operaPRole
                SecUserSecRole.create usu5, superPRole
                
                SecUserSecRole.create usu6, operaPRole
                SecUserSecRole.create usu7, superPRole
                
                SecUserSecRole.create usu8, consuSRole
                SecUserSecRole.create usu9, consuSRole
                
            }
        
      
        // Menu
        if (!GrupoMenu.count()) {
            new GrupoMenu(codigo: "1",nombre: "ADMIN",ruta: "/index.html").save(failOnError: true)
            new GrupoMenu(codigo: "2",nombre: "OPERACION \n y CONSULTA",ruta: "/index.html").save(failOnError: true)
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
