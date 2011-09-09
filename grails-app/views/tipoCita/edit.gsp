

<%@ page import="impulso.TipoCita" %>


<g:set var="entityName" value="${message(code: 'tipoCita.label', default: 'TipoCita')}" />
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('tipoCita/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('tipoCita/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${tipoCitaInstance}">
  <div class="errors">
    <g:renderErrors bean="${tipoCitaInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdatetipoCita">
  <g:hiddenField name="id" value="${tipoCitaInstance?.id}" />
  <g:hiddenField name="version" value="${tipoCitaInstance?.version}" />
 
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="codigo"><g:message code="tipoCita.codigo.label" default="Codigo" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoCitaInstance, field: 'codigo', 'errors')}">
    <g:textField name="codigo" maxlength="25" value="${tipoCitaInstance?.codigo}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="tipoCita.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoCitaInstance, field: 'nombre', 'errors')}">
    <g:textField name="nombre" maxlength="100" value="${tipoCitaInstance?.nombre}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="secuencia"><g:message code="tipoCita.secuencia.label" default="Secuencia" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoCitaInstance, field: 'secuencia', 'errors')}">
    <g:select name="secuencia" from="${1..10}" value="${fieldValue(bean: tipoCitaInstance, field: 'secuencia')}"  />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="documentos"><g:message code="tipoCita.documentos.label" default="Documentos" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: tipoCitaInstance, field: 'documentos', 'errors')}">
    
<ul>
<g:each in="${tipoCitaInstance?.documentos?}" var="d">
    <li><g:link controller="documento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="documento" action="create" params="['tipoCita.id': tipoCitaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documento.label', default: 'Documento')])}</g:link>

          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('tipoCita','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('tipoCita','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
