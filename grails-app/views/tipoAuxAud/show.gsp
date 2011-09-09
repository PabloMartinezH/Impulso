
<%@ page import="impulso.TipoAuxAud" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'tipoAuxAud.label', default: 'TipoAuxAud')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('tipoAuxAud/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('tipoAuxAud/create');" >
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
      <td class="etiqueta"><g:message code="tipoAuxAud.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: tipoAuxAudInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoAuxAud.modelo.label" default="Modelo" /></td>
  
<td>${fieldValue(bean: tipoAuxAudInstance, field: "modelo")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoAuxAud.nombre.label" default="Nombre" /></td>
  
<td>${fieldValue(bean: tipoAuxAudInstance, field: "nombre")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('tipoAuxAud/edit/'+${tipoAuxAudInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

