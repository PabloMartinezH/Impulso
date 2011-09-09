<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="impulso.Cita" %>
<%@ page import="impulso.Paciente" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<% 
def citaInstance = new Cita() 
def pacienteInstance = new Paciente()
%>


    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    </div>
    <h1>Registrar Cita</h1>
    <br></br>
    <h2>Paciente</h2>
    <table>
      <tr >
        <td class="etiqueta" width="100px"> 
          <label for="nombre"><g:message code="paciente.nombre.label" default="Nombre(s)" /></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'nombre', 'errors')}">
      <g:textField name="nombre" onchange="validarCampo(this,'texto','Nombre')" size="35" maxlength="70" value="${pacienteInstance?.nombre}" />*
    </td>
  </tr>
  <tr>
    <td class="etiqueta" width="100px">
      <label for="apePaterno"><g:message code="paciente.apePaterno.label" default="Apellido Paterno" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apePaterno', 'errors')}">
  <g:textField name="apePaterno" onchange="validarCampo(this,'texto','Apellido Paterno')" size="35" maxlength="70" value="${pacienteInstance?.apePaterno}" />*
</td>
</tr>
<tr>
  <td class="etiqueta" width="100px">
    <label for="apeMaterno"><g:message code="paciente.apeMaterno.label" default="Apellido Materno" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'apeMaterno', 'errors')}">
<g:textField name="apeMaterno" onchange="validarCampo(this,'texto','Apellido Materno')" size="35" maxlength="70" value="${pacienteInstance?.apeMaterno}" />
</td>
</tr>

<tr>
  <td class="etiqueta" width="100px">
    <label for="apeMaterno"><g:message code="paciente.telefono.label" default="Teléfono" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'telefono', 'errors')}">
<g:textField name="telefono" onchange="validarCampo(this,'texto','Teléfono')" size="35" maxlength="70" value="${pacienteInstance?.telefono}" />
</td>
</tr>


<tr>
  <td class="etiqueta" width="100px">
    <label for="apeMaterno"><g:message code="paciente.celular.label" default="Celular" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'celular', 'errors')}">
<g:textField name="celular" onchange="validarCampo(this,'texto','Celular')" size="35" maxlength="70" value="${pacienteInstance?.celular}" />
</td>
</tr>


<tr >
  <td class="etiqueta">
    <label for="sexo"><g:message code="paciente.sexo.label" default="Sexo" /></label>
  </td>
  <td valign="top" class="value ${hasErrors(bean: pacienteInstance, field: 'sexo', 'errors')}">
<g:select name="sexo" id="sexo" from="${pacienteInstance.constraints.sexo.inList}" value="${pacienteInstance?.sexo}" />*
</td>
</tr>
<tr >
  <td class="etiqueta">
    <label for="tipoPaciente">Tipo paciente</label>
  </td>
  <td valign="top">
<g:select name="tipoPaciente" id="tipoPaciente" from="${tiposPaciente}" value="${tipoPacienteInstance?.id}" optionKey="id" optionValue="nombre"  />*
</td>
</tr>

</table>
<br></br>
<h2>Auxiliar Auditivo</h2>
<table>
  <tr >
    <td class="etiqueta" width="100px">
      Tipo de Auxiliar Auditivo
    </td>
    <td>
  <g:select name="tipoAuxAud" id="tipoAuxAud" from="${impulso.TipoAuxAud.list()}" optionValue="modelo"  optionKey="id" />
</td>
</tr>
</table>
<br></br>
<h2>Cita</h2>
<g:hiddenField name="tipoCita" id="tipoCita" value="ENTREGA DOCS Y MOLDES" />
<g:hiddenField name="status" id="status" value="PROGRAMADA" />

<table>
  <tr >
    <td class="etiqueta" width="100px">
      <label for="fechaCita"><g:message code="cita.fechaCita.label" default="Fecha Cita" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'fechaCita', 'errors')}">
  <g:textField size="30" onmouseover="calendarioCita(this)" value="" id="fechaCita" name="fechaCita" readonly="true" />*
</td>
<td class="etiqueta">
  <label for="horaCita"><g:message code="cita.horaCita.label" default="Hora Cita" /></label>
</td>
<td valign="top" class="value ${hasErrors(bean: citaInstance, field: 'horaCita', 'errors')}">
<g:select name="horaCita" from="${citaInstance.constraints.horaCita.inList}" value="${citaInstance?.horaCita}" valueMessagePrefix="cita.horaCita"  />*
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
<div class="nav">
  <span class="menuButton">
    <button type="button" onclick="javascript:guardarCita();" >Guardar</button>
  </span>
</div>

