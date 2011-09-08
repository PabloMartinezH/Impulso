

<%@ page import="impulso.Receta" %>


<g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('receta/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('receta/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${recetaInstance}">
  <div class="errors">
    <g:renderErrors bean="${recetaInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdatereceta">
  <g:hiddenField name="id" value="${recetaInstance?.id}" />
  <g:hiddenField name="version" value="${recetaInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="caracter"><g:message code="receta.caracter.label" default="Caracter" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'caracter', 'errors')}">
    <g:select name="caracter" from="${recetaInstance.constraints.caracter.inList}" value="${recetaInstance?.caracter}" valueMessagePrefix="receta.caracter"  />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="fechaReceta"><g:message code="receta.fechaReceta.label" default="Fecha Receta" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'fechaReceta', 'errors')}">
    <g:datePicker name="fechaReceta" precision="day" value="${recetaInstance?.fechaReceta}"  />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="folio"><g:message code="receta.folio.label" default="Folio" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'folio', 'errors')}">
    <g:textField name="folio" maxlength="50" value="${recetaInstance?.folio}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="matricula"><g:message code="receta.matricula.label" default="Matricula" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'matricula', 'errors')}">
    <g:textField name="matricula" maxlength="50" value="${recetaInstance?.matricula}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="observaciones"><g:message code="receta.observaciones.label" default="Observaciones" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'observaciones', 'errors')}">
    <g:textField name="observaciones" maxlength="200" value="${recetaInstance?.observaciones}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="auxiliarAuditivo"><g:message code="receta.auxiliarAuditivo.label" default="Auxiliar Auditivo" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'auxiliarAuditivo', 'errors')}">
    <g:select name="auxiliarAuditivo.id" from="${impulso.AuxiliarAuditivo.list()}" optionKey="id" value="${recetaInstance?.auxiliarAuditivo?.id}"  />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="escalonServSanidad"><g:message code="receta.escalonServSanidad.label" default="Escalon Serv Sanidad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'escalonServSanidad', 'errors')}">
    <g:select name="escalonServSanidad.id" from="${impulso.EscalonServicioSanidad.list()}" optionKey="id" value="${recetaInstance?.escalonServSanidad?.id}"  />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="medicoMilitar"><g:message code="receta.medicoMilitar.label" default="Medico Militar" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: recetaInstance, field: 'medicoMilitar', 'errors')}">
    <g:select name="medicoMilitar.id" from="${impulso.MedicoMilitar.list()}" optionKey="id" value="${recetaInstance?.medicoMilitar?.id}"  />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('receta','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('receta','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
