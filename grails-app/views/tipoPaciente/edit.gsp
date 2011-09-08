

<%@ page import="impulso.TipoPaciente" %>


<g:set var="entityName" value="${message(code: 'tipoPaciente.label', default: 'TipoPaciente')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('tipoPaciente/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('tipoPaciente/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${tipoPacienteInstance}">
  <div class="errors">
    <g:renderErrors bean="${tipoPacienteInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdatetipoPaciente">
  <g:hiddenField name="id" value="${tipoPacienteInstance?.id}" />
  <g:hiddenField name="version" value="${tipoPacienteInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="codigo"><g:message code="tipoPaciente.codigo.label" default="Codigo" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoPacienteInstance, field: 'codigo', 'errors')}">
    <g:textField name="codigo" maxlength="6" value="${tipoPacienteInstance?.codigo}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="tipoPaciente.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoPacienteInstance, field: 'nombre', 'errors')}">
    <g:textField name="nombre" maxlength="50" value="${tipoPacienteInstance?.nombre}" />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('tipoPaciente','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('tipoPaciente','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
