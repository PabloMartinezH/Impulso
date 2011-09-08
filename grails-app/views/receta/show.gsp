
<%@ page import="impulso.Receta" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

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


  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
  <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
</g:if>

<table>
  <tbody>

    <tr>
      <td class="etiqueta"><g:message code="receta.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: recetaInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.caracter.label" default="Caracter" /></td>
  
<td>${fieldValue(bean: recetaInstance, field: "caracter")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.fechaReceta.label" default="Fecha Receta" /></td>
  
<td><g:formatDate format="dd-MMM-yyyy" date="${recetaInstance?.fechaReceta}" /></td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.folio.label" default="Folio" /></td>
  
<td>${fieldValue(bean: recetaInstance, field: "folio")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.matricula.label" default="Matricula" /></td>
  
<td>${fieldValue(bean: recetaInstance, field: "matricula")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.observaciones.label" default="Observaciones" /></td>
  
<td>${fieldValue(bean: recetaInstance, field: "observaciones")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.auxiliarAuditivo.label" default="Auxiliar Auditivo" /></td>
  
<td><g:link controller="auxiliarAuditivo" action="show" id="${recetaInstance?.auxiliarAuditivo?.id}">${recetaInstance?.auxiliarAuditivo?.encodeAsHTML()}</g:link></td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.escalonServSanidad.label" default="Escalon Serv Sanidad" /></td>
  
<td><g:link controller="escalonServicioSanidad" action="show" id="${recetaInstance?.escalonServSanidad?.id}">${recetaInstance?.escalonServSanidad?.encodeAsHTML()}</g:link></td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="receta.medicoMilitar.label" default="Medico Militar" /></td>
  
<td><g:link controller="medicoMilitar" action="show" id="${recetaInstance?.medicoMilitar?.id}">${recetaInstance?.medicoMilitar?.encodeAsHTML()}</g:link></td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('receta/edit/'+${recetaInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

