

<%@ page import="impulso.Paciente" %>


<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('paciente/list');">
      Pacientes
    </a>
  </span> 
</div>

<br/>
<h1>Actualizar datos del Paciente</h1>
<br/>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${pacienteInstance}">
  <div class="errors">
    <g:renderErrors bean="${pacienteInstance}" as="list" />
  </div>
</g:hasErrors>
<br/>
<form id="formupdatepaciente">
  <g:hiddenField name="id" value="${pacienteInstance?.id}" />
  <g:hiddenField name="version" value="${pacienteInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="paciente.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'nombre', 'errors')}">
    <g:textField name="nombre" size="30" maxlength="70" value="${pacienteInstance?.nombre}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="apePaterno"><g:message code="paciente.apePaterno.label" default="Ape Paterno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apePaterno', 'errors')}">
    <g:textField name="apePaterno" size="30" maxlength="70" value="${pacienteInstance?.apePaterno}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="apeMaterno"><g:message code="paciente.apeMaterno.label" default="Ape Materno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apeMaterno', 'errors')}">
    <g:textField name="apeMaterno" size="30" maxlength="70" value="${pacienteInstance?.apeMaterno}" />
          </td>
        </tr>
    
        
        <tr >
          <td class="etiqueta">
            <label for="edad"><g:message code="paciente.edad.label" default="Edad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'edad', 'errors')}">
     <g:textField name="edad" id="edad" size="3" maxlength="3" onchange="validarCampo(this,'edad','Edad')" value="${pacienteInstance?.edad}" />*
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
            <label for="rango"><g:message code="paciente.rango.label" default="Rango" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'rango', 'errors')}">
    <g:select name="rango" from="${pacienteInstance.constraints.rango.inList}" value="${pacienteInstance?.rango}" valueMessagePrefix="paciente.rango" noSelection="['': '']" />
          </td>
        </tr>
    

        <tr>
      <td class="etiqueta"><g:message code="paciente.direccion.label" default="Dirección" /></td>
  
<td><% if(pacienteInstance?.direccion != null ) { %>
          <p style="font-size: 9x">
${pacienteInstance.direccion.calle},
Num. ${pacienteInstance.direccion.numExt},
<%if(!(pacienteInstance.direccion.numInt).isEmpty()) {%>
  Int. ${pacienteInstance.direccion.numInt},
<% } %>
Col. ${pacienteInstance.direccion.colonia},
CP: ${pacienteInstance.direccion.cp},
Ciudad: ${pacienteInstance.direccion.ciudad},
${pacienteInstance.direccion.estado},
${pacienteInstance.direccion.pais},
          </p>
  <% } %></td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.receta.label" default="Receta" /></td>
  
      <td>
<% 
def folio = pacienteInstance?.receta?.folio
System.out.println("Folio: "+folio)
if ((folio != null) && (!folio.isEmpty())) { 
%>
  - Tipo Aux Aud:  ${pacienteInstance?.receta?.tipoAuxAud?.modelo} <br/>
  - Folio:         ${pacienteInstance?.receta?.folio} <br/>
  - Matrícula:     ${pacienteInstance?.receta?.matricula} <br/>
  - Caracter:      ${pacienteInstance?.receta?.caracter} <br/>
  - Fecha Receta:  <g:formatDate format="dd-MMM-yyyy" date="${pacienteInstance?.receta?.fechaReceta}" /> <br/>
  - Serv. Sanidad: ${pacienteInstance?.receta?.escalonServSanidad?.zonaMilitar} <br/>
  - Médico:        ${pacienteInstance?.receta?.medicoMilitar?.nombre} 
  ${pacienteInstance?.receta?.medicoMilitar?.apePaterno}
  ${pacienteInstance?.receta?.medicoMilitar?.apeMaterno} / 
  ${pacienteInstance?.receta?.medicoMilitar?.area}
<% } %>
  </td>
    
</tr>
    
         <tr >
          <td class="etiqueta">
            <label for="tipoPaciente"><g:message code="paciente.tipoPaciente.label" default="Tipo Paciente" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'tipoPaciente', 'errors')}">
      <g:select name="tipoPaciente.id" id="tipoPaciente" from="${impulso.TipoPaciente.list()}" optionKey="id" optionValue="nombre" value="${pacienteInstance?.tipoPaciente?.id}"  />*
          </td>
        </tr>
    
        
        <tr>
      <td class="etiqueta"><g:message code="paciente.estado.label" default="Estado" /></td>
  
<td valign="top" style="text-align: left;" >
  Paso: ${pacienteInstance?.estado?.secuencia} / ${pacienteInstance?.estado?.nombre}
</td>
    
</tr>
    
        <tr >
          <td class="etiqueta">
            <label for="telefonos"><g:message code="paciente.telefonos.label" default="Telefonos" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'telefonos', 'errors')}">
    
<ul>
<g:each in="${pacienteInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="telefono" action="create" params="['paciente.id': pacienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>

          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('paciente','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <!--
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('paciente','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
    -->
  </div>
<form>
