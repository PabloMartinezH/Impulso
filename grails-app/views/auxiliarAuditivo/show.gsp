
<%@ page import="impulso.AuxiliarAuditivo" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('auxiliarAuditivo/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('auxiliarAuditivo/create');" >
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
      <td class="etiqueta"><g:message code="auxiliarAuditivo.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: auxiliarAuditivoInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="auxiliarAuditivo.marca.label" default="Marca" /></td>
  
<td>${fieldValue(bean: auxiliarAuditivoInstance, field: "marca")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="auxiliarAuditivo.tiposAuxAud.label" default="Tipos Aux Aud" /></td>
  
<td valign="top" style="text-align: left;" >
  <ul>
    <g:each in="${auxiliarAuditivoInstance.tiposAuxAud}" var="t">
      <li><g:link controller="tipoAuxAud" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
    </g:each>
  </ul>
</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('auxiliarAuditivo/edit/'+${auxiliarAuditivoInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

