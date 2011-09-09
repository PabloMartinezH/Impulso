
<%@ page import="impulso.Estado" %>


<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">

<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
<script type="text/javascript"> 
</script>    


<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<br></br>
<h1>Estados del proceso</h1>


<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<br></br>
<div class="list">
  <table>
    <thead>
      <tr>


    <th><g:message code="estado.nombre.label" default="Nombre" /></th>

    <th><g:message code="estado.boton.label" default="Botón" /></th>

    <th><g:message code="estado.secuencia.label" default="Secuencia" /></th>

    </tr>


    </thead>
    <tbody>
    <g:each in="${estadoInstanceList}" status="i" var="estadoInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <td>${fieldValue(bean: estadoInstance, field: "nombre")}</td>

        <td>${fieldValue(bean: estadoInstance, field: "boton")}</td>

        <td>${fieldValue(bean: estadoInstance, field: "secuencia")}</td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>

</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>