

<%@ page import="impulso.Documento" %>

<g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('documento/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${documentoInstance}">
  <div class="errors">
    <g:renderErrors bean="${documentoInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formsavedocumento">
  
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="ordenDoc"><g:message code="documento.ordenDoc.label" default="Orden Doc" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'ordenDoc', 'errors')}">
      <g:select name="ordenDoc" from="${1..20}" value="${fieldValue(bean: documentoInstance, field: 'ordenDoc')}"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="codigoDoc"><g:message code="documento.codigoDoc.label" default="Codigo Doc" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'codigoDoc', 'errors')}">
      <g:textField name="codigoDoc" maxlength="20" value="${documentoInstance?.codigoDoc}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="nombreDoc"><g:message code="documento.nombreDoc.label" default="Nombre Doc" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'nombreDoc', 'errors')}">
      <g:textField name="nombreDoc" maxlength="50" value="${documentoInstance?.nombreDoc}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="caracteristicas"><g:message code="documento.caracteristicas.label" default="Caracteristicas" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'caracteristicas', 'errors')}">
      <g:textField name="caracteristicas" maxlength="100" value="${documentoInstance?.caracteristicas}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="tipoCita"><g:message code="documento.tipoCita.label" default="Tipo Cita" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'tipoCita', 'errors')}">
      <g:select name="tipoCita.id" from="${impulso.TipoCita.list()}" optionKey="id" value="${documentoInstance?.tipoCita?.id}"  />
          </td>
        </tr>
      
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('documento','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
