<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="impulso.Cita" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
</div>

<h1>Verificar Documentos</h1>

<%
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd")
Date date = new Date() 
String fechaActual = sdf.format(date)
//def documentos = citaInstance.estadoDocumentos.documentos
%>

<g:hiddenField name="fechaActual" id="fechaActual" value="${fechaActual}" />
<g:hiddenField name="idCita" id="idCita" value="${citaInstance.id}" />
<g:hiddenField name="idPaciente" id="idPaciente" value="${pacienteInstance.id}" />

<br></br>

<table style="border-color: white" border="1">
  <tr>
    <td class="etiqueta">¿Es el paciente quien recibe el Aux. Aud.? *</td>
    <td>
       &nbsp; &nbsp; Si.....<input type="radio"  name="pacienteRecibe" value="${true}" checked="checked"/> 
       &nbsp; &nbsp; No....<input type="radio"  name="pacienteRecibe" value="${false}"/>
    </td>
  <tr>
    </table>

<br/>
<br/>

<div class="list" id="docs">  
  <table>
    <tr>
      <th>Documento</th>
      <th>Características</th>
      <th>Entregado</th>
    </tr>

    <% def it = documentos.get("6")%>
    <tr>  
       <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
    <% it = documentos.get("7")%>
    <tr>  
       <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
    <tr><td colspan="3"><p style="color:red">--------- En caso de no ser el Paciente quien Recibe el Auxiliar Auditivo ----------</p></td></tr>
    <% it = documentos.get("8")%>
    <tr>  
       <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
    <% it = documentos.get("9")%>
    <tr>  
       <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
    <% it = documentos.get("10")%>
    <tr>  
       <td>${it.documento.nombreDoc}</td>
      <td>${it.documento.caracteristicas}</td>
      <td><p align="center"><g:checkBox codigo="${it.documento.codigoDoc}" id="${it.id}" class="doc" value="${it.status}"/></p></td>
    </tr>
   
  </table>
</div>


<button type="button" style="font-size: 9px" onclick="javascript:guardarStatusDocs2daCita()">
Siguiente
</button>  


<br/>
<br/>
<div id="programarCita" style="border:1px solid #3579DC"></div>