<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<br/>
<h1> Reporte de pacientes </h1>
<br/>
<table>
  <tr>
    <td>
        <g:jasperReport jasper="Pacientes.jasper" format="XLS"></g:jasperReport>
    </td>
  </tr>
</table>