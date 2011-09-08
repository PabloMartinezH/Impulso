

<%@ page import="impulso.Paciente" %>

<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('paciente/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${pacienteInstance}">
  <div class="errors">
    <g:renderErrors bean="${pacienteInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formsavepaciente">
  
    <table>
      <tbody>

        <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="paciente.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'nombre', 'errors')}">
      <g:textField name="nombre" maxlength="70" value="${pacienteInstance?.nombre}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="apePaterno"><g:message code="paciente.apePaterno.label" default="Ape Paterno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apePaterno', 'errors')}">
      <g:textField name="apePaterno" maxlength="70" value="${pacienteInstance?.apePaterno}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="apeMaterno"><g:message code="paciente.apeMaterno.label" default="Ape Materno" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apeMaterno', 'errors')}">
      <g:textField name="apeMaterno" maxlength="70" value="${pacienteInstance?.apeMaterno}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="edad"><g:message code="paciente.edad.label" default="Edad" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'edad', 'errors')}">
      <g:select name="edad" from="${0..110}" value="${fieldValue(bean: pacienteInstance, field: 'edad')}"  />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="sexo"><g:message code="paciente.sexo.label" default="Sexo" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'sexo', 'errors')}">
      <g:select name="sexo" from="${pacienteInstance.constraints.sexo.inList}" value="${pacienteInstance?.sexo}" valueMessagePrefix="paciente.sexo" noSelection="['': '']" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="rango"><g:message code="paciente.rango.label" default="Rango" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'rango', 'errors')}">
      <g:select name="rango" from="${pacienteInstance.constraints.rango.inList}" value="${pacienteInstance?.rango}" valueMessagePrefix="paciente.rango" noSelection="['': '']" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="procedencia"><g:message code="paciente.procedencia.label" default="Procedencia" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'procedencia', 'errors')}">
      <g:textField name="procedencia" maxlength="50" value="${pacienteInstance?.procedencia}" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="direccion"><g:message code="paciente.direccion.label" default="Direccion" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'direccion', 'errors')}">
      <g:select name="direccion.id" from="${impulso.Direccion.list()}" optionKey="id" value="${pacienteInstance?.direccion?.id}" noSelection="['null': '']" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="receta"><g:message code="paciente.receta.label" default="Receta" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'receta', 'errors')}">
      <g:select name="receta.id" from="${impulso.Receta.list()}" optionKey="id" value="${pacienteInstance?.receta?.id}" noSelection="['null': '']" />
          </td>
        </tr>
      
        <tr >
          <td class="etiqueta">
            <label for="tipoPaciente"><g:message code="paciente.tipoPaciente.label" default="Tipo Paciente" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'tipoPaciente', 'errors')}">
      <g:select name="tipoPaciente.id" from="${impulso.TipoPaciente.list()}" optionKey="id" value="${pacienteInstance?.tipoPaciente?.id}"  />
          </td>
        </tr>
      
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('paciente','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
