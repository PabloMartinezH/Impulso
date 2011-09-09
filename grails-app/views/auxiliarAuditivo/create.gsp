

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
            <label for="marca"><g:message code="auxiliarAuditivo.marca.label" default="Marca" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: auxiliarAuditivoInstance, field: 'marca', 'errors')}">
      <g:textField name="marca" maxlength="100" value="${auxiliarAuditivoInstance?.marca}" />
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
