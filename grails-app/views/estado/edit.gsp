

<%@ page import="impulso.Estado" %>


<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('estado/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('estado/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${estadoInstance}">
  <div class="errors">
    <g:renderErrors bean="${estadoInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdateestado">
  <g:hiddenField name="id" value="${estadoInstance?.id}" />
  <g:hiddenField name="version" value="${estadoInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="estado.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: estadoInstance, field: 'nombre', 'errors')}">
    <g:textField name="nombre" maxlength="100" value="${estadoInstance?.nombre}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="boton"><g:message code="estado.boton.label" default="Boton" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: estadoInstance, field: 'boton', 'errors')}">
    <g:textField name="boton" maxlength="20" value="${estadoInstance?.boton}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="secuencia"><g:message code="estado.secuencia.label" default="Secuencia" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: estadoInstance, field: 'secuencia', 'errors')}">
    <g:select name="secuencia" from="${1..20}" value="${fieldValue(bean: estadoInstance, field: 'secuencia')}"  />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('estado','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('estado','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
