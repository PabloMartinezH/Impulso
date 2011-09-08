

<%@ page import="impulso.Cita" %>

<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('cita/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${citaInstance}">
  <div class="errors">
    <g:renderErrors bean="${citaInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formsavecita">
  
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="fechaRegistro"><g:message code="cita.fechaRegistro.label" default="Fecha Registro" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaRegistro', 'errors')}">
      <g:datePicker name="fechaRegistro" precision="day" value="${citaInstance?.fechaRegistro}"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="horaRegistro"><g:message code="cita.horaRegistro.label" default="Hora Registro" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'horaRegistro', 'errors')}">
      <g:textField name="horaRegistro" value="${citaInstance?.horaRegistro}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="fechaCita"><g:message code="cita.fechaCita.label" default="Fecha Cita" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaCita', 'errors')}">
      <g:datePicker name="fechaCita" precision="day" value="${citaInstance?.fechaCita}"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="horaCita"><g:message code="cita.horaCita.label" default="Hora Cita" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'horaCita', 'errors')}">
      <g:select name="horaCita" from="${citaInstance.constraints.horaCita.inList}" value="${citaInstance?.horaCita}" valueMessagePrefix="cita.horaCita"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="fechaReal"><g:message code="cita.fechaReal.label" default="Fecha Real" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaReal', 'errors')}">
      <g:datePicker name="fechaReal" precision="day" value="${citaInstance?.fechaReal}"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="horaReal"><g:message code="cita.horaReal.label" default="Hora Real" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'horaReal', 'errors')}">
      <g:textField name="horaReal" value="${citaInstance?.horaReal}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="status"><g:message code="cita.status.label" default="Status" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'status', 'errors')}">
      <g:select name="status" from="${citaInstance.constraints.status.inList}" value="${citaInstance?.status}" valueMessagePrefix="cita.status"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="tipoCita"><g:message code="cita.tipoCita.label" default="Tipo Cita" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'tipoCita', 'errors')}">
      <g:select name="tipoCita" from="${citaInstance.constraints.tipoCita.inList}" value="${citaInstance?.tipoCita}" valueMessagePrefix="cita.tipoCita"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="numeroCita"><g:message code="cita.numeroCita.label" default="Numero Cita" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'numeroCita', 'errors')}">
      <g:select name="numeroCita" from="${1..10}" value="${fieldValue(bean: citaInstance, field: 'numeroCita')}"  />
          </td>
        </tr>
      
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('cita','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
