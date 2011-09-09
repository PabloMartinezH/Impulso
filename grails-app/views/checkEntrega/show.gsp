
<%@ page import="impulso.CheckEntrega" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'checkEntrega.label', default: 'CheckEntrega')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('checkEntrega/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('checkEntrega/create');" >
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
      <td class="etiqueta"><g:message code="checkEntrega.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: checkEntregaInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="checkEntrega.secuencia.label" default="Secuencia" /></td>
  
<td>${fieldValue(bean: checkEntregaInstance, field: "secuencia")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="checkEntrega.descripcion.label" default="Descripcion" /></td>
  
<td>${fieldValue(bean: checkEntregaInstance, field: "descripcion")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="checkEntrega.necesario.label" default="Necesario" /></td>
  
<td><g:formatBoolean boolean="${checkEntregaInstance?.necesario}" /></td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('checkEntrega/edit/'+${checkEntregaInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

