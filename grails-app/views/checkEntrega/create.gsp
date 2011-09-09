

<%@ page import="impulso.CheckEntrega" %>

<g:set var="entityName" value="${message(code: 'checkEntrega.label', default: 'CheckEntrega')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('checkEntrega/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${checkEntregaInstance}">
  <div class="errors">
    <g:renderErrors bean="${checkEntregaInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formsavecheckEntrega">
  
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="secuencia"><g:message code="checkEntrega.secuencia.label" default="Secuencia" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: checkEntregaInstance, field: 'secuencia', 'errors')}">
      <g:textField name="secuencia" value="${fieldValue(bean: checkEntregaInstance, field: 'secuencia')}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="descripcion"><g:message code="checkEntrega.descripcion.label" default="Descripcion" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: checkEntregaInstance, field: 'descripcion', 'errors')}">
      <g:textField name="descripcion" maxlength="200" value="${checkEntregaInstance?.descripcion}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="necesario"><g:message code="checkEntrega.necesario.label" default="Necesario" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: checkEntregaInstance, field: 'necesario', 'errors')}">
      <g:checkBox name="necesario" value="${checkEntregaInstance?.necesario}" />
          </td>
        </tr>
      
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('checkEntrega','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
