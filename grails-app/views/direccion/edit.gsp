

<%@ page import="impulso.Direccion" %>


<g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('direccion/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('direccion/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${direccionInstance}">
  <div class="errors">
    <g:renderErrors bean="${direccionInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdatedireccion">
  <g:hiddenField name="id" value="${direccionInstance?.id}" />
  <g:hiddenField name="version" value="${direccionInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="calle"><g:message code="direccion.calle.label" default="Calle" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'calle', 'errors')}">
    <g:textField name="calle" maxlength="100" value="${direccionInstance?.calle}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="numExt"><g:message code="direccion.numExt.label" default="Num Ext" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'numExt', 'errors')}">
    <g:textField name="numExt" maxlength="25" value="${direccionInstance?.numExt}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="numInt"><g:message code="direccion.numInt.label" default="Num Int" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'numInt', 'errors')}">
    <g:textField name="numInt" maxlength="25" value="${direccionInstance?.numInt}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="colonia"><g:message code="direccion.colonia.label" default="Colonia" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'colonia', 'errors')}">
    <g:textField name="colonia" maxlength="100" value="${direccionInstance?.colonia}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="cp"><g:message code="direccion.cp.label" default="Cp" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'cp', 'errors')}">
    <g:textField name="cp" maxlength="5" value="${direccionInstance?.cp}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="ciudad"><g:message code="direccion.ciudad.label" default="Ciudad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'ciudad', 'errors')}">
    <g:textField name="ciudad" maxlength="25" value="${direccionInstance?.ciudad}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="pais"><g:message code="direccion.pais.label" default="Pais" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'pais', 'errors')}">
    <g:select name="pais" from="${direccionInstance.constraints.pais.inList}" value="${direccionInstance?.pais}" valueMessagePrefix="direccion.pais"  />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="estado"><g:message code="direccion.estado.label" default="Estado" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: direccionInstance, field: 'estado', 'errors')}">
    <g:select name="estado" from="${direccionInstance.constraints.estado.inList}" value="${direccionInstance?.estado}" valueMessagePrefix="direccion.estado"  />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('direccion','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('direccion','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
