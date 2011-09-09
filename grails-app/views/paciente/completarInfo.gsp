

<%@ page import="impulso.Paciente" %>
<%@ page import="impulso.Receta" %>
<%@ page import="impulso.Direccion" %>


<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('cita/listRecepDocs');">
      Citas de Hoy
    </a>
  </span> 
</div>



<h1>Completar Información del Paciente</h1>
<br></br>

<table>
<tr>
  <td class="etiqueta" width="80px">
    <label for="fechaReal"><g:message code="cita.fechaReal.label" default="Fecha-Hora Llegada" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaReal', 'errors')}">
<% 
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd , hh:mm a")
Date date = new Date() 
String fechaActual = sdf.format(date)
%>
    <input name="fechaReal" size="30" value="${fechaActual}" class="noEditable" readonly="true"/>
  </td>
</tr>
</table>

<h2>Paciente</h2>
    <g:hiddenField name="idPaciente" id="idPaciente" value="${pacienteInstance.id}" />
    
    <% 
java.text.SimpleDateFormat sdf1=new java.text.SimpleDateFormat("yyyy-MM-dd")
Date date1 = new Date() 
String fechaActual1 = sdf1.format(date1)
%>
    
    <g:hiddenField name="fechaActual" id="fechaActual" value="${fechaActual1}" />
    <table>
      <tbody>
        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="paciente.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'nombre', 'errors')}">
      <g:textField name="nombre" size="30" maxlength="70" value="${pacienteInstance?.nombre}" onchange="validarCampo(this,'texto','Nombre')" />*
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="apePaterno"><g:message code="paciente.apePaterno.label" default="Apellido Paterno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apePaterno', 'errors')}">
      <g:textField name="apePaterno"  size="30" maxlength="70" value="${pacienteInstance?.apePaterno}"  onchange="validarCampo(this,'texto','Apellido Paterno')"/>*
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="apeMaterno"><g:message code="paciente.apeMaterno.label" default="Apellido Materno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apeMaterno', 'errors')}">
      <g:textField name="apeMaterno"  size="30" maxlength="70" value="${pacienteInstance?.apeMaterno}" onchange="validarCampo(this,'texto','Apellido Materno')" />
          </td>
        </tr>
      
        
       <tr>
  <td class="etiqueta" width="100px">
    <label for="telefono"><g:message code="paciente.telefono.label" default="Teléfono" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'telefono', 'errors')}">
<g:textField name="telefono" onchange="validarCampo(this,'texto','Teléfono')" size="35" maxlength="70" value="${pacienteInstance?.telefono}" />
</td>
</tr>


<tr>
  <td class="etiqueta" width="100px">
    <label for="celular"><g:message code="paciente.celular.label" default="Celular" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'celular', 'errors')}">
<g:textField name="celular" onchange="validarCampo(this,'texto','Celular')" size="35" maxlength="70" value="${pacienteInstance?.celular}" />
</td>
</tr> 

        <tr >
          <td class="etiqueta">
            <label for="edad"><g:message code="paciente.edad.label" default="Edad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'edad', 'errors')}">
            <g:textField name="edad" id="edad" size="3" maxlength="3" onchange="validarCampo(this,'edad','Edad')" value="" />*
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="sexo"><g:message code="paciente.sexo.label" default="Sexo" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'sexo', 'errors')}">
            <g:select name="sexo" id="sexo" from="${pacienteInstance.constraints.sexo.inList}" value="${pacienteInstance?.sexo}" valueMessagePrefix="paciente.sexo" />
          </td>
        </tr>
      
         <tr >
          <td class="etiqueta">
            <label for="tipoPaciente"><g:message code="paciente.tipoPaciente.label" default="Tipo Paciente" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'tipoPaciente', 'errors')}">
      <g:select name="tipoPaciente" id="tipoPaciente" from="${impulso.TipoPaciente.list()}" optionKey="id" optionValue="nombre" value="${pacienteInstance?.tipoPaciente?.id}"  />*
          </td>
        </tr>
        
        <tr >
          <td class="etiqueta">
            <label for="rango"><g:message code="paciente.rango.label" default="Rango" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'rango', 'errors')}">
      <g:select name="rango" id="rango" from="${pacienteInstance.constraints.rango.inList}" value="${pacienteInstance?.rango}" valueMessagePrefix="paciente.rango" />*
          </td>
        </tr>
      
        <!--
        <tr >
          <td class="etiqueta">
            <label for="procedencia"><g:message code="paciente.procedencia.label" default="Procedencia" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'procedencia', 'errors')}">
      <g:textField name="procedencia" maxlength="50" value="${pacienteInstance?.procedencia}" />
          </td>
        </tr>
        -->
      
      </tbody>
    </table>


