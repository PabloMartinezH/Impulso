<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
 <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    </div>
<BR/>
<h2>${mensaje}</h2>
<br></br>
<table>
  <g:hiddenField name="razon" id="razon" value="${razon}" />
  <g:hiddenField name="idCita" id="idCita" value="${citaInstance.id}" />
  <g:hiddenField name="idPaciente" id="idPaciente" value="${citaInstance.paciente.id}" />
  <% if(razon.equals("CANCELACION")) { %>
    <tr>
    <td class="etiqueta">
      Razón cancelación
    </td>
    <td>
      <g:select 
        name="razonCancelacion" 
        from="${citaInstance.constraints.razonCancelacion.inList}" 
        value="${citaInstance?.razonCancelacion}" 
        valueMessagePrefix="cita.razonCancelacion"  />
    </td>
  </tr>
  <% } %>
  <tr>
    <td class="etiqueta">
      Tipo Cita
    </td>
    <td>
      <input name="tipoCita" id="tipoCita" size="30" value="${tipoCita}" class="noEditable" readonly="true"/>
    </td>
  </tr>
  <tr >
    <td class="etiqueta" width="100px">
      <label for="fechaCita"><g:message code="cita.fechaCita.label" default="Fecha Cita" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaCita', 'errors')}">
  <g:textField size="30" onmouseover="calendarioCita(this)" value="" id="fechaCita" name="fechaCita" readonly="true" />
</td>
<td class="etiqueta">
  <label for="horaCita"><g:message code="cita.horaCita.label" default="Hora Cita" /></label>
</td>
<td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'horaCita', 'errors')}">
<g:select name="horaCita" from="${citaInstance.constraints.horaCita.inList}" value="${citaInstance?.horaCita}" valueMessagePrefix="cita.horaCita"  />
</td>
</tr>
<tr>
  <td class="etiqueta" width="100px">
    <label for="fechaRegistro"><g:message code="cita.fechaRegistro.label" default="Fecha y Hora de Registro" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaRegistro', 'errors')}">
<% 
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd , hh:mm a")
Date date = new Date() 
String fechaActual = sdf.format(date)
%>
    <input name="fechaRegistro" size="30" value="${fechaActual}" class="noEditable" readonly="true"/>
  </td>
</tr>
</table>
<br></br>
<button type="button" style="font-size: 9px" onclick="javascript:guardarCitaProgramada()">
Guardar
</button>  
