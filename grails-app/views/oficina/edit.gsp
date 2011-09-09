

<%@ page import="impulso.Oficina" %>


<g:set var="entityName" value="${message(code: 'oficina.label', default: 'Oficina')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('oficina/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('oficina/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${oficinaInstance}">
  <div class="errors">
    <g:renderErrors bean="${oficinaInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdateoficina">
  <g:hiddenField name="id" value="${oficinaInstance?.id}" />
  <g:hiddenField name="version" value="${oficinaInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="sucursal"><g:message code="oficina.sucursal.label" default="Sucursal" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: oficinaInstance, field: 'sucursal', 'errors')}">
    <g:textField name="sucursal" maxlength="50" value="${oficinaInstance?.sucursal}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="direccion"><g:message code="oficina.direccion.label" default="Direccion" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: oficinaInstance, field: 'direccion', 'errors')}">
    <g:textField name="direccion" maxlength="200" value="${oficinaInstance?.direccion}" />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('oficina','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('oficina','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