<h2>Dirección</h2>  
<% def direccionInstance = null
   direccion = pacienteInstance?.direccion  
   if (direccionInstance == null) {
     direccionInstance = new Direccion()
   }
%>

<table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="calle"><g:message code="direccion.calle.label" default="Calle" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'calle', 'errors')}">
      <g:textField name="calle" size="50" maxlength="100" onchange="validarCampo(this,'textoLibre','Calle')" value="${direccionInstance?.calle}" />*
          </td>
       
          <td class="etiqueta">
            <label for="numExt"><g:message code="direccion.numExt.label" default="#" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'numExt', 'errors')}">
      <g:textField name="numExt" maxlength="25" onchange="validarCampo(this,'textoLibre','#')" value="${direccionInstance?.numExt}" />*
          </td>
          <td class="etiqueta">
            <label for="numInt"><g:message code="direccion.numInt.label" default="Int." /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'numInt', 'errors')}">
      <g:textField name="numInt" maxlength="25" onchange="validarCampo(this,'textoLibre','Int.')" value="${direccionInstance?.numInt}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="colonia"><g:message code="direccion.colonia.label" default="Colonia" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'colonia', 'errors')}">
      <g:textField name="colonia" size="50" maxlength="100" onchange="validarCampo(this,'textoLibre','Colonia')" value="${direccionInstance?.colonia}" />*
          </td>
          <td class="etiqueta">
            <label for="cp"><g:message code="direccion.cp.label" default="CP" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'cp', 'errors')}">
      <g:textField name="cp" maxlength="5" value="${direccionInstance?.cp}" onchange="validarCampo(this,'codigoPostal','Código Postal')"/>*
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="ciudad"><g:message code="direccion.ciudad.label" default="Ciudad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'ciudad', 'errors')}">
      <g:textField name="ciudad" size="50" maxlength="100" onchange="validarCampo(this,'textoLibre','Ciudad')" value="${direccionInstance?.ciudad}" />*
          </td>
          <td class="etiqueta">
            <label for="estado"><g:message code="direccion.estado.label" default="Estado" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'estado', 'errors')}">
      <g:select name="estado" from="${direccionInstance.constraints.estado.inList}" value="${direccionInstance?.estado}" valueMessagePrefix="direccion.estado"  />*
          </td>
        
          <td class="etiqueta">
            <label for="pais"><g:message code="direccion.pais.label" default="País" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'pais', 'errors')}">
      <g:select name="pais" from="${direccionInstance.constraints.pais.inList}" value="${direccionInstance?.pais}" valueMessagePrefix="direccion.pais"  />*
          </td>
        </tr>
      
        
      
      </tbody>
    </table>


<br></br>
<h2> Receta </h2>
<% def recetaInstance = new Receta() %>


