
<%@ page import="impulso.Documento" %>



<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
<g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
<script type="text/javascript"> </script>    


<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<br/>
<h1>Lista de documentos</h1>
<br/>    


<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<div class="list">
  <table>
    <thead>
      <tr>


<!--
        <th><g:message code="documento.ordenDoc.label" default="Secuencia" /></th>
-->
    <th><g:message code="documento.codigoDoc.label" default="Código" /></th>

    <th><g:message code="documento.nombreDoc.label" default="Nombre" /></th>

    <th><g:message code="documento.caracteristicas.label" default="Características" /></th>

    <th><g:message code="documento.tipoCita.label" default="Tipo Cita" /></th>

    </tr>


    </thead>
    <tbody>
    <g:each in="${documentoInstanceList}" status="i" var="documentoInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <!--
        <td>${fieldValue(bean: documentoInstance, field: "ordenDoc")}</td>
        -->

        <td>${fieldValue(bean: documentoInstance, field: "codigoDoc")}</td>

        <td>${fieldValue(bean: documentoInstance, field: "nombreDoc")}</td>

        <td>${fieldValue(bean: documentoInstance, field: "caracteristicas")}</td>

        <td>${documentoInstance.tipoCita.codigo}</td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>
</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>