
<%@ page import="impulso.Estado" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('estado/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('estado/create');" >
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
      <td class="etiqueta"><g:message code="estado.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: estadoInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="estado.nombre.label" default="Nombre" /></td>
  
<td>${fieldValue(bean: estadoInstance, field: "nombre")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="estado.boton.label" default="Boton" /></td>
  
<td>${fieldValue(bean: estadoInstance, field: "boton")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="estado.secuencia.label" default="Secuencia" /></td>
  
<td>${fieldValue(bean: estadoInstance, field: "secuencia")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('estado/edit/'+${estadoInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

