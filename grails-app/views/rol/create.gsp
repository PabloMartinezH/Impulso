

<%@ page import="impulso.Rol" %>

<g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('rol/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${rolInstance}">
  <div class="errors">
    <g:renderErrors bean="${rolInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formsaverol">
  
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="authority"><g:message code="rol.authority.label" default="Authority" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: rolInstance, field: 'authority', 'errors')}">
      <g:textField name="authority" value="${rolInstance?.authority}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="rol.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: rolInstance, field: 'nombre', 'errors')}">
      <g:textField name="nombre" maxlength="150" value="${rolInstance?.nombre}" />
          </td>
        </tr>
      
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('rol','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