<table border="0">
     <tbody>
 <tr >
          <td class="etiqueta">
            <label for="fechaReceta"><g:message code="receta.fechaReceta.label" default="Fecha Receta" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'fechaReceta', 'errors')}">
      <g:textField size="20" onmouseover="calendarioReceta(this)" value="" id="fechaReceta" name="fechaReceta" readonly="true" />*
          </td>
      </tr>
      <tr>
      
          <td class="etiqueta">
            <label for="folio"><g:message code="receta.folio.label" default="Folio" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'folio', 'errors')}">
      <g:textField name="folio" size="30" maxlength="50" onchange="validarCampo(this,'serie','Folio')" value="${recetaInstance?.folio}" />*
      </td>
      </tr>
      <tr>
          <td class="etiqueta">
            <label for="matricula"><g:message code="receta.matricula.label" default="Matrícula" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'matricula', 'errors')}">
      <g:textField name="matricula" size="30" maxlength="50" onchange="validarCampo(this,'serie','Matrícula')" value="${recetaInstance?.matricula}" />*
          </td>
        </tr>
        <tr >
          <td class="etiqueta">
            <label for="caracter"><g:message code="receta.caracter.label" default="Caracter" /></label>
          </td>
          <td valign="top" colspan="3" class="value ${hasErrors(bean: recetaInstance, field: 'caracter', 'errors')}">
      <g:select name="caracter" from="${recetaInstance.constraints.caracter.inList}" value="${recetaInstance?.caracter}" valueMessagePrefix="receta.caracter"  />*
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">Auxiliar Auditivo</td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'auxiliarAuditivo', 'errors')}">
      <g:select name="tipoAuxAud" id="tipoAuxAud" from="${impulso.TipoAuxAud.list()}" optionValue="modelo" optionKey="id" value="${pacienteInstance?.tipoAuxAud?.id}"  />*
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="escalonServSanidad"><g:message code="receta.escalonServSanidad.label" default="Escalon Serv Sanidad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'escalonServSanidad', 'errors')}">
      <g:select name="escalonServSanidad" id="escalonServSanidad" optionValue="nombreInst" from="${impulso.EscalonServicioSanidad.list()}" optionKey="id" value="${recetaInstance?.escalonServSanidad?.id}"  />*
          </td>
        </tr>

        <tr >
          <td class="etiqueta">
            <label for="observaciones"><g:message code="receta.observaciones.label" default="Observaciones" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'observaciones', 'errors')}">
      <g:textField name="observaciones" id="observaciones" size="80" maxlength="200" value="${recetaInstance?.observaciones}" onchange="validarCampo(this,'textoLibre','Observaciones')"/>
          </td>
        </tr>
     
      </tbody>
    </table>

<h2>Médico Militar</h2>
<table>
  <tbody>
      
      <tr> 
          <td class="etiqueta">
            <label for="nombre"><g:message code="medicoMilitar.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'nombre', 'errors')}">
      <g:textField name="nombreMM" size="25" id="nombreMM" maxlength="70" value="${medicoMilitarInstance?.nombre}" onchange="validarCampo(this,'texto','Nombre')" />*
          </td>
          <td class="etiqueta">
            <label for="apePaterno"><g:message code="medicoMilitar.apePaterno.label" default="Paterno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'apePaterno', 'errors')}">
      <g:textField name="apePaternoMM" size="25" id="apePaternoMM" maxlength="70" value="${medicoMilitarInstance?.apePaterno}" onchange="validarCampo(this,'texto','Apellido Paterno')" />*
          </td>
          <td class="etiqueta">
            <label for="apeMaterno"><g:message code="medicoMilitar.apeMaterno.label" default="Materno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'apeMaterno', 'errors')}">
      <g:textField name="apeMaternoMM" size="25" id="apeMaternoMM" maxlength="70" value="${medicoMilitarInstance?.apeMaterno}" onchange="validarCampo(this,'texto','Apellido Materno')" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="area"><g:message code="medicoMilitar.area.label" default="Area" /></label>
          </td>
          <td valign="top" colspan="4" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'area', 'errors')}">
      <g:textField name="areaMM" id="areaMM" size="70" maxlength="70" value="${medicoMilitarInstance?.area}" />*
          </td>
        </tr>
       
      </tbody>
    </table>

<div class="nav">
  <button type="button" style="font-size: 9px" onclick="javascript:guardarInfoCompletaPaciente();">
    Guardar
  </button>   
</div>

