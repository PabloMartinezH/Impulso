
<%@ page import="impulso.Cita" %>
<%@ page import="impulso.Paciente" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('cita/list');">
      Citas de hoy
    </a>
  </span> 
</div>


  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
  <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
</g:if>

<table>
  <tbody>

    <%
    def pacienteInstance = Paciente.get(citaInstance.paciente.id)
    %>
    <tr>
      <td colspan="6"><h2>Paciente</h2></td>
    </tr>
    
    <tr>
      <td class="etiqueta" size="25px">Nombre</td>  
      <td  size="40px">${pacienteInstance.nombre}</td>
    </tr>
    <tr>
      <td class="etiqueta" size="25px">Apellido Paterno</td>  
      <td  size="40px">${pacienteInstance.apePaterno}</td>
          </tr>
          <tr>
      <td class="etiqueta" size="25px">Apellido Materno</td>  
      <td  size="40px">${pacienteInstance.apeMaterno}</td>
</tr>
  
<tr>
      <td colspan="6"></td>
    </tr>
<tr>
      <td colspan="6"><h2>Cita</h2></td>
    </tr>

    <tr>
      <td class="etiqueta"><g:message code="cita.fechaCita.label" default="Fecha Cita" /></td>
<td><g:formatDate format="dd-MMM-yyyy" date="${citaInstance?.fechaCita}" /></td>
 </tr>
          <tr>
      <td class="etiqueta"><g:message code="cita.horaCita.label" default="Hora Cita" /></td>
<td>${fieldValue(bean: citaInstance, field: "horaCita")}</td>
 </tr>
          <tr>
      <td class="etiqueta"><g:message code="cita.status.label" default="Status" /></td>
<td>${fieldValue(bean: citaInstance, field: "status")}</td>
</tr>
  
<% if (citaInstance.fechaReal != null) {%>
<tr>
      <td colspan="6"></td>
    </tr>
<tr>
  <td class="etiqueta"><g:message code="cita.fechaReal.label" default="Fecha Real" /></td>
      <td><g:formatDate format="dd-MMM-yyyy" date="${citaInstance?.fechaReal}" /></td>
        <td class="etiqueta"><g:message code="cita.horaReal.label" default="Hora Real" /></td>
      <td>${fieldValue(bean: citaInstance, field: "horaReal")}</td>
      </tr>
  <% } %>
      
    <tr>
      <td class="etiqueta"><g:message code="cita.tipoCita.label" default="Tipo Cita" /></td>
<td colspan="3">${fieldValue(bean: citaInstance, field: "tipoCita")}</td>
      </tr>
      <tr>
      <td class="etiqueta"><g:message code="cita.numeroCita.label" default="Número Cita" /></td>
<td>${fieldValue(bean: citaInstance, field: "numeroCita")}</td>
</tr>
  
<tr>
<td class="etiqueta"><g:message code="cita.fechaRegistro.label" default="Fecha Registro" /></td>
<td colspan="3">
<g:formatDate format="dd-MMM-yyyy" date="${citaInstance?.fechaRegistro}" />
- ${citaInstance.horaRegistro}
</td>  
</tr>
  
</tbody>
</table>

<br/>  
<div class="nav">
  <% if((citaInstance?.status).equals("PROGRAMADA")) { %>
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('cita/edit/'+${citaInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
  <% } %>
</div>
