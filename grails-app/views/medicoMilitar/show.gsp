
<%@ page import="impulso.MedicoMilitar" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'medicoMilitar.label', default: 'MedicoMilitar')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('medicoMilitar/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('medicoMilitar/create');" >
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
      <td class="etiqueta"><g:message code="medicoMilitar.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: medicoMilitarInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="medicoMilitar.nombre.label" default="Nombre" /></td>
  
<td>${fieldValue(bean: medicoMilitarInstance, field: "nombre")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="medicoMilitar.apePaterno.label" default="Ape Paterno" /></td>
  
<td>${fieldValue(bean: medicoMilitarInstance, field: "apePaterno")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="medicoMilitar.apeMaterno.label" default="Ape Materno" /></td>
  
<td>${fieldValue(bean: medicoMilitarInstance, field: "apeMaterno")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="medicoMilitar.area.label" default="Area" /></td>
  
<td>${fieldValue(bean: medicoMilitarInstance, field: "area")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('medicoMilitar/edit/'+${medicoMilitarInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

