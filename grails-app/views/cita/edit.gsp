

<%@ page import="impulso.Cita" %>


<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('cita/list');">
      Citas de hoy
    </a>
  </span> 
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>

<g:hasErrors bean="${citaInstance}">
  <div class="errors">
    <g:renderErrors bean="${citaInstance}" as="list" />
  </div>
</g:hasErrors>

<br/>

<form id="formupdatecita">
  <g:hiddenField name="id" value="${citaInstance?.id}" />
  <g:hiddenField name="version" value="${citaInstance?.version}" />
 
    <table>
      <tbody>

        <tr>
<td class="etiqueta"><g:message code="cita.fechaRegistro.label" default="Fecha Registro" /></td>
<td colspan="3">
<g:formatDate format="dd-MMM-yyyy" date="${citaInstance?.fechaRegistro}" />
- ${citaInstance.horaRegistro}
</td>  
</tr>
    
        <tr >
    <td class="etiqueta" width="100px">
      <label for="fechaCita"><g:message code="cita.fechaCita.label" default="Fecha Cita" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaCita', 'errors')}">
     <%
        java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
        String fechaCita = sdf.format(citaInstance?.fechaCita);
     %> 
      
  <g:textField size="30" onmouseover="calendarioCita(this)" value="${fechaCita}" id="fechaCita" name="fechaCita" readonly="true" />*
</td>
<td class="etiqueta">
  <label for="horaCita"><g:message code="cita.horaCita.label" default="Hora Cita" /></label>
</td>
<td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'horaCita', 'errors')}">
<g:select name="horaCita" from="${citaInstance.constraints.horaCita.inList}" value="${citaInstance?.horaCita}" valueMessagePrefix="cita.horaCita"  />*
</td>
</tr>
    
        <tr>
      <td class="etiqueta"><g:message code="cita.status.label" default="Status" /></td>
<td>${fieldValue(bean: citaInstance, field: "status")}</td>
</tr>
    
        <tr>
      <td class="etiqueta"><g:message code="cita.tipoCita.label" default="Tipo Cita" /></td>
<td colspan="3">${fieldValue(bean: citaInstance, field: "tipoCita")}</td>
      </tr>
      <tr>
      <td class="etiqueta"><g:message code="cita.numeroCita.label" default="Número Cita" /></td>
<td>${fieldValue(bean: citaInstance, field: "numeroCita")}</td>
</tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('cita','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </div>
<form>
