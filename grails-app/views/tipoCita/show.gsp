
<%@ page import="impulso.TipoCita" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'tipoCita.label', default: 'TipoCita')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('tipoCita/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('tipoCita/create');" >
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
      <td class="etiqueta"><g:message code="tipoCita.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: tipoCitaInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoCita.codigo.label" default="Codigo" /></td>
  
<td>${fieldValue(bean: tipoCitaInstance, field: "codigo")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoCita.nombre.label" default="Nombre" /></td>
  
<td>${fieldValue(bean: tipoCitaInstance, field: "nombre")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoCita.secuencia.label" default="Secuencia" /></td>
  
<td>${fieldValue(bean: tipoCitaInstance, field: "secuencia")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="tipoCita.documentos.label" default="Documentos" /></td>
  
<td valign="top" style="text-align: left;" >
  <ul>
    <g:each in="${tipoCitaInstance.documentos}" var="d">
      <li><g:link controller="documento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
    </g:each>
  </ul>
</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('tipoCita/edit/'+${tipoCitaInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

