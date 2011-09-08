

<%@ page import="impulso.EscalonServicioSanidad" %>


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


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${escalonServicioSanidadInstance}">
  <div class="errors">
    <g:renderErrors bean="${escalonServicioSanidadInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdateescalonServicioSanidad">
  <g:hiddenField name="id" value="${escalonServicioSanidadInstance?.id}" />
  <g:hiddenField name="version" value="${escalonServicioSanidadInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="codigoESS"><g:message code="escalonServicioSanidad.codigoESS.label" default="Codigo ESS" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: escalonServicioSanidadInstance, field: 'codigoESS', 'errors')}">
    <g:textField name="codigoESS" maxlength="30" value="${escalonServicioSanidadInstance?.codigoESS}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="zonaMilitar"><g:message code="escalonServicioSanidad.zonaMilitar.label" default="Zona Militar" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: escalonServicioSanidadInstance, field: 'zonaMilitar', 'errors')}">
    <g:textField name="zonaMilitar" maxlength="30" value="${escalonServicioSanidadInstance?.zonaMilitar}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="nombreInst"><g:message code="escalonServicioSanidad.nombreInst.label" default="Nombre Inst" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: escalonServicioSanidadInstance, field: 'nombreInst', 'errors')}">
    <g:textField name="nombreInst" maxlength="100" value="${escalonServicioSanidadInstance?.nombreInst}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="domicilioInst"><g:message code="escalonServicioSanidad.domicilioInst.label" default="Domicilio Inst" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: escalonServicioSanidadInstance, field: 'domicilioInst', 'errors')}">
    <g:textField name="domicilioInst" value="${escalonServicioSanidadInstance?.domicilioInst}" />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('escalonServicioSanidad','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('escalonServicioSanidad','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
