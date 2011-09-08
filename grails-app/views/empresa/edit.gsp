

<%@ page import="impulso.Empresa" %>


<g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('empresa/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('empresa/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${empresaInstance}">
  <div class="errors">
    <g:renderErrors bean="${empresaInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdateempresa">
  <g:hiddenField name="id" value="${empresaInstance?.id}" />
  <g:hiddenField name="version" value="${empresaInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="codigoEmp"><g:message code="empresa.codigoEmp.label" default="Codigo Emp" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'codigoEmp', 'errors')}">
    <g:textField name="codigoEmp" maxlength="12" value="${empresaInstance?.codigoEmp}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="nombreEmp"><g:message code="empresa.nombreEmp.label" default="Nombre Emp" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: empresaInstance, field: 'nombreEmp', 'errors')}">
    <g:textField name="nombreEmp" maxlength="40" value="${empresaInstance?.nombreEmp}" />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('empresa','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('empresa','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
