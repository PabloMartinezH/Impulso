<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="impulso.Cita" %>
<%@ page import="impulso.Cita" %>
<%@ page import="impulso.Cita" %>
<%@ page import="java.util.Collections"%>
<%@ page contentType="text/html;charset=UTF-8" %>



<h1>Verificar Documentos</h1>
<g:hiddenField name="idPaciente" id="idPaciente" value="${pacienteInstance.id}" />
<g:hiddenField name="idCita" id="idCita" value="${pacienteInstance.id}" />

<%
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
Date date = new Date() 
String fechaActual = sdf.format(date)
%>

<g:hiddenField name="fechaActual" id="fechaActual" value="${fechaActual}" />
<g:hiddenField name="idCita" id="idCita" value="${citaInstance.id}" />
<g:hiddenField name="idPaciente" id="idPaciente" value="${pacienteInstance.id}" />

<br></br>
<div class="list" id="docs">
  <table>
    <tr>
      <th >Documento</th>
      <th >Características</th>
      <th >Entregado</th>
    </tr>
    <% def it = documentos.get("1")%>
    <tr>  
       <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
    <% it = documentos.get("2")%>
    <tr>  
        <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
      <% it = documentos.get("3")%>
    <tr>  
        <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
    <tr><td colspan="3"><p style="color:red">--------- En caso de no presentar ISSFAM ----------</p></td></tr>
    <% it = documentos.get("4")%>
    <tr>  
        <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
    <% it = documentos.get("5")%>
    <tr>  
        <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
<td class="etiqueta">Vigencia</td>
    <td>
    <g:textField size="12" onmouseover="calendarioVigencia(this)" id="fechaCarta" name="fechaCarta" readonly="true" />*
    </td>
    </tr>
    
  </table>
</div>
<button type="button" style="font-size: 9px" onclick="javascript:guardarStatusDocs1erCita()">
Siguiente
</button>  
<br></br>
<div id="programarCita" style="border:1px solid #3579DC">
  
</div>