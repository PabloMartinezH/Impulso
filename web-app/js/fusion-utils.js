

// Calendarios
function calendarioCita(x)
{
    $(x).datepicker({
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        maxDate: '+1y +0m +0w +0d',
        minDate: '-0y -0m -0w -0d',
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'], 
        dateFormat: 'yy-mm-dd'  //'d-M-yy'
    });     
}
function calendarioReceta(x)
{
    $(x).datepicker({
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        maxDate: '+0y +0m +0w +0d',
        minDate: '-0y -6m -0w -0d',
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'], 
        dateFormat: 'yy-mm-dd'  //'d-M-yy'
    });     
}
function calendarioVigencia(x)
{
    $(x).datepicker({
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        maxDate: '+0y +0m +0w +0d',
        minDate: '-0y -0m -0w -120d',
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'], 
        dateFormat: 'yy-mm-dd'  //'d-M-yy'
    });     
}


function guardarCita() {
    if(validarRegistrarCita()) {
        var v_nombre = $('#nombre').val();
        var v_apePaterno = $('#apePaterno').val();
        var v_apeMaterno = $('#apeMaterno').val();
        var v_fechaCita = $('#fechaCita').val();
        var v_horaCita = $('#horaCita').val();
        var v_tipoCita = $('#tipoCita').val();
        var v_status = $('#status').val();
        
        var v_sexo = $("#sexo option:selected").text() 
        var v_idTipoPaciente = $("#tipoPaciente option:selected").val() 
        var v_idTipoAuxAud = $("#tipoAuxAud option:selected").val()
        
        console.log("v_idTipoAuxAud: ",v_idTipoAuxAud)
         $.post('cita/guardarCita?'+
         'nombre='+v_nombre+
         '&apePaterno='+v_apePaterno+
         '&apeMaterno='+v_apeMaterno+
         '&fechaCita='+v_fechaCita+
         '&horaCita='+v_horaCita+        
         '&idTipoAuxAud='+v_idTipoAuxAud+
         '&tipoCita='+v_tipoCita+
         '&status='+v_status+
         '&sexo='+v_sexo+
         '&idTipoPaciente='+v_idTipoPaciente,
        function(data){$("div#contenidoCentro").html(data);});  
    }
}

  
function validarRegistrarCita() {
    console.log("validarRegistrarCita()")
    
    var v_nombre = $('#nombre').val();
    var v_apePaterno = $('#apePaterno').val();
    var v_fechaCita = $('#fechaCita').val();
    
    console.log("v_nombre",v_nombre)
    console.log("v_apePaterno",v_apePaterno)
    console.log("v_fechaCita",v_fechaCita)
    
    if(v_nombre=="" ||v_apePaterno=="" ||v_fechaCita=="") {
        alert("Faltan datos para registrar la cita.");
        return false;
    }else {
        return true;
    }
}



function guardarInfoCompletaPaciente() {
    if(validarCompletarPaciente()
        && validarRegistrarDireccion()
        && validarRegistrarReceta()
        && validarRegistrarMedicoMilitar()) {
    
        //Datos Paciente
        var v_idPaciente = $('#idPaciente').val();
        var v_nombre = $('#nombre').val();
        var v_apePaterno = $('#apePaterno').val();
        var v_apeMaterno = $('#apeMaterno').val();
        var v_edad = $('#edad').val();
        var v_sexo = $("#sexo option:selected").text() 
        var v_idTipoPaciente = $("#tipoPaciente option:selected").val() 
        var v_rango = $("#rango option:selected").text() 
         
        //Datos Dirección
        var v_calle = $('#calle').val();
        var v_numExt = $('#numExt').val();
        var v_numInt = $('#numInt').val();
        var v_colonia = $('#colonia').val();
        var v_cp = $('#cp').val();
        var v_ciudad = $('#ciudad').val();
        var v_estado = $("#estado option:selected").text() 
        var v_pais = $("#pais option:selected").text() 
        
        //Receta
        var v_fechaReceta = $('#fechaReceta').val();
        var v_folio = $('#folio').val();
        var v_matricula = $('#matricula').val();
        var v_caracter = $("#caracter option:selected").text() 
        var v_idTipoAuxAud = $("#tipoAuxAud option:selected").val()
        var v_idEscSerSan = $("#escalonServSanidad option:selected").val()
        var v_observaciones = $('#observaciones').val();

        //Medico Militar
        var v_nombreMM = $('#nombreMM').val();
        var v_apePaternoMM = $('#apePaternoMM').val();
        var v_apeMaternoMM = $('#apeMaternoMM').val();
        var v_areaMM = $('#areaMM').val();
        
        
         $.post('paciente/guardarInfoCompleta?'+
             
         'idPaciente='+v_idPaciente+
         '&nombre='+v_nombre+
         '&apePaterno='+v_apePaterno+
         '&apeMaterno='+v_apeMaterno+
         '&edad='+v_edad+
         '&sexo='+v_sexo+
         '&idTipoPaciente='+v_idTipoPaciente+        
         '&rango='+v_rango+
         
         '&calle='+v_calle+
         '&numExt='+v_numExt+
         '&numInt='+v_numInt+
         '&colonia='+v_colonia+
         '&cp='+v_cp+
         '&ciudad='+v_ciudad+
         '&estado='+v_estado+
         '&pais='+v_pais+
         
         '&fechaReceta='+v_fechaReceta+
         '&folio='+v_folio+
         '&matricula='+v_matricula+
         '&caracter='+v_caracter+
         '&idTipoAuxAud='+v_idTipoAuxAud+
         '&idEscSerSan='+v_idEscSerSan+
         '&observaciones='+v_observaciones+
         
         '&nombreMM='+v_nombreMM+
         '&apePaternoMM='+v_apePaternoMM+
         '&apeMaternoMM='+v_apeMaternoMM+
         '&areaMM='+v_areaMM,
        function(data){$("div#contenidoCentro").html(data);});  
    }
}

function validarCompletarPaciente() {
    console.log("validarCompletatPaciente()")
    
    var v_nombre = $('#nombre').val();
    var v_apePaterno = $('#apePaterno').val();
    var v_edad = $('#edad').val();

    console.log("v_nombre",v_nombre)
    console.log("v_apePaterno",v_apePaterno)
    console.log("v_edad",v_edad)
    
    if(v_nombre=="" ||v_apePaterno=="" ||v_edad=="") {
        alert("Faltan datos de Paciente.");
        return false;
    }else {
        return true;
    }
}


function validarRegistrarDireccion() {
    console.log("validarRegistrarDireccion()")
    var v_calle = $('#calle').val();
    var v_numExt = $('#numExt').val();
    var v_colonia = $('#colonia').val();
    var v_cp = $('#cp').val();
    var v_ciudad = $('#ciudad').val();
    console.log("v_calle",v_calle)
    console.log("v_numInt",v_numExt)
    console.log("v_colonia",v_colonia)
    console.log("v_cp",v_cp)
    console.log("v_ciudad",v_ciudad)
    
    if(v_calle=="" 
        || v_numExt=="" ||v_colonia==""
        || v_cp=="" ||v_ciudad=="") {
        alert("Faltan datos de Dirección.");
        return false;
    }else {
        return true;
    }
}

function validarRegistrarReceta() {
    console.log("validarRegistrarReceta()")
    var v_fechaReceta = $('#fechaReceta').val();
    var v_folio = $('#folio').val();
    var v_matricula = $('#matricula').val();
    console.log("v_fechaReceta",v_fechaReceta)
    console.log("v_folio",v_folio)
    console.log("v_matricula",v_matricula)
    if(v_fechaReceta=="" || 
        v_folio=="" ||
        v_matricula=="") {
        alert("Faltan datos de Receta.");
        return false;
    }else {
        return true;
    }
}

function validarRegistrarMedicoMilitar() {
    console.log("validarRegistrarMedicoMilitar()")
    var v_nombre = $('#nombreMM').val();
    var v_apePaterno = $('#apePaternoMM').val();
    var v_edad = $('#areaMM').val();
    console.log("v_nombre",v_nombre)
    console.log("v_apePaterno",v_apePaterno)
    console.log("v_edad",v_edad)
    
    if(v_nombre=="" ||v_apePaterno=="" ||v_edad=="") {
        alert("Faltan datos del Medico Militar.");
        return false;
    }else {
        return true;
    }
}



function validarCampo(x,tipo,nombre) {
    var v_valor = $(x).val();
    var expreg = null;
    var mensaje = null;
    
    if(tipo == 'texto') {
        expreg = new RegExp("^[a-zñA-ZÑ.,:0-9\. ]{3,}$");
        mensaje="";
    }
    if(tipo == 'serie') {
        expreg = new RegExp("^[a-zñA-ZÑ.,:0-9-\. ]{3,}$");
        mensaje="";
    }
    if(tipo == 'edad') {
        expreg = new RegExp("^[0-9]{1,3}$");
        mensaje="";
    }
    if(tipo == 'textoLibre') {
        expreg = new RegExp("^[A-ZÑ.,:0-9-\. ]{1,}$")
        mensaje="";
    }
    if(tipo == 'comentario') {
        expreg = new RegExp("^[a-zñA-ZÑ.,:0-9-\. ]{5,}$")
        mensaje="";
    }
     if(tipo == 'codigoPostal') {
        expreg = new RegExp("^[0-9]{5}$");
        mensaje = " Usar 5 números."
    }
    
    if(expreg.test(v_valor)){
          return true;
      }else {
          alert("Campo: '"+nombre+"' = '"+v_valor+"' invalido. \n"+mensaje);
          $(x).val("");
          $(x).focus();
    }
}


function buscarCitas(numCita) {
    console.log("buscarCitas")
    console.log("numCita: ",numCita)
    var action = "list";
    if (numCita == 1) {
        action = "listRecepDocs";
    }else if (numCita == 0){
        action = "list";
    }else if (numCita == 2) {
        action = "listEntregaAA";
    }
    
    if(validarBuscarCita()) {
        
        var v_fechaCita = null;
        var v_nombre = null;
        v_nombre = $('#nombre').val();
        v_fechaCita = $('#fechaCita').val();
        
        $.post('cita/'+action+'?'+
            'nombre='+v_nombre+
            '&fechaCita='+v_fechaCita,
            function(data){
                $("div#contenidoCentro").html(data);
            });  
    }
}

function validarBuscarCita() {
    console.log("validarBuscarCita()")
    
    var v_nombre = $('#nombre').val();
    var v_fechaCita = $('#fechaCita').val();
    
    console.log("v_nombre",v_nombre)
    console.log("v_fechaCita",v_fechaCita)
   
    if(v_nombre=="" && v_fechaCita=="") {
        alert("Falta ingresar parámetros de búsqueda.");
        return false;
    }else {
        return true;
    }
}


function guardarStatusDocs2daCita() {
    console.log("guardarStatusDocs2daCita")
    var docs = $(".doc");
    var docsOK = true;
    var v_docs = "";
    var check = $("#pacienteRecibe")
       
    if($(check).attr("checked") == true){
        for(i=0; i<docs.size(); i++) {
            if($(docs[i]).attr("codigo") == "IDENTI-PACIENTE") {
                if($(docs[i]).attr("checked") == false) {
                docsOK = false;
                }
            }
            if($(docs[i]).attr("codigo") == "AUDIOGRAMA-PRO") {
                if($(docs[i]).attr("checked") == false) {
                docsOK = false;
                }   
            }
            v_docs += "&"+$(docs[i]).attr("codigo")+"="+$(docs[i]).attr("checked")
        }
    }else {
        for(i=0; i<docs.size(); i++) {
            if($(docs[i]).attr("checked") == false) {
                docsOK = false;
            }
            v_docs += "&"+$(docs[i]).attr("codigo")+"="+$(docs[i]).attr("checked")
        }
    }
    
    console.log("docsOK: "+docsOK)
    console.log("v_docs: "+v_docs)
    
    var v_idPaciente = $('#idPaciente').val()
    var v_idCita = $('#idCita').val()
    
    if(docsOK) {
            var v_fechaActual = $('#fechaActual').val()
            
            var v_ruta = 'cita/guardarVerificarDocs2daCita'
            v_ruta += '?idPaciente='+v_idPaciente
            v_ruta += '&idCita='+v_idCita
            v_ruta += v_docs;     
            $.post(v_ruta,
                function(data){
                    $("div#contenidoCentro").html(data);
                });   
        }else {
            var secuencia = "2";
            var razon="CANCELACION"
            programarCita(razon,secuencia,docsOK,v_idPaciente,v_idCita);
        }
}


function guardarStatusDocs1erCita() {
    console.log("guardarStatusDocs1erCita:")
    
    var docs = $(".doc");
    var docISSFAM = false;
    
    for(i=0; i<docs.size(); i++) {
        if($(docs[i]).attr("codigo") == "ISSFAM") {
            if($(docs[i]).attr("checked") == false) {
                docISSFAM = false;
            }
            if($(docs[i]).attr("checked") == true) {
                docISSFAM = true;
            }
        }
    }
    
    console.log("docISSFAM: "+docISSFAM)
    
    var docsOK = false;
    
    var v_docs = "";
    for(i=0; i<docs.size(); i++) {
        console.log("codigo: "+$(docs[i]).attr("codigo"))
        if($(docs[i]).attr("codigo") == "CARTA") {
            if($(docs[i]).attr("checked") == false) {
                if(docISSFAM) {
                    docsOK = true;
                }else {
                    alert("Indicar ISSFAM o Carta de Afiliación.");
                    docsOK = true;
                }
            }else {
                var v_fechaCarta = $('#fechaCarta').val();
                console.log("v_fechaCarta: "+v_fechaCarta)
                if(v_fechaCarta == "") {
                    alert("Indicar fecha de vigencia.");
                    $('#fechaCarta').focus();
                    docsOK = false;
                }else {
                    docsOK = true;
                    v_docs += "&fechaCarta='"+v_fechaCarta+"'"
                }
            }
        }
    }
    
    console.log("docsOK: "+docsOK)
    
    if(docsOK) {
        for(i=0; i<docs.size(); i++) {
            console.log("doc: "+i+". codigo: "+$(docs[i]).attr("codigo")+" : "+$(docs[i]).attr("checked"))
            if($(docs[i]).attr("codigo") == "CARTA"
                || $(docs[i]).attr("codigo") == "ISSFAM") {
            }else if($(docs[i]).attr("checked") == false) {
                docsOK = false
            }
            v_docs += "&"+$(docs[i]).attr("codigo")+"="+$(docs[i]).attr("checked")
        }
        
        var v_idPaciente = $('#idPaciente').val()
        var v_idCita = $('#idCita').val()
         
        if(docsOK) {
            console.log("guardarVerificarDocs")
            var v_fechaActual = $('#fechaActual').val()
           
            
            var v_ruta = 'cita/guardarVerificarDocs1erCita'
            v_ruta += '?idPaciente='+v_idPaciente
            v_ruta += '&idCita='+v_idCita
            v_ruta += v_docs;     
            $.post(v_ruta,
                function(data){
                    $("div#contenidoCentro").html(data);
                });   
        }else {
            var secuencia = "1";
            var razon="CANCELACION"
            console.log("programarCita")
            programarCita(razon,secuencia,docsOK,v_idPaciente,v_idCita);
        }
    }else {
}
}

function programarCita(razon,secuencia,docsOK,idPaciente,idCita) {
    console.log("programarCita: razon: "+razon)
    console.log("programarCita: secuencia: "+secuencia)
    console.log("programarCita: docsOK: "+docsOK)
    console.log("programarCita: idPaciente: "+idPaciente)
    console.log("programarCita: idCita: "+idCita)
    
    $('div#programarCita').empty()
    $('div#programarCita').load("cita/programarCita",{
        razon:razon,
        secuencia:secuencia,
        docsOK:docsOK,
        idPaciente:idPaciente,
        idCita:idCita},
    function() {
       
    });
}    


function guardarCitaProgramada() {
    //console.log("guardarCitaProgramada")
    var v_idPaciente = $('#idPaciente').val();
    var v_idCita = $('#idCita').val();
    var v_fechaCita = $('#fechaCita').val();
    var v_horaCita = $('#horaCita').val();
    var v_tipoCita = $('#tipoCita').val();
    var v_razon = $('#razon').val();
    $.post('cita/guardarCitaProgramada?'+
        'idPaciente='+v_idPaciente+
        '&idCita='+v_idCita+
        '&fechaCita='+v_fechaCita+
        '&horaCita='+v_horaCita+
        '&tipoCita='+v_tipoCita+
        '&razon='+v_razon,
        function(data){
            $("div#contenidoCentro").html(data);
        });  
}

function guardarDocumentarEntrega() {
    console.log("guardarDocumentarEntrega")
    if(validarDocumentarEntrega()) {
        var v_pacRecibe = "";
        var v_nomRecibe = "";
        var v_idAuxAud = "";
        var v_idTipoAuxAud = "";
        var v_noserie = "";
        var v_oido = "";
        var v_firmaRecibido = "";
        var v_nivelServicio = "";
        var v_comentarios = "";
        var checks = $(".check");
        var v_checks = "";
        var v_idPaciente = "";
        var v_idCita = "";
            
        console.log("true")
        var checkRecibe = $("#pacienteRecibe")
        if($(checkRecibe).attr("checked") == true){
            v_pacRecibe = "true"
            v_nomRecibe = ""
        }else {
            v_pacRecibe = "false"
            v_nomRecibe = $('#nombreRecibeAuxAud').val()
        }
        v_idAuxAud = $("#marca option:selected").val()
        v_idTipoAuxAud = $("#tipoAuxAud option:selected").val()
        v_noserie = $("#serie").val()
        v_oido = $("#oido option:selected").text()   
        for(i=0; i<checks.size(); i++) {
            console.log("check: "+i+". secuencia: "+$(checks[i]).attr("codigo")+" : "+$(checks[i]).attr("checked"))
            v_checks += "&"+$(checks[i]).attr("codigo")+"="+$(checks[i]).attr("checked")
        }
        if($("#firmaRecibido").attr("checked") == true) {
            v_firmaRecibido = "true"
        }
            
        v_nivelServicio = $("#nivelServ option:selected").text()
        v_comentarios = $('#comentarios').val()
        v_idPaciente =   $('#idPaciente').val()
        v_idCita =   $('#idCita').val()
            
        var v_ruta = "";
        v_ruta += "paciente/guardarDocumentarEntregaAA"
        v_ruta += '?idPaciente='+v_idPaciente
        v_ruta += '&idCita='+v_idCita
        v_ruta += "&pacienteRecibe="+v_pacRecibe
        v_ruta += "&nombreRecibe="+v_nomRecibe
        v_ruta += "&idAuxAud="+v_idAuxAud
        v_ruta += "&idTipoAuxAud="+v_idTipoAuxAud
        v_ruta += "&noSerie="+v_noserie
        v_ruta += "&oido="+v_oido
        v_ruta += "&firmaRecibido="+v_firmaRecibido
        v_ruta += "&nivelServicio="+v_nivelServicio
        v_ruta += "&comentarios="+v_comentarios
        v_ruta += v_checks;
        
        console.log("Ruta: ",v_ruta)
        $.post(v_ruta,
            function(data){
                $("div#contenidoCentro").html(data);
            });      
    }else {
        console.log("false")
    }    
}

function validarDocumentarEntrega() {
    console.log("validarDocumentarEntrega")
    var checkRecibe = $("#pacienteRecibe")
    var checkFirma = $("#firmaRecibido")
    var v_serie = $('#serie').val()
    var checks = $(".check");  
    var retorno = true;
  
    if($(checkRecibe).attr("checked") == false){
        console.log("checkRecibe: ",$(checkRecibe).attr("checked"))
        var v_nrAuxAud = $('#nombreRecibeAuxAud').val();
        console.log("v_nrAuxAud: ",v_nrAuxAud)
        if(v_nrAuxAud=='') {
            alert("Indicar el nombre de la persona "+
                "\n que recibe el Auxiliar Auditivo.")
            $('#nombreRecibeAuxAud').focus()    
            retorno = false 
        }
    }
    if (v_serie=='') {
        alert("Indicar el número de serie.")
        $('#serie').focus()    
        retorno = false 
    }
    if ($(checkFirma).attr("checked") == false) {
        alert("Falta que el paciente firme de recibido.")
        $("#firmaRecibido").focus()    
        retorno = false 
    } 
    for(i=0; i<checks.size(); i++) {
        console.log("check: ",i,"- ",$(checks[i]).attr("necesario")," , ",$(checks[i]).attr("checked"))
        if($(checks[i]).attr("necesario") == "true") {
            if($(checks[i]).attr("checked") == false) {
                alert("Faltan productos por entregar.")
                $(checkFirma).focus()   
                return false 
                break
            }
        }
    }
 
    return retorno  
}

function cargaAlCentro(liga) {     
      $("div#contenidoCentro").load(liga);
}    



/* Función para confirmar borrado antes de llamar al método sabEntidad(entidad, accion) */

function confirmacionSab(entidad,accion) {
     if (accion=="delete") {
       var confirmacion = confirm("¿Esta seguro que desea borrar el registro?")
       if (confirmacion) {
           sabEntidad(entidad,accion)
       }else {
       }
    }else {   
    }
}


/* Función Salva,Actualiza,Borrar (sab) una entidad */

function sabEntidad(entidad,accion) {
    if (accion=="delete") {
        var accionx="update";
        var fae = $('form#form'+accionx+entidad);
    }else {
        var fae = $('form#form'+accion+entidad);
    }
    
    $.post(entidad+'/'+accion+'?'+fae.serialize(),{},function(data){
        $("div#contenidoCentro").html(data);
    });
}


function enviarArchivo() {
    console.log("enviarArchivo:")
    var fae = $('form#formenviarexpediente');
    console.log("enviarArchivo: ",fae)
    $.post('/Impulso/fileUploader/process?'+fae.serialize(),{},function(data){
        $("div#contenidoCentro").html(data);
    });
}

/* ********************************* */

   
 // validar precio de libro   
 
function validarEsCampoPorcentDesc(x) {
    var min = 0.0;
    var max = 100.0;
    var mensaje = "El descuento valido es de 0.00 % a 100.00 % ";
    var regex = /^([0-9])+(?:\.\d{0,2})?$/;
    var importe = $(x).val();
    console.log("descuento",importe);
    if (importe != "") {
        if(importe.match(regex)){
            if ( (importe >= min) && (importe <= max)){
                return true;
            }else {
                alert(mensaje);
                $(x).val("");
                $(x).focus();
            }
        }else{
            alert(mensaje);
            $(x).val("");
            $(x).focus();
        }
    }
    limpiarImportesDescuento()
    return false;
}
 
 
    function esFormatoPrecioContenidoPaquete(importe,campo) {
        
    var min = 0.0;
    var max = 10000.0;
    var mensaje = "El precio valido es de $ 0.00  a $ 10000.00";
    var regex = /^([0-9])+(?:\.\d{0,2})?$/;
    console.log("importe",importe);
    if (importe != "") {
        if(importe.match(regex)){
            if ( (importe >= min) && (importe <= max)){
                return true;
            }else {
                alert(mensaje);
                campo.focus();
                return false;
            }
	}else{
            alert(mensaje);
            campo.focus();
            return false;
	}
    }
    return false;

    }    
    
   
   function validarFormatoAnio(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[2]{1}[0-9]{3}$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(!(regex.test(v_valor))){
          alert("El campo "+v_campo+" es invalido. \n Formato: YYYY (4 números).");
          $(x).val("");
          $(x).focus();
          return false;
      }else {
          return true;
      }
  }  
   

  // validar que la cantidad de producto solo sean números enteros
  function validarNumerosEnteros(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[0-9]+$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(!(regex.test(v_valor))){
          alert("El campo "+v_campo+" no es valido, usar solo números");
          $(x).val("");
          $(x).focus();
          return false;
      }else {
          return true;
      }
  }  
    
    
    function validarCampoEsPrecio(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[0-9\.]*$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(!(regex.test(v_valor))){
          alert("El campo "+v_campo+" no es valido, solo números");
          $(x).val("");
          $(x).focus();
          return false;
      }else {
          return true;
      }
  }   
    
    
    
  function validarCampoEsNoVacio(x) {
      var v_valor = $(x).val();
      if(v_valor == ""){
          return false;
      }else {
          return true;
      }
  }   
    

    
    
  function validarCampoEsTexto(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[a-zA-Z0-9-\. ]{3,}$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(regex.test(v_valor)){
          return true;
      }else {
          alert("Campo: '"+v_campo+"' = '"+v_valor+"' invalido.");
          $(x).val("");
          $(x).focus();
      }
  }    
    
    
  function validarCampoEsNumIntExt(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[a-zA-Z0-9-\. ]{1,}$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(regex.test(v_valor)){
          return true;
      }else {
          alert("Campo: '"+v_campo+"' = '"+v_valor+"' invalido.");
          $(x).val("");
          $(x).focus();
      }
  }    
    
    
  function validarEmail(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
      console.log("v_valor.match(regex)",v_valor.match(regex))
      if(regex.test(v_valor)){
          return true;
      }else {
          alert("Campo: '"+v_campo+"' = '"+v_valor+"' invalido");
          $(x).val("");
          $(x).focus();
      }
  }
  
  function validarCampoExtension(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[a-zA-Z0-9-\. ]{1,}$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(regex.test(v_valor)){
          return true;
      }else {
          alert("Campo: '"+v_campo+"' = '"+v_valor+"' invalido.");
          $(x).val("");
          $(x).focus();
      }
  }    
  
  
    
  function validarCampoEsNumero(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[0-9]{3,}$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(regex.test(v_valor)){
          return true;
      }else {
          alert("Campo: '"+v_campo+"' = '"+v_valor+"' invalido. Solo números, mínimo 3");
          $(x).val("");
          $(x).focus();
      }
  }    
  
    function validarCampoEsCodigoPostal(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_campo = $(x).attr("name");
      console.log("v_campo",v_campo)
      var regex = new RegExp("^[0-9]{5}$");
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(regex.test(v_valor)){
          return true;
      }else {
          alert("El campo: '"+v_campo+"' = '"+v_valor+"' no es valido.");
          $(x).val("");
          $(x).focus();
      }
  } 
  
 
function validarCampoEsRFCBusqueda(x) {
    var v_valor = $(x).val();
    console.log("v_valor",v_valor)
    //var regex = new RegExp("^[a-zA-Z]{3,4}[0-9]{6}$");
    var regex = new RegExp("^[a-zA-Z]{3,4}$");
    console.log("v_valor.match(regex)",regex.test(v_valor))
    if(regex.test(v_valor)){
        return true;
    }else {
        alert("El campo: 'RFC' = '"+v_valor+"' no es valido.");
        $(x).val("");
        $(x).focus();
    }
}   
    
    
    function validarCampoEsRFCIngreso(x) {
      var v_valor = $(x).val();
      console.log("v_valor",v_valor)
      var v_tipoPersona = $('#tipoPersona option:selected').val();
      if (v_tipoPersona=="FISICA"){
         var regex = new RegExp("^[a-zA-Z]{4}[0-9]{6}[a-zA-Z0-9]{4}$");
      }else {
         var regex = new RegExp("^[a-zA-Z]{3}[0-9]{6}[a-zA-Z0-9]{3}$");
      }
     
      console.log("v_valor.match(regex)",regex.test(v_valor))
      if(regex.test(v_valor)){
          return true;
      }else {
          alert("El campo 'RFC' = '"+v_valor+"' no es valido.");
          $(x).val("");
          $(x).focus();
      }
  }   
    

    
   
    
    function calendarioFechaNacimiento(x) {
        $(x).datepicker({
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        maxDate: '-0y +12m +0w +0d',
        minDate: '-0y -0m -0w -0d',
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'], 
        dateFormat: 'yy-mm-d'
      });
    }
    
    
    function calendarioCierreCirculacion(x,fecha) {
        
        $(x).datepicker({
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'], 
        dateFormat: 'd-M-yy'
      });
        
        var v_anio = parseInt($('#anio option:selected').text());
        
        $( "#"+fecha ).datepicker( "option", "minDate",  new Date(v_anio,0,1) );
        $( "#"+fecha ).datepicker( "option", "maxDate",  new Date(v_anio,11,31) );
    }
    

/* CALCULOS */
/*    

function multiplicarImportesDetalleVenta() {

var precioUni = document.getElementById("precioUnitario").value;
var cantidad = document.getElementById("cantidad").value;
var subTotal = precioUni*cantidad;
document.getElementById("subTotal").value = subTotal;
var iva = subTotal * 0.16;
document.getElementById("iva").value = iva;
var total = subTotal + iva;
document.getElementById("total").value = total;
}


function calcularSubTotalDetalleVenta(x) {
    $("#subTotalP").val("");
    if(validarNumerosEnteros(x)) {
        var v_precioUnitario = parseFloat($("#precioUnitario").val());
        console.log("v_precioUnitario",v_precioUnitario)
        if(isNaN(v_precioUnitario)){
            alert("Es necesario seleccionar un producto");
            $(x).val("");
            $(x).focus();
        }else {
            var v_cantidad =  parseFloat($("#cantidad").val());
            var v_subTotal = parseFloat(v_cantidad * v_precioUnitario);
            $("#subTotalP").val(v_subTotal.toFixed(2));
        }
        limpiarImportesGE();
        limpiarImportesProducto();
    }
    
    /*
    if(!validarCampoEsVacio('cantidad')){
        
    }else {
        alert("Falta ingresar cantidad");
    } */
/*}*/

/*
function calcularTotalDetalleVentaLibro() {
    console.log("calcularTotalDetalleVentaLibro")
    
    var v_subTotalG = parseFloat($("#subTotalP").val());
    
    console.log("v_subTotalG",v_subTotalG)
    
    if ($("#indicaDescuento").attr("checked")==true){
        console.log("indicaDescuento = true")
        var v_importeFinal = parseFloat($("#importeFinal").val());
         console.log("v_importeFinal",v_importeFinal)
        if(isNaN(v_importeFinal)) {
            alert("Favor de calcular el descuento");
            return false;
        }else {
            v_subTotalG =  v_importeFinal;
        }
    }
    
    if(isNaN(v_subTotalG)){
        alert("Favor de indicar la cantidad de producto");
        $("#cantidad").focus();
    }else {
        var v_ivaTotalG = 0.0;
        var v_totalG = 0.0;
        console.log("v_subTotalG",v_subTotalG)
        console.log("v_ivaTotalG",v_ivaTotalG)
        console.log("v_totalG",v_totalG)
        if ($("#envioPagado").attr("checked")==true){
            if(!($("#gastosEnvio option:selected").val()=="null")){
                var v_importeGE = parseFloat($("#precioGE").val());
                var v_ivaGE = parseFloat($("#ivaGE").val());
                console.log("v_importeGE",v_importeGE)
                console.log("v_ivaGE",v_ivaGE)
                v_subTotalG = v_subTotalG+v_importeGE;
                v_ivaTotalG = v_ivaGE;
                v_totalG = v_ivaTotalG + v_subTotalG;
                console.log("v_subTotalG",v_subTotalG)
                console.log("v_ivaTotalG",v_ivaTotalG)
                console.log("v_totalG",v_totalG)
            }else {
                v_totalG = v_subTotalG;
            }
            
        }else {
            v_totalG = v_subTotalG;
        }
        $("#subTotalG").val(Math.round(v_subTotalG)); 
        $("#ivaTotalG").val(Math.round(v_ivaTotalG));
        $("#totalG").val(Math.round(v_totalG));
    }
}


function calcularTotalDetalleVentaEjemplar() {
    console.log("calcularTotalDetalleVentaLibro")
    
    var v_subTotalG = parseFloat($("#subTotalP").val());
    
    console.log("v_subTotalG",v_subTotalG)
    
    if ($("#indicaDescuento").attr("checked")==true){
        console.log("indicaDescuento = true")
        var v_importeFinal = parseFloat($("#importeFinal").val());
         console.log("v_importeFinal",v_importeFinal)
        if(isNaN(v_importeFinal)) {
            alert("Favor de calcular el descuento");
            return false;
        }else {
            v_subTotalG =  v_importeFinal;
        }
    }
    
    if(isNaN(v_subTotalG)){
        alert("Es necesario seleccionar un Ejemplar e indicar la cantidad");
    }else {
        var v_ivaTotalG = 0.0;
        var v_totalG = 0.0;
        console.log("v_subTotalG",v_subTotalG)
        console.log("v_ivaTotalG",v_ivaTotalG)
        console.log("v_totalG",v_totalG)
        if ($("#envioPagado").attr("checked")==true){
            if(!($("#gastosEnvio option:selected").val()=="null")){
                var v_importeGE = parseFloat($("#precioGE").val());
                var v_ivaGE = parseFloat($("#ivaGE").val());
                console.log("v_importeGE",v_importeGE)
                console.log("v_ivaGE",v_ivaGE)
                v_subTotalG = v_subTotalG+v_importeGE;
                v_ivaTotalG = v_ivaGE;
                v_totalG = v_ivaTotalG + v_subTotalG;
                console.log("v_subTotalG",v_subTotalG)
                console.log("v_ivaTotalG",v_ivaTotalG)
                console.log("v_totalG",v_totalG)
            }else {
                v_totalG = v_subTotalG;
            }
            
        }else {
            v_totalG = v_subTotalG;
        }
        $("#subTotalG").val(Math.round(v_subTotalG));
        $("#ivaTotalG").val(Math.round(v_ivaTotalG));
        $("#totalG").val(Math.round(v_totalG));
    }
}



function calcularTotalDetalleVentaEvento() {
    
    var v_subTotalG = parseFloat($("#subTotalP").val());
    console.log("v_subTotalG: ",v_subTotalG)
    
    if ($("#indicaDescuento").attr("checked")==true){
        console.log("indicaDescuento = true")
        var v_importeFinal = parseFloat($("#importeFinal").val());
         console.log("v_importeFinal",v_importeFinal)
        if(isNaN(v_importeFinal)) {
            alert("Favor de calcular el descuento");
            return false;
        }else {
            v_subTotalG =  v_importeFinal;
        }
    }
    
    console.log("v_subTotalG-desc: ",v_subTotalG)
    
    
     if(isNaN(v_subTotalG)){
        $("#subTotalG").val(""); 
        alert("Favor de seleccionar un Evento");
    }else {
        
        var v_ivaTotalG = parseFloat(0.0);
        var v_totalG = v_ivaTotalG + v_subTotalG;
        
        $("#subTotalG").val(Math.round(v_subTotalG));
        $("#ivaTotalG").val(Math.round(v_ivaTotalG));
        $("#totalG").val(Math.round(v_totalG));
        $("div#insertarAsistente").attr("style","display:");
    }
}



function calcularTotalDetalleVentaSus() {
    
    var v_subTotalG;
    
    if ($("#indicaDescuento").attr("checked")==true){
        v_subTotalG = parseFloat($("#importeFinal").val());
    }else {
        var cantidad = parseFloat($("#cantidad").val());
        var precio = parseFloat($("#precioUnitario").val());
        v_subTotalG = cantidad * precio;
    }
    
    $("#subTotalG").val(v_subTotalG.toFixed(2)); 
    var v_subTotalG = parseFloat($("#subTotalG").val());
    if(isNaN(v_subTotalG)){
        alert("Es necesario seleccionar una Suscripción");
    }else {
        
        var v_ivaTotalG = parseFloat(0.0);
        var v_totalG = v_ivaTotalG + v_subTotalG;
        
        $("#subTotalG").val(v_subTotalG.toFixed(2));
        $("#ivaTotalG").val(v_ivaTotalG.toFixed(2));
        $("#totalG").val(v_totalG.toFixed(2));
    }
}


function calcularImporteFinalConDescuento(tipoProducto) {
    
    console.log("tipoProducto: ",tipoProducto)
    var subtotal;
    
    if(tipoProducto=="suscripcion"){
         
        if($("#precioUnitario").val()=="") {
            alert("Favor de indicar el tipo de Suscripción");
            return false;
        }else {
            subtotal = parseFloat($("#precioUnitario").val());
            console.log("subtotal: ",subtotal)
        }
    }else {
        if($("#subTotalP").val()=="") {
            alert("Favor de indicar la cantidad de producto");
            $("#cantidad").focus()
            return false;
        }else {
            subtotal = parseFloat($("#subTotalP").val());
            console.log("subtotal: ",subtotal)
        }
    }
    
    if($("#descuento").val()=="") {
        alert("Favor de indicar el porcentaje de descuento");
    }else {
        var descuento = parseFloat($("#descuento").val());
        console.log("descuento: ",descuento)
        if (descuento == "0.00" || descuento == "0.0" || descuento == "0"){
            $("#impDescuento").val("");
            $("#importeFinal").val(subtotal.toFixed(2));
        }else {
            var importeDesc = subtotal*descuento/100;
            console.log("importeDesc",importeDesc)
            var importeFinal = subtotal-importeDesc;
            console.log("importeFinal",importeFinal)
            $("#impDescuento").val(importeDesc.toFixed(2));
            $("#importeFinal").val(importeFinal.toFixed(2));
        }
        if(tipoProducto=="suscripcion"){
            calcularTotalDetalleVentaSus();
        }
    }
}


function calcularPrecioUnitTotal() {
    if($("#iva option:selected").val()=="") {
        console.log("iva : Seleccionar...")
        $('#importeIva').val("");
        $('#precioUnitTotal').val("");
    }else {
        console.log("iva valido")
        var precio = parseFloat($('#precioUnitario').val());
        console.log("precio: ",precio)
        if (precio < 0 || isNaN(precio)){
            alert("El precio debe ser >= 0 y númerico")
            $('#precioUnitario').focus(); 
        }else {
            console.log("precio",precio)   
            var iva = parseFloat($("#iva option:selected").text());
            console.log("iva",iva)
            var importeIva = precio*iva;
            console.log("importeIva",importeIva)
            $('#importeIva').val(importeIva.toFixed(2));
            var total=importeIva+precio;
            console.log("total",total)
            $('#precioUnitTotal').val(total.toFixed(2));
        }
    }
}

function borrarPreciosProducto() {
    $('#importeIva').val("");
    $('#precioUnitTotal').val("");
    validarCampoEsPrecio($('#precioUnitario'));
}


/* LLAMADAS AJAX */   
           
/*  
function cargarProductosXAdquirir(x) {
    if(x) {
        $("div#productosXAdquirir").load("venta/cargarProductosXAdquirir.gsp",{facturaciondetven:"true"},function() {}); 
    }else {
        $("div#productosXAdquirir").load("venta/cargarProductosXAdquirir.gsp",{facturaciondetven:"false"},function() {}); 
    }
}  
 
function cambiarEdoSuscripAsig() {
    console.log("cambiarEdoSuscripAsig")
    var v_estadoOld = $("#estadoOld").val(); 
    console.log("v_estadoOld: ",v_estadoOld)
    var v_statusSusAsig = $("#statusSusAsig option:selected").text();
    console.log("v_statusSusAsig: ",v_statusSusAsig)
    var div_cancelacion = $("div#cancelacionSuscripAsig")
    console.log("div_cancelacion: ",div_cancelacion)
    if ((v_estadoOld=="VIGENTE" || v_estadoOld=="PENDIENTE" || v_estadoOld=="PENDIENTE") && v_statusSusAsig=="VENCIDA") {
        $(div_cancelacion).load("suscripcionAsignada/cancelarSuscripcionAsignada.gsp",{},function() {
            $(div_cancelacion).attr("style","display:")
            }); 
    }else {
        alert("Cambiar de: '"+v_estadoOld+"' a '"+v_statusSusAsig+"' no es posible.")
        $(div_cancelacion).empty()
        $(div_cancelacion).attr("style","display:none")
        $('#statusSusAsig').val(v_estadoOld)
        $(v_statusSusAsig).focus()
    }
}
  

function cargarParametrosBusquedaSuscripcion(x) {
    var v_idPublicacion = $(x).val();
    var div_paramBusSus = $("div#parametrosBusquedaSuscripcion")
    if(v_idPublicacion==""){
        div_paramBusSus.empty();
        $("div#suscipcionesEncontradas").empty();
    }else {
        $(div_paramBusSus).load("suscripcionAsignada/cargarParametrosBusquedaSuscripcion.gsp",{idPublicacion:v_idPublicacion},function() {
            $("div#suscipcionesEncontradas").empty();
        }); 
    }
}


  
function cargarCodigosProducto(x) {
    var v_idPublicacion = $(x).val();
    var div_codsProductos = $("div#codigosProductos")
    if(v_idPublicacion==""){
        $(div_codsProductos).empty();
        limpiarImportesProducto()
        limpiarImportesDescuento()
        limpiarImportesProducto()
        limpiarImportesGE()
    }else {
        $(div_codsProductos).load("suscripcionAsignada/cargarCodigosProductos.gsp",{
            idPublicacion:v_idPublicacion
        },function() {
            limpiarImportesProducto()
            limpiarImportesDescuento()
            limpiarImportesProducto()
            limpiarImportesGE()
        }); 
    }
}

  
  
function cargarPrecioCodigo(x,entidad) {
    var vidProducto = $(x).val();
    console.log("vidProducto",vidProducto)
   if (entidad!='suscripcionAsignada'&&entidad!='paquete'){
       $("#cantidad").val("");
       $("#subTotalP").val("");
       limpiarImportesProducto()
       limpiarImportesDescuento()
   }else {
       $("#subTotalP").val("");
   }
    
    var divPrecioCodigo = document.getElementById("divPrecioCodigo")
    var contenidos = divPrecioCodigo.childNodes;
    for(j=0; j<contenidos.length; j++){
        var contenido = contenidos.item(j);
        $(contenido).remove();
    }  
    
    $(divPrecioCodigo).load(entidad+"/cargarPrecioCodigo.gsp",{idProducto:vidProducto}); 
    
    /*
    if (entidad=='suscripcionAsignada'){
         $(divPrecioCodigo).load(entidad+"/cargarPrecioCodigo.gsp",{idProducto:vidProducto},function() {
            calcularTotalDetalleVentaSus()
        }); 
    }else {
         $(divPrecioCodigo).load(entidad+"/cargarPrecioCodigo.gsp",{idProducto:vidProducto}); 
    }*/
//}

/*
function buscarEstados() {
    console.log("buscarEstados")
    var v_idPais = $("#pais option:selected").val();
    console.log("v_idPais",v_idPais)
    if(v_idPais=="") {
        $("div#estados").attr("style","display:none");
        $("div#municipios").attr("style","display:none");
    }else {
        $("div#municipios").attr("style","display:none")
        $("div#estados").empty();
        $("div#estados").load("direccion/buscarEstadosXPais.gsp",{
            idPais:v_idPais
        },function() {
            $("div#estados").attr("style","display:");
        }); 
    }
}


function buscarSuscripcionesAsignadas() {
    console.log("== buscarSuscripcionesAsignadas() ==")
    if (validarCamposMinBusSusAsignada()) {
        var v_idPublicacion = $("#publicacion option:selected").val();
        console.log("v_idPublicacion",v_idPublicacion)
    
        var v_edIni = $("#edicionInicio option:selected").text();
        console.log("v_edIni",v_edIni)
    
        var v_edFin = $("#edicionFin option:selected").text();
        console.log("v_edFin",v_edFin)
    
        var v_status = $("#statusSusAsig option:selected").text();
        console.log("v_status",v_status)
    
        var v_tipo = $("#tipoSuscripcion option:selected").text();
        console.log("v_tipo",v_tipo)
    
        var v_codigo = $("#codigoSuscripcion option:selected").text();
        console.log("v_codigo",v_codigo)
    
        var v_idGrupo = $("#grupoSuscripcion option:selected").val();
        console.log("v_idGrupo",v_idGrupo)
    
        var v_idRuta = $("#rutaEnvio option:selected").val();
        console.log("v_idRuta",v_idRuta)
    
        var v_edFaltan = $("#edicionesFaltan option:selected").text();
        console.log("v_edFaltan",v_edFaltan)


        $("div#suscipcionesEncontradas").empty();
        $("div#suscipcionesEncontradas").load("suscripcionAsignada/buscarSuscripcionesAsignadas",{
            idPublicacion:v_idPublicacion,
            edIni:v_edIni,
            edFin:v_edFin,
            status:v_status,
            tipo:v_tipo,
            codigo:v_codigo,
            idGrupo:v_idGrupo,
            idRuta:v_idRuta,
            edFaltan:v_edFaltan
        },function() {}); 
    }else {
        alert("Favor de seleccionar al menos un parámetro");
    }
}


function buscarSuscriptoresList() {
    console.log("== buscarSuscriptoresList() ==")
    if (validarCamposMinBusSuscriptor()) {
        //var v_idPublicacion = $("#publicacion option:selected").val();
        //console.log("v_idPublicacion: ",v_idPublicacion)
    
        var v_idEstado = $("#estado option:selected").val();
        console.log("v_idEstado: ",v_idEstado)
    
        var v_nombre = $("#nombre").val();
        console.log("v_nombre",v_nombre)
    
        var v_apPaterno = $("#apePaterno").val();
        console.log("v_apPaterno: ",v_apPaterno)
        
        
        //var v_titulo = $("#titulo option:selected").text();
        //console.log("v_titulo: ",v_titulo)
        

        $("div#suscriptoresEncontrados").empty();
        $("div#suscriptoresEncontrados").load("suscriptor/buscarSuscriptoresList",{
            idEstado:v_idEstado,
            nombre:v_nombre,
            apPaterno:v_apPaterno
        },function() {}); 
    }else {
        alert("Favor de seleccionar al menos un parámetro");
    }
}


function validarCamposMinBusSusAsignada() {
    console.log("== validarCamposMinBusSusAsignada() ==")
    
    var v_idPublicacion = $("#publicacion option:selected").val();
    console.log("v_idPublicacion",v_idPublicacion)
    
    var v_edIni = $("#edicionInicio option:selected").val();
    console.log("v_edIni",v_edIni)
    
    var v_edFin = $("#edicionFin option:selected").val();
    console.log("v_edFin",v_edFin)
    
    var v_status = $("#statusSusAsig option:selected").val();
    console.log("v_status",v_status)
    
    var v_tipo = $("#tipoSuscripcion option:selected").val();
    console.log("v_tipo",v_tipo)
    
    var v_codigo = $("#codigoSuscripcion option:selected").val();
    console.log("v_codigo",v_codigo)
    
    var v_idGrupo = $("#grupoSuscripcion option:selected").val();
    console.log("v_idGrupo",v_idGrupo)
    
    var v_idRuta = $("#rutaEnvio option:selected").val();
    console.log("v_idRuta",v_idRuta)
    
    var v_edFaltan = $("#edicionesFaltan option:selected").val();
    console.log("v_edFaltan",v_edFaltan) 
    
    if(v_status=='' && v_tipo=='' && v_codigo=='' &&
        v_idGrupo=='' && v_idRuta=='' && v_edIni=='' &&
        v_edFin=='' && v_edFaltan=='') {
        return false
    }else {
        return true;
    }
}



function validarCamposMinBusSuscriptor() {
    console.log("== validarCamposMinBusSuscriptor() ==")
    
    //var v_idPublicacion = $("#publicacion option:selected").val();
    //console.log("v_idPublicacion: ",v_idPublicacion)
    
    var v_idEstado = $("#estado option:selected").val();
    console.log("v_idEstado: '",v_idEstado,"'")
    
    var v_nombre = $("#nombre").val();
    console.log("v_nombre: '",v_nombre,"'")
    
    var v_apPaterno = $("#apePaterno").val();
    console.log("v_apPaterno: '",v_apPaterno,"'")
    
    var v_titulo = $("#titulo option:selected").text();
    console.log("v_titulo: '",v_titulo,"'")
    
    if(v_idEstado=='' && v_nombre==''&&
        v_apPaterno=='' && v_titulo=='') {
        return false
    }else {
        return true;
    }
}


function buscarMunicipios(x) {
    console.log("buscarMunicipios")
    var v_idEstado = $("#estado option:selected").val();
    console.log("v_idEstado",v_idEstado)
    if(v_idEstado=="") {
        $("div#municipios").attr("style","display:none");
    }else {
        $("div#municipios").empty();
        $("div#municipios").load("direccion/buscarMunicipiosXEstado.gsp",{
            idEstado:v_idEstado
        },function() {
            $("div#municipios").attr("style","display:");
        });     
    }
}



function cargarImporteGastosEnvio(x){
    var v_idGastosEnvio = $(x).val();
    console.log("v_idGastosEnvio",v_idGastosEnvio);
    
   
    var contenedor = document.getElementById("importeGastosEnvio");
    console.log("contenedor",contenedor);
    
    if(v_idGastosEnvio == "null"){
        var contenidos = contenedor.childNodes;
        for(j=0; j<contenidos.length; j++){
            var contenido = contenidos.item(j);
            $(contenido).remove();
        }  
        limpiarImportesGE();
        contenedor.style.display = "none";
    }else {
        contenedor.style.display = "";
        $(contenedor).load("gastosEnvio/importesGastosEnvio.gsp",{idGastosEnvio:v_idGastosEnvio});
        console.log("funcion ejecutada");
    }
    
    limpiarImportesProducto();
    
}


function limpiarImportesGE() {
    $("#precioGE").val("");
    $("#ivaGE").val("");
    $("#totalGE").val("");
}

function limpiarImportesProducto() {
    $("#subTotalG").val("");
    $("#ivaTotalG").val("");
    $("#totalG").val("");
}

function limpiarImportesDescuento() {
    $("#descuento").val("");
    $("#impDescuento").val("");
    $("#importeFinal").val("");
}



function cargarEdiciones(x){
    var idElement = $(x).attr("id")
    console.log("idElement",idElement)    
    var v_codigoProducto = $("#"+idElement+" option:selected").val()
    console.log("v_codigoProducto",v_codigoProducto) 
    $.post('ejemplar/cargarEdiciones.gsp?codigoProducto='+v_codigoProducto,
    function(data){$("div#ediciones").html(data);}); 
}


function buscarFacturacion(v_tipoRef){
    if(validarCampoEsRFCBusqueda("#rfcXBuscar")) {
        var v_rfc = $("#rfcXBuscar").val();
        console.log("v_rfc: ", v_rfc);
        var v_div_nuevoRFC = document.getElementById("nuevo"+v_tipoRef);
        var v_div_buscarRFC = document.getElementById("buscar"+v_tipoRef);
        console.log("v_div_rfc: ", v_div_buscarRFC);
        v_div_buscarRFC.style.display = "";
        v_div_nuevoRFC.style.display = "none";
        
        $(v_div_buscarRFC).removeData();
        $(v_div_buscarRFC).empty();
       
        $(v_div_buscarRFC).load("facturacion/buscarFacturacion.gsp",{rfc:v_rfc,tipoReferencia:v_tipoRef});
        $(v_div_buscarRFC).dialog({
            modal: true, 
            title: 'Datos de facturación',
            buttons: {
                "Cancelar": function() {
                    $(this).dialog("close");
                }
            },
            width: 650
        });
    }else {
    }
}


function buscarCliente(v_tipoRef){
    
    
    var v_div = 'div#insertar'+v_tipoRef;
    
   
    if(validarCampoEsTexto($(v_div).find("#nombreXBuscar"))) {
        
        var v_nombre = $(v_div).find("#nombreXBuscar").val();
        var v_apPaterno = $(v_div).find("#apPaternoXBuscar").val();
         
        var v_div_nuevo = document.getElementById("nuevo"+v_tipoRef);
        var v_div_busca = document.getElementById("buscar"+v_tipoRef);
        
        console.log("v_div_nuevo: ", v_div_nuevo);
        console.log("v_div_busca: ", v_div_busca);
        
        v_div_nuevo.style.display = "none";
        v_div_busca.style.display = "";
       
       $(v_div_busca).removeData();
       $(v_div_busca).empty();
       
       var entidad="";
       var gsp ="";
        
        if(v_tipoRef=="Comprador"){
            entidad = "comprador";
            gsp = "Compradores";
        }else if (v_tipoRef=="Asistente"){
            entidad = "asistente";
            gsp = "Asistentes";
        }else if (v_tipoRef=="Suscriptor"){
            entidad = "suscriptor";
            gsp = "Suscriptores";
        }else if (v_tipoRef=="Cobranza"){
            entidad = "referencia";
            gsp = "Referencias";
        }else if (v_tipoRef=="Contacto"){
            entidad = "referencia";
            gsp = "Referencias";
        }
        
        $(v_div_busca).load(entidad+"/buscar"+gsp,{nombre:v_nombre,apPaterno:v_apPaterno,tipoReferencia:v_tipoRef});
        $(v_div_busca).dialog({
            modal: true, 
            title: v_tipoRef,
            buttons: {
                "Cancelar": function() {
                    $(this).dialog("close");
                }
            },
            width: 550
        });
    }else {
    }
}





function listCliente(v_tipoRef) {
    if(validarCampoEsTexto("#nombreXBuscar") 
        && validarCampoEsTexto("#apPaternoXBuscar")) {
        
        var v_nombre = $("#nombreXBuscar").val();
        var v_apPaterno = $("#apPaternoXBuscar").val();
         
       var entidad="";
       var gsp ="";
        
        if(v_tipoRef=="Comprador"){
            entidad = "comprador";
            gsp = "Compradores";
        }else if (v_tipoRef=="Asistente"){
            entidad = "asistente";
            gsp = "Asistentes";
        }else if (v_tipoRef=="Suscriptor"){
            entidad = "suscriptor";
            gsp = "Suscriptores";
        }else if (v_tipoRef=="Cobranza"){
            entidad = "referencia";
            gsp = "Referencias";
        }else if (v_tipoRef=="Contacto"){
            entidad = "referencia";
            gsp = "Referencias";
        }
        
        var v_div_list = document.getElementById("list"+gsp);
        
        console.log("v_div_list: ", v_div_list);
        
       $(v_div_list).removeData();
       $(v_div_list).empty();
        
        $(v_div_list).load(entidad+"/list"+gsp,{nombre:v_nombre,apPaterno:v_apPaterno,tipoReferencia:v_tipoRef});
    }else {
    }
}


    
 /* UTIL */
   
    
  /*  
 function convertirFechaStringToArray(fechaStr,separador) {
        
        var myHash = new Hash();
        
        // meses
        myHash.setItem("Ene","01");
        myHash.setItem("Feb","02");
        myHash.setItem("Mar","03");
        myHash.setItem("Abr","04");
        myHash.setItem("May","05");
        myHash.setItem("Jun","06");
        myHash.setItem("Jul","07");
        myHash.setItem("Ago","08");
        myHash.setItem("Sep","09");
        myHash.setItem("Oct","10");
        myHash.setItem("Nov","11");
        myHash.setItem("Dic","12");
        // dias
        myHash.setItem("1","01");
        myHash.setItem("2","02");
        myHash.setItem("3","03");
        myHash.setItem("4","04");
        myHash.setItem("5","05");
        myHash.setItem("6","06");
        myHash.setItem("7","07");
        myHash.setItem("8","08");
        myHash.setItem("9","09");
 

        var fechaArray = new Array();
        fechaArray = fechaStr.split(separador);
        // Insertar 0 al día
        if(!(myHash.getItem(fechaArray[0])==null)){
               fechaArray[0]=myHash.getItem(fechaArray[0])
        }
        // Insertar valor númerico del mes
        fechaArray[1] = myHash.getItem(fechaArray[1]); 
        return fechaArray;

    }        


// Hash en Java Script    
/* Usos
 * myHash.setItem('foobar', 'hey'));
    for (var i in myHash.items) {
        alert('key is: ' + i + ', value is: ' + myHash.items[i]);
    }
		
    for (var i = 0; i < myHash.length; i++) {
	alert('key is: ' + i + ', value is: ' + myHash.items[i]);
    }
		
    for (var i = 0; i < myHash.length; i++) {
	alert('key is: ' + i + ', value is: ' + myHash.getItem(i));
    }
 */

/*
function Hash() {
	this.length = 0;
	this.items = new Array();
	for (var i = 0; i < arguments.length; i += 2) {
		if (typeof(arguments[i + 1]) != 'undefined') {
			this.items[arguments[i]] = arguments[i + 1];
			this.length++;
		}
	}
	this.removeItem = function(in_key)
	{
		var tmp_previous;
		if (typeof(this.items[in_key]) != 'undefined') {
			this.length--;
			var tmp_previous = this.items[in_key];
			delete this.items[in_key];
		}
	   
		return tmp_previous;
	}
	this.getItem = function(in_key) {
		return this.items[in_key];
	}
	this.setItem = function(in_key, in_value)
	{
		var tmp_previous;
		if (typeof(in_value) != 'undefined') {
			if (typeof(this.items[in_key]) == 'undefined') {
				this.length++;
			}
			else {
				tmp_previous = this.items[in_key];
			}
			this.items[in_key] = in_value;
		}
		return tmp_previous;
	}
	this.hasItem = function(in_key)
	{
		return typeof(this.items[in_key]) != 'undefined';
	}
	this.clear = function()
	{
		for (var i in this.items) {
			delete this.items[i];
		}
		this.length = 0;
	}
}
    
    
    
// Regresar un array con los campos separados    
function tokenizer(cadena,separador)  {
    var cadenaDividida = cadena.split(separador);
    return cadenaDividida;
}




/* PRESENTACIÓN DINÁMICA DE PANTALLAS */
/*

function cargaAlCentro(liga) {     
      $("div#contenidoCentro").load(liga);
}    
    

function borrarFechasXCambioAnio() {
    $(".fecha").val("");
    var anio = $("#anio");
    validarFormatoAnio(anio);
  }



function agregarProducto(producto){
    var contenedorTemp = $("div#contenedorTemp")
    //$("div#altaGastosEnvio").attr("style","display:none")
    $(contenedorTemp).removeData();
    $(contenedorTemp).empty();
    $("div#alta"+producto).removeData();
    var altaProductoClon = $("div#alta"+producto).clone();
    $(altaProductoClon).attr("style","display:")
    $(altaProductoClon).appendTo(contenedorTemp)
}



function intercambiarDatosPersonaFisicaMoral(tipoPersona){
    var valorSeleccionado = tipoPersona.value;
    
    if (valorSeleccionado=="MORAL") {
        
        $("div#fisica").attr("style","display:none")
        $("div#moral").attr("style","display:")
        $("#rfc").val("");
    }else {
        
        $("div#fisica").attr("style","display:")
        $("div#moral").attr("style","display:none")
        $("#rfc").val("");
    }
}

function indicarEnvioPagado(check,v_tipoCliente){
    console.log("== indicarEnvioPagado ==");
    
    if(check.checked==true){
        $("div#altaGastosEnvio").attr("style","display:")
        $("div#insertar"+v_tipoCliente).attr("style","display:")
    }else {
        $("div#altaGastosEnvio").attr("style","display:none")
        $("div#importeGastosEnvio").attr("style","display:none")
        $("div#insertar"+v_tipoCliente).attr("style","display:none")
        $("div#buscar"+v_tipoCliente).attr("style","display:none")
        $("div#nuevo"+v_tipoCliente).attr("style","display:none")
        
        $("#gastosEnvio").val("null");
        limpiarImportesGE();
        limpiarImportesProducto();
    }
}


function indicarDescuento(check,v_tipoCliente){
    console.log("== indicarDescuento ==");
    if(check.checked==true){
        $("div#altaDescuento").attr("style","display:")
        limpiarImportesDescuento();
        limpiarImportesProducto();
    }else {
        $("div#altaDescuento").attr("style","display:none") 
        $("#altaDescuento").val("null");
        limpiarImportesDescuento();
        limpiarImportesProducto();
    }
}


function indicarFacturacionRequerida() {    
    var v_reqFac = $("#requiereFacturacion option:selected").text();
    
    if(v_reqFac=="SI"){
        $("div#insertarFacturacion").attr("style","display:")
        cargarProductosXAdquirir(true)
    }else if (v_reqFac=="NO"){
        $("#rfcXBuscar").val("");
        $("div#insertarFacturacion").attr("style","display:none")
        $("div#nuevoFacturacion").attr("style","display:none")
        $("div#buscarFacturacion").attr("style","display:none")
        $("div#nuevoFacturacion").empty()
        $("div#buscarFacturacion").empty()
        $("div#productosXAdquirir").empty()
        cargarProductosXAdquirir(false)
    }else if (v_reqFac=="Seleccionar...") {
        $("#rfcXBuscar").val("");
        $("div#insertarFacturacion").attr("style","display:none")
        $("div#nuevoFacturacion").attr("style","display:none")
        $("div#buscarFacturacion").attr("style","display:none")
        $("div#nuevoFacturacion").empty()
        $("div#buscarFacturacion").empty()
        $("div#productosXAdquirir").empty()
        
    }
}


function indicarReferenciaRequerida(check,v_tipoRef) {
    var v_div_inserRef = document.getElementById("insertar"+v_tipoRef)
    var v_div_nuevoRef = document.getElementById("nuevo"+v_tipoRef);
    if(check.checked==true){
        v_div_inserRef.style.display = "";
    }else {
        $("#"+v_tipoRef+"XBuscar").val("");
        v_div_inserRef.style.display = "none";
        v_div_nuevoRef.style.display = "none";
    }
}






function cargarFacturacion(v_idCliente,v_tipoRef) {
    $("#rfcXBuscar").val("");
    $("div#buscar"+v_tipoRef).dialog("close");
    $("div#nuevo"+v_tipoRef).attr("style","display:")
    var v_tipoCliente = v_tipoRef.toUpperCase();
    $.post('cliente/altaCliente.gsp?idCliente='+v_idCliente+'&tipoCliente='+v_tipoCliente+'&tipoDireccion=FACTURACION',function(data){$("div#nuevo"+v_tipoRef).html(data);});
}


function cargarCliente(v_idCliente,v_tipoRef) {
    
    console.log("== cargarCliente ==");
    console.log("v_idCliente",v_idCliente);
    console.log("v_tipoRef",v_tipoRef);

    var v_div = 'div#insertar'+v_tipoRef;

    $(v_div).find("#nombreXBuscar").val("");
    $(v_div).find("#apPaternoXBuscar").val("");

    $("div#buscar"+v_tipoRef).dialog("close");
    $("div#nuevo"+v_tipoRef).attr("style","display:")
    
    var v_tipoCliente = v_tipoRef.toUpperCase();
    $.post('cliente/altaCliente.gsp?idCliente='+v_idCliente+'&tipoCliente='+v_tipoCliente+'&tipoDireccion='+v_tipoRef,function(data){$("div#nuevo"+v_tipoRef).html(data);});
}



function cerrarVenta() {
    
    console.log("== cerraVenta ==")
    var v_formaPago = $("#formaPago option:selected").val();
    var v_banco = $("#banco").val();
    var v_ruta = 'venta/cerrarVenta?formaPago='+v_formaPago+"&banco="+v_banco;
    console.log("v_ruta: "+v_ruta)      
    
    if ($("#requiereFacturacion").attr("checked")==true){
       var v_tipoCliente = "Facturacion";
       var v_rfc = $("#rfc").val(); 
       v_ruta = v_ruta+'&facturacion=true'+
                '&rfc='+v_rfc+
                '&tipoCliente='+v_tipoCliente;
       v_ruta = cargarDetVentCliente(v_ruta,v_tipoCliente);
       //v_ruta = cargarDetVentDireccion(v_ruta,v_tipoCliente); 
       console.log("v_ruta-rfc: "+v_ruta) 
    }
    if ($("#requiereCobranza").attr("checked")==true){
       var v_tipoCliente = "Cobranza";
       v_ruta = v_ruta+'&cobranza=true'+
                '&tipoCliente='+v_tipoCliente;
       v_ruta = cargarDetVentCliente(v_ruta,v_tipoCliente)
       v_ruta = cargarDetVentDireccion(v_ruta,v_tipoCliente) 
       console.log("v_ruta-cobranza: "+v_ruta) 
    }
    if ($("#requiereContacto").attr("checked")==true){
       var v_tipoCliente = "Contacto";
       v_ruta = v_ruta+'&contacto=true';
                '&tipoCliente='+v_tipoCliente;
       v_ruta = cargarDetVentCliente(v_ruta,v_tipoCliente)
       v_ruta = cargarDetVentDireccion(v_ruta,v_tipoCliente)  
        console.log("v_ruta-contacto: "+v_ruta) 
    }
    
    cargaAlCentro(v_ruta)
}



function crearDetalleVenta(v_tipoProducto,v_tipoCliente){
    
    var v_idProducto = $("#producto option:selected").val();
    var v_observacionDV = $("#observacionDV").val();
    var v_cantidad = $("#cantidad").val();
    
    var v_envioPagado = "false";
    var v_idGastosEnvio = "";
   
    var v_ruta = 'detalleVenta/crearDetalleVenta?'+
                 'idProducto='+v_idProducto+
                 '&cantidad='+v_cantidad+
                 '&tipoCliente='+v_tipoCliente+
                 '&observacionDV='+v_observacionDV;
    
     if(v_tipoProducto=="suscripcionAsignada" || v_tipoProducto=="paquete") {
         var v_grupoSuscripcion = $("#grupoSuscripcion option:selected").val();
         var v_rutaEnvio = $("#rutaEnvio option:selected").val();
         var v_idPublicacion = $("#publicacion option:selected").val();
         v_ruta = v_ruta + '&idGrupoSuscripcion='+v_grupoSuscripcion;
         v_ruta = v_ruta + '&idRutaEnvio='+v_rutaEnvio;
         v_ruta = v_ruta + '&idPublicacion='+v_idPublicacion;
         
         if ($("#pdf").attr("checked")==true){
            v_ruta = v_ruta + '&pdf=true';
        }else {
            v_ruta = v_ruta + '&pdf=false';
        }
     }
    
    
    if(v_tipoProducto=="suscripcionAsignada" || v_tipoProducto=="evento" || v_tipoProducto=="paquete"){
        v_envioPagado = "true";
    }else {
        if ($("#envioPagado").attr("checked")==true){
          if($("#gastosEnvio option:selected").val()!=null
             && $("#gastosEnvio option:selected").val()!=""){
              v_envioPagado = "true";
              v_idGastosEnvio = $("#gastosEnvio option:selected").val();
          }
      }
    }
    
   if (v_tipoProducto == "evento"){
        var v_idTipoAsistencia = $("#tipoAsistencia option:selected").val();
        v_ruta = v_ruta + '&idTipoAsistencia='+v_idTipoAsistencia;
    }
   
    
    if ($("#indicaDescuento").attr("checked")==true){
        var porcentDescuento = $("#descuento").val();
        var importeFinal = $("#importeFinal").val();
        v_ruta = v_ruta + '&descuento=true'+
            '&porcentDescuento='+porcentDescuento+
            '&importeFinal='+importeFinal;
        
    }else {
        v_ruta = v_ruta + '&descuento=false';
    }
    
    console.log("v_ruta-INI: ", v_ruta);
    
    if (v_envioPagado=="false"){
        v_ruta = v_ruta+'&envioPagado='+v_envioPagado;
        console.log("v_ruta-FIN: ", v_ruta);
        v_ruta = v_ruta + "&existeCliente=false";
        v_ruta = v_ruta + "&existeDireccion=false";
        $.post(v_ruta,function(data){
            vaciarContenedorTemp(v_tipoCliente)
            $("div#contenedor").append(data);
        }); 
        
    }else if (v_envioPagado=="true" && esClienteValido(v_tipoCliente) && esDireccionValida(v_tipoCliente)){
        
        v_ruta = cargarDetVentCliente(v_ruta,v_tipoCliente)
        v_ruta = cargarDetVentDireccion(v_ruta,v_tipoCliente)
        v_ruta = v_ruta + "&existeCliente=true";
        v_ruta = v_ruta + "&existeDireccion=true";
        
        v_ruta = cargarTelefonos(v_ruta,v_tipoCliente)
        v_ruta = cargarEmails(v_ruta,v_tipoCliente)
        v_ruta = v_ruta+'&envioPagado='+v_envioPagado+'&idGastosEnvio='+v_idGastosEnvio;
        console.log("v_ruta-FIN: ", v_ruta);
    
        $.post(v_ruta,function(data){
            vaciarContenedorTemp(v_tipoCliente)
            $("div#contenedor").append(data);
        }); 
    }
}


function cargarDetVentCliente(v_ruta,v_tipoCliente) {
    
    var v_div = 'div#nuevo'+v_tipoCliente;
    console.log("v_div: "+v_div)
    var v_display = $('div#buscar'+v_tipoCliente).attr("style")
    console.log("v_display: "+v_display)
    if(v_display=="display:"){
        v_div = 'div#buscar'+v_tipoCliente;
    }
    
    var v_idCliente = $(v_div).find("#idCliente").val();
    if (v_idCliente == null){
        v_idCliente = "";
    }

    var v_tipoPerComp = $(v_div).find("#tipoPersona");
    var v_tipoPersona = "";
    if($(v_tipoPerComp).is("select")) {
        v_tipoPersona = $(v_div).find("#tipoPersona option:selected").val();
    }else if ($(v_tipoPerComp).is("input")) {
        v_tipoPersona = $(v_div).find("#tipoPersona").val();
    }

    if (v_tipoPersona == "FISICA"){
        var v_titulo = $(v_div).find("#titulo option:selected").val()
        var v_nombre = $(v_div).find("#nombreCliente").val();
        var v_apellidoPaterno = $(v_div).find("#apellidoPaterno").val();
        var v_apellidoMaterno = $(v_div).find("#apellidoMaterno").val();
        var v_fechaNac = $(v_div).find("#fechaNacimiento").val();
        var v_puesto = $(v_div).find("#puesto").val();
        var v_empresa = $(v_div).find("#empresa").val();
                
       
        console.log("v_idCliente",v_idCliente)
        console.log("v_tipoPersona",v_tipoPersona)
        console.log("v_titulo",v_titulo)
        console.log("v_nombre",v_nombre)
        console.log("v_apellidoPaterno",v_apellidoPaterno)
        console.log("v_apellidoMaterno",v_apellidoMaterno)
        console.log("v_fechaNac",v_fechaNac)
        console.log("v_puesto",v_puesto)
        console.log("v_empresa",v_empresa)
         v_ruta = v_ruta+
        '&idCliente'+v_tipoCliente+'='+v_idCliente+
        '&tipoPersona'+v_tipoCliente+'='+v_tipoPersona+
        '&titulo'+v_tipoCliente+'='+v_titulo+
        '&nombre'+v_tipoCliente+'='+v_nombre+
        '&apellidoPaterno'+v_tipoCliente+'='+v_apellidoPaterno+
        '&apellidoMaterno'+v_tipoCliente+'='+v_apellidoMaterno+
        '&fechaNacimiento'+v_tipoCliente+'='+v_fechaNac+
        '&puesto'+v_tipoCliente+'='+v_puesto+
        '&empresa'+v_tipoCliente+'='+v_empresa;
                
        console.log("v_ruta-DOS",v_ruta)
        
       
    }else {
        var v_razonSocial = $(v_div).find("#razonSocial").val();
        var v_fechaAniversario = $(v_div).find("#fechaAniversario").val();
                
         v_ruta = v_ruta+'&tipoPersona'+v_tipoCliente+'='+v_tipoPersona+
        '&razonSocial'+v_tipoCliente+'='+v_razonSocial+
        '&fechaNacimiento'+v_tipoCliente+'='+v_fechaAniversario;
        console.log("v_ruta-TRES: ",v_ruta);
        
        
    }
    return v_ruta;
}




function cargarDetVentDireccion(v_ruta,v_tipoCliente) {
     
     var v_div = 'div#nuevo'+v_tipoCliente;
    console.log("v_div: "+v_div)
    var v_display = $('div#buscar'+v_tipoCliente).attr("style")
    console.log("v_display: "+v_display)
    if(v_display=="display:"){
        v_div = 'div#buscar'+v_tipoCliente;
    } 
     
    var v_idDireccion = $(v_div).find("#idDireccion").val();
    if (v_idDireccion == null){
        v_idDireccion = "";
    } 
     
    var v_calle = $(v_div).find("#calle").val();
    var v_numeroInterior = $(v_div).find("#numeroInterior").val();
    var v_numeroExterior = $(v_div).find("#numeroExterior").val();
    var v_colonia = $(v_div).find("#colonia").val();
    var v_codigoPostal = $(v_div).find("#codigoPostal").val();
    
    var v_pais = $(v_div).find("#pais option:selected").val();
    var v_estado = $(v_div).find("#estado option:selected").val();
    var v_municipio =  $(v_div).find("#municipio option:selected").val();
    
    var v_tipoDireccion = $(v_div).find("#tipoDireccion").val();
     
    console.log("v_calle",v_calle)
    console.log("v_numeroInterior",v_numeroInterior)
    console.log("v_numeroExterior",v_numeroExterior)
    console.log("v_colonia",v_colonia)
    console.log("v_codigoPostal",v_codigoPostal)
    console.log("v_municipio",v_municipio)
    console.log("v_estado",v_estado)
    console.log("v_pais",v_pais)
    console.log("v_tipoDireccion",v_tipoDireccion)
     
    var v_rutaDir = v_ruta+
    '&idDireccion'+v_tipoCliente+'='+v_idDireccion+
    '&calle'+v_tipoCliente+'='+v_calle+
    '&numeroInterior'+v_tipoCliente+'='+v_numeroInterior+
    '&numeroExterior'+v_tipoCliente+'='+v_numeroExterior+
    '&colonia'+v_tipoCliente+'='+v_colonia+
    '&codigoPostal'+v_tipoCliente+'='+v_codigoPostal+
    '&municipio'+v_tipoCliente+'='+v_municipio+
    '&estado'+v_tipoCliente+'='+v_estado+
    '&pais'+v_tipoCliente+'='+v_pais+
    '&tipoDireccion'+v_tipoCliente+'='+v_tipoDireccion;
       
    console.log("v_ruta-DIR: ",v_ruta);  
       
    return v_rutaDir;

}


function cargarTelefonos(v_ruta,v_tipoCliente) {
    var v_div_tels = $("#telefonos");
    var telefonos = $(v_div_tels).find(".telefono");
    console.log("telefonos: ",telefonos);
    var j=0;
    for(i=1; i<telefonos.size(); i++) {
        if ($(telefonos[i]).find('#numero').val()!="") {
            v_ruta += '&usoTel'+v_tipoCliente+''+i+'='+$(telefonos[i]).find('#usoTel').val();
            v_ruta += '&tipoTel'+v_tipoCliente+''+i+'='+$(telefonos[i]).find('#tipoTel').val();
            v_ruta += '&lada'+v_tipoCliente+''+i+'='+$(telefonos[i]).find('#lada').val();
            v_ruta += '&numero'+v_tipoCliente+''+i+'='+$(telefonos[i]).find('#numero').val();
            v_ruta += '&extension'+v_tipoCliente+''+i+'='+$(telefonos[i]).find('#extension').val();
            j++;
        }
    }
    v_ruta = v_ruta + '&numTels'+v_tipoCliente+'='+j;
    return v_ruta;
}


function cargarEmails(v_ruta,v_tipoCliente) {
    var v_div_emails = $("#emails");
    var emails = $(v_div_emails).find(".email");
    console.log("emails: ",emails);
    var j=0;
    for(i=1; i<emails.size(); i++) {
        if ($(emails[i]).find('#correo').val()!="") {
            v_ruta += '&correo'+v_tipoCliente+''+i+'='+$(emails[i]).find('#correo').val();
            v_ruta += '&tipoCorreo'+v_tipoCliente+''+i+'='+$(emails[i]).find('#tipoCorreo').val();
            j++;
        }
    }
    v_ruta = v_ruta + '&numEmails'+v_tipoCliente+'='+j;
    return v_ruta;
}




function insertarTelefono(){
    console.log("insertarTelefono")
    var v_div_tel = $("#telefonoTemp");
    console.log("v_div_tel: ",v_div_tel);
    var v_div_tels = $("#telefonos");
    console.log("v_div_tels: ",v_div_tels)
    v_div_tel.attr("id","telefono");
    v_div_tel.attr("class","telefono");
    v_div_tel.attr("style","display:");
    console.log("v_div_tel-display: ",v_div_tel)
    $(v_div_tel).appendTo(v_div_tels); 
}

function insertarEmail(){
    console.log("insertarEmail")
    var v_div_email = $("#emailTemp");
    console.log("v_div_email: ",v_div_email);
    var v_div_emails = $("#emails");
    console.log("v_div_emails: ",v_div_emails)
    v_div_email.attr("id","email");
    v_div_email.attr("class","email");
    v_div_email.attr("style","display:");
    $(v_div_email).appendTo(v_div_emails); 
}

function vaciarContenedorTemp(v_tipoCliente) {
    $("#nombreXBuscar").val("");
    $("#apPaternoXBuscar").val("");
    
    $("div#altaGastosEnvio").attr("style","display:none")
    $("div#importeGastosEnvio").attr("style","display:none")
   
    $("div#buscarSuscriptor").removeData();
    $("div#buscarSuscriptor").empty();
    
    $("div#nuevoSuscriptor").removeData();
    $("div#nuevoSuscriptor").empty();
   
    $("div#contenedorTemp").removeData();
    $("div#contenedorTemp").empty();
}

function esClienteValido(v_tipoCliente) {
    
    console.log("esClienteValido",v_tipoCliente)
    
    var v_div = 'div#nuevo'+v_tipoCliente;
    var v_display = $('div#buscar'+v_tipoCliente).attr("style")
    if(v_display=="display:"){
        v_div = 'div#buscar'+v_tipoCliente;
    } 
        
    var v_tipoPerComp = $(v_div).find("#tipoPersona");
    var v_tipoPersona = "";
    if($(v_tipoPerComp).is("select")) {
        v_tipoPersona = $(v_div).find("#tipoPersona option:selected").val();
    }else if ($(v_tipoPerComp).is("input")) {
        v_tipoPersona = $(v_div).find("#tipoPersona").val();
    }    
        
    if (v_tipoPersona=="FISICA") {
        var v_nombre = $(v_div).find("#nombreCliente").val();
        var v_apellidoPaterno = $(v_div).find("#apellidoPaterno").val();
        //var v_apellidoMaterno = $(v_div).find("#apellidoMaterno").val();
        console.log("v_nombre",v_nombre)
        console.log("v_apellidoPaterno",v_apellidoPaterno)
        //console.log("v_apellidoMaterno",v_apellidoMaterno)
        if(v_nombre==""||v_apellidoPaterno=="") {
            if(v_nombre==""){
                alert("Falta el 'Nombre' del cliente.");
                $(v_nombre).focus();
                return false;
            }
            if(v_apellidoPaterno=="") {
                alert("Falta el 'Apellido Paterno' del cliente.");
                $(v_apellidoPaterno).focus();
                return false;
            }
        }else {
            return true;
        }
    }else {
        var v_razonSocial = $(v_div).find("#razonSocial").val();
        console.log("v_razonSocial",v_razonSocial)
        if(v_razonSocial=="") {
            alert("Falta la 'Razón Social' del cliente");
            $(v_razonSocial).focus();
            return false;
        }else {
            return true;
        }
    }
}



function esDireccionValida(v_tipoCliente) {
    
    console.log("esDireccionValida",v_tipoCliente)
    
    var v_div = 'div#nuevo'+v_tipoCliente;
     
    var v_display = $('div#buscar'+v_tipoCliente).attr("style")
    if(v_display=="display:"){
        v_div = 'div#buscar'+v_tipoCliente;
    } 
        
    console.log("v_div",v_div)    
        
    var v_calle = $(v_div).find("#calle").val();
    var v_numeroInterior = $(v_div).find("#numeroInterior").val();
    var v_colonia = $(v_div).find("#colonia").val();
    var v_codigoPostal = $(v_div).find("#codigoPostal").val();
    
    var v_pais = $(v_div).find("#pais option:selected").val();
    var v_estado = $(v_div).find("#estado option:selected").val();
    var v_municipio =  $(v_div).find("#municipio option:selected").val();
    
    console.log("v_calle",v_calle)
    console.log("v_numeroInterior",v_numeroInterior)
    console.log("v_colonia",v_colonia)
    console.log("v_codigoPostal",v_codigoPostal)
    console.log("v_municipio",v_municipio)
    console.log("v_estado",v_estado)
    console.log("v_pais",v_pais)
    
    if(v_calle==""
        ||v_numeroInterior==""
        ||v_colonia==""
        ||v_codigoPostal==""
        ||v_municipio==""
        ||v_estado==""
        ||v_pais=="") {
        alert("Faltan datos de la dirección");
        return false;
    }else {
        return true;
    }
}

*/

