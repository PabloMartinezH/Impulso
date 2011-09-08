
<%@ page import="impulso.EscalonServicioSanidad" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'escalonServicioSanidad.label', default: 'EscalonServicioSanidad')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('escalonServicioSanidad/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('escalonServicioSanidad/create');" >
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
      <td class="etiqueta"><g:message code="escalonServicioSanidad.id.label" default="Id" /></td>
  
<td>${fieldValue(bean: escalonServicioSanidadInstance, field: "id")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="escalonServicioSanidad.codigoESS.label" default="Codigo ESS" /></td>
  
<td>${fieldValue(bean: escalonServicioSanidadInstance, field: "codigoESS")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="escalonServicioSanidad.zonaMilitar.label" default="Zona Militar" /></td>
  
<td>${fieldValue(bean: escalonServicioSanidadInstance, field: "zonaMilitar")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="escalonServicioSanidad.nombreInst.label" default="Nombre Inst" /></td>
  
<td>${fieldValue(bean: escalonServicioSanidadInstance, field: "nombreInst")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="escalonServicioSanidad.domicilioInst.label" default="Domicilio Inst" /></td>
  
<td>${fieldValue(bean: escalonServicioSanidadInstance, field: "domicilioInst")}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('escalonServicioSanidad/edit/'+${escalonServicioSanidadInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

