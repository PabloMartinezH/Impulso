
<%@ page import="impulso.Empresa" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('empresa/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('empresa/create');" >
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
      <td class="etiqueta"><g:message code="empresa.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: empresaInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="empresa.codigoEmp.label" default="Codigo Emp" /></td>
  
<td>${fieldValue(bean: empresaInstance, field: "codigoEmp")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="empresa.nombreEmp.label" default="Nombre Emp" /></td>
  
<td>${fieldValue(bean: empresaInstance, field: "nombreEmp")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('empresa/edit/'+${empresaInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

