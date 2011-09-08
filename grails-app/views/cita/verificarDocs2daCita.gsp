<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="impulso.Cita" %>
<%@ page contentType="text/html;charset=UTF-8" %>



<h1>Verificar Documentos</h1>

<%
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
Date date = new Date() 
String fechaActual = sdf.format(date)
def documentos = citaInstance.estadoDocumentos.documentos
%>

<g:hiddenField name="fechaActual" id="fechaActual" value="${fechaActual}" />
<g:hiddenField name="idCita" id="idCita" value="${citaInstance.id}" />
<g:hiddenField name="idPaciente" id="idPaciente" value="${pacienteInstance.id}" />

<br></br>

<table>
  <tr>
    <td class="etiqueta">¿El Auxiliar Auditivo se entregará directamente al paciente?</td>
    <td>
      <g:checkBox id="pacienteRecibe" value="" />
    </td>
  </tr>
</table>

<br/>

<div class="list" id="docs">  
  <table>
    <tr>
      <th>Documento</th>
      <th>Características</th>
      <th>Entregado</th>
    </tr>
<% documentos.each() { %>
    <tr>
      <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
  <% } %>
  </table>
</div>


<button type="button" style="font-size: 9px" onclick="javascript:guardarStatusDocs2daCita()">
Siguiente
</button>  


<br></br>
<div id="programarCita" style="border:1px solid #3579DC"></div>