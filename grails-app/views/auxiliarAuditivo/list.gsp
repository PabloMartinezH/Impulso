
<%@ page import="impulso.AuxiliarAuditivo" %>



<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
<g:set var="entityName" value="${message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo')}" />
<script type="text/javascript"> 
</script>    


<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>
<br/>

<h1>Auxiliares Auditivos</h1>

<br/>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<div class="list">
  <table style="border-color: white" border="4">
    <thead>
      <tr>

        <th><g:message code="auxiliarAuditivo.marca.label" default="Marca" /></th>
    <th>Tipos Aux. Aud.</th>
    </tr>


    </thead>
    <tbody>
    <g:each in="${auxiliarAuditivoInstanceList}" status="i" var="auxiliarAuditivoInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <td>${fieldValue(bean: auxiliarAuditivoInstance, field: "marca")}</td>
<% def tiposAuxAud =  auxiliarAuditivoInstance.tiposAuxAud%>
        <td>
      <lu>
        <g:each var="taa" in="${tiposAuxAud}">
          <li>${taa.modelo}</li>
        </g:each>
      </lu>
      </td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>
</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>