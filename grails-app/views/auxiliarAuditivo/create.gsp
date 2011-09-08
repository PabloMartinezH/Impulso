

<%@ page import="impulso.AuxiliarAuditivo" %>

<g:set var="entityName" value="${message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('auxiliarAuditivo/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${auxiliarAuditivoInstance}">
  <div class="errors">
    <g:renderErrors bean="${auxiliarAuditivoInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formsaveauxiliarAuditivo">
  
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="modeloAA"><g:message code="auxiliarAuditivo.modeloAA.label" default="Modelo AA" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: auxiliarAuditivoInstance, field: 'modeloAA', 'errors')}">
      <g:textField name="modeloAA" maxlength="20" value="${auxiliarAuditivoInstance?.modeloAA}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="numeroAA"><g:message code="auxiliarAuditivo.numeroAA.label" default="Numero AA" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: auxiliarAuditivoInstance, field: 'numeroAA', 'errors')}">
      <g:textField name="numeroAA" maxlength="2" value="${auxiliarAuditivoInstance?.numeroAA}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="nombreAA"><g:message code="auxiliarAuditivo.nombreAA.label" default="Nombre AA" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: auxiliarAuditivoInstance, field: 'nombreAA', 'errors')}">
      <g:textField name="nombreAA" maxlength="200" value="${auxiliarAuditivoInstance?.nombreAA}" />
          </td>
        </tr>
      
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('auxiliarAuditivo','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
