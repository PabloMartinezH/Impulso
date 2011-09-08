
<%@ page import="impulso.Documento" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('documento/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('documento/create');" >
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
      <td class="etiqueta"><g:message code="documento.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: documentoInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="documento.ordenDoc.label" default="Orden Doc" /></td>
  
<td>${fieldValue(bean: documentoInstance, field: "ordenDoc")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="documento.codigoDoc.label" default="Codigo Doc" /></td>
  
<td>${fieldValue(bean: documentoInstance, field: "codigoDoc")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="documento.nombreDoc.label" default="Nombre Doc" /></td>
  
<td>${fieldValue(bean: documentoInstance, field: "nombreDoc")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="documento.caracteristicas.label" default="Caracteristicas" /></td>
  
<td>${fieldValue(bean: documentoInstance, field: "caracteristicas")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="documento.tipoCita.label" default="Tipo Cita" /></td>
  
<td><g:link controller="tipoCita" action="show" id="${documentoInstance?.tipoCita?.id}">${documentoInstance?.tipoCita?.encodeAsHTML()}</g:link></td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('documento/edit/'+${documentoInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

