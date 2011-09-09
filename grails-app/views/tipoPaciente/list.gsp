
<%@ page import="impulso.TipoPaciente" %>


<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
  

<g:set var="entityName" value="${message(code: 'tipoPaciente.label', default: 'TipoPaciente')}" />
<script type="text/javascript"> 
</script>    


<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<br></br>
<h1>Tipos de Paciente</h1>

<br></br>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<div class="list">
  <table>
    <thead>
      <tr>

        <th><g:message code="tipoPaciente.codigo.label" default="Código" /></th>

    <th><g:message code="tipoPaciente.nombre.label" default="Nombre" /></th>

    </tr>


    </thead>
    <tbody>
    <g:each in="${tipoPacienteInstanceList}" status="i" var="tipoPacienteInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <td>${fieldValue(bean: tipoPacienteInstance, field: "codigo")}</td>
        <td>${fieldValue(bean: tipoPacienteInstance, field: "nombre")}</td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>

</sec:ifAnyGranted>
           <sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>