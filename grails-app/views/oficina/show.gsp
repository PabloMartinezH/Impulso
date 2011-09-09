
<%@ page import="impulso.Oficina" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'oficina.label', default: 'Oficina')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('oficina/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('oficina/create');" >
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
      <td class="etiqueta"><g:message code="oficina.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: oficinaInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="oficina.sucursal.label" default="Sucursal" /></td>
  
<td>${fieldValue(bean: oficinaInstance, field: "sucursal")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="oficina.direccion.label" default="Direccion" /></td>
  
<td>${fieldValue(bean: oficinaInstance, field: "direccion")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('oficina/edit/'+${oficinaInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

