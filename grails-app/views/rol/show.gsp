
<%@ page import="impulso.Rol" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('rol/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('rol/create');" >
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
      <td class="etiqueta"><g:message code="rol.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: rolInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="rol.authority.label" default="Authority" /></td>
  
<td>${fieldValue(bean: rolInstance, field: "authority")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="rol.nombre.label" default="Nombre" /></td>
  
<td>${fieldValue(bean: rolInstance, field: "nombre")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('rol/edit/'+${rolInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

