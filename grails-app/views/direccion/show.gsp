
<%@ page import="impulso.Direccion" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('direccion/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('direccion/create');" >
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
      <td class="etiqueta"><g:message code="direccion.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.calle.label" default="Calle" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "calle")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.numExt.label" default="Num Ext" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "numExt")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.numInt.label" default="Num Int" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "numInt")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.colonia.label" default="Colonia" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "colonia")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.cp.label" default="Cp" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "cp")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.ciudad.label" default="Ciudad" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "ciudad")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.pais.label" default="Pais" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "pais")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="direccion.estado.label" default="Estado" /></td>
  
<td>${fieldValue(bean: direccionInstance, field: "estado")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('direccion/edit/'+${direccionInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

