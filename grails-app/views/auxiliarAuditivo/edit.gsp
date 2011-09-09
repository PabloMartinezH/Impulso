

<%@ page import="impulso.AuxiliarAuditivo" %>


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


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${auxiliarAuditivoInstance}">
  <div class="errors">
    <g:renderErrors bean="${auxiliarAuditivoInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdateauxiliarAuditivo">
  <g:hiddenField name="id" value="${auxiliarAuditivoInstance?.id}" />
  <g:hiddenField name="version" value="${auxiliarAuditivoInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="marca"><g:message code="auxiliarAuditivo.marca.label" default="Marca" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: auxiliarAuditivoInstance, field: 'marca', 'errors')}">
    <g:textField name="marca" maxlength="100" value="${auxiliarAuditivoInstance?.marca}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="tiposAuxAud"><g:message code="auxiliarAuditivo.tiposAuxAud.label" default="Tipos Aux Aud" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: auxiliarAuditivoInstance, field: 'tiposAuxAud', 'errors')}">
    <g:select name="tiposAuxAud" from="${impulso.TipoAuxAud.list()}" multiple="yes" optionKey="id" size="5" value="${auxiliarAuditivoInstance?.tiposAuxAud*.id}" />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('auxiliarAuditivo','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('auxiliarAuditivo','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
