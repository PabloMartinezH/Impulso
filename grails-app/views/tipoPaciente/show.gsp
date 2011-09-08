
<%@ page import="impulso.TipoPaciente" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'tipoPaciente.label', default: 'TipoPaciente')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('tipoPaciente/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('tipoPaciente/create');" >
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
      <td class="etiqueta"><g:message code="tipoPaciente.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: tipoPacienteInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoPaciente.codigo.label" default="Codigo" /></td>
  
<td>${fieldValue(bean: tipoPacienteInstance, field: "codigo")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoPaciente.nombre.label" default="Nombre" /></td>
  
<td>${fieldValue(bean: tipoPacienteInstance, field: "nombre")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('tipoPaciente/edit/'+${tipoPacienteInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

