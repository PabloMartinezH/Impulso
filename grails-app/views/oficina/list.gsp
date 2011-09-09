
<%@ page import="impulso.Oficina" %>

<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">


  <g:set var="entityName" value="${message(code: 'oficina.label', default: 'Oficina')}" />
  <script type="text/javascript"> 
  </script>    


  <div class="nav">
    <span class="menuButton">
      <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
  </div>

  <BR/>
  <h1>Oficinas</h1>

  <BR/>

  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <div class="list">
    <table>
      <thead>
        <tr>

          <th><g:message code="oficina.sucursal.label" default="Sucursal" /></th>

      <th><g:message code="oficina.direccion.label" default="Dirección" /></th>

      </tr>


      </thead>
      <tbody>
      <g:each in="${oficinaInstanceList}" status="i" var="oficinaInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td>${fieldValue(bean: oficinaInstance, field: "sucursal")}</td>

          <td>${fieldValue(bean: oficinaInstance, field: "direccion")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>