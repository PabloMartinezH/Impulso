

<%@ page import="impulso.MedicoMilitar" %>

<g:set var="entityName" value="${message(code: 'medicoMilitar.label', default: 'MedicoMilitar')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('medicoMilitar/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${medicoMilitarInstance}">
  <div class="errors">
    <g:renderErrors bean="${medicoMilitarInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formsavemedicoMilitar">
  
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="medicoMilitar.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'nombre', 'errors')}">
      <g:textField name="nombre" maxlength="70" value="${medicoMilitarInstance?.nombre}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="apePaterno"><g:message code="medicoMilitar.apePaterno.label" default="Ape Paterno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'apePaterno', 'errors')}">
      <g:textField name="apePaterno" maxlength="70" value="${medicoMilitarInstance?.apePaterno}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="apeMaterno"><g:message code="medicoMilitar.apeMaterno.label" default="Ape Materno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'apeMaterno', 'errors')}">
      <g:textField name="apeMaterno" maxlength="70" value="${medicoMilitarInstance?.apeMaterno}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="area"><g:message code="medicoMilitar.area.label" default="Area" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: medicoMilitarInstance, field: 'area', 'errors')}">
      <g:textField name="area" maxlength="70" value="${medicoMilitarInstance?.area}" />
          </td>
        </tr>
      
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('medicoMilitar','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
