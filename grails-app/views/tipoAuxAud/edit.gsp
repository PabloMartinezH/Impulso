

<%@ page import="impulso.TipoAuxAud" %>


<g:set var="entityName" value="${message(code: 'tipoAuxAud.label', default: 'TipoAuxAud')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('tipoAuxAud/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('tipoAuxAud/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${tipoAuxAudInstance}">
  <div class="errors">
    <g:renderErrors bean="${tipoAuxAudInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdatetipoAuxAud">
  <g:hiddenField name="id" value="${tipoAuxAudInstance?.id}" />
  <g:hiddenField name="version" value="${tipoAuxAudInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="modelo"><g:message code="tipoAuxAud.modelo.label" default="Modelo" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoAuxAudInstance, field: 'modelo', 'errors')}">
    <g:textField name="modelo" maxlength="20" value="${tipoAuxAudInstance?.modelo}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="tipoAuxAud.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoAuxAudInstance, field: 'nombre', 'errors')}">
    <g:textField name="nombre" maxlength="200" value="${tipoAuxAudInstance?.nombre}" />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('tipoAuxAud','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('tipoAuxAud','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
