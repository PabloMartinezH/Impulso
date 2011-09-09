
<%@ page import="impulso.EscalonServicioSanidad" %>

<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">

<script type="text/javascript"> </script>    

<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<br></br>
<h1>Escalones de Servicio de Sanidad</h1>

<br></br>
<div class="list">
  <table>
    <thead>
      <tr>
        <th width="11%"><g:message code="escalonServicioSanidad.codigoESS.label" default="Código" /></th>
    <th width="15%"><g:message code="escalonServicioSanidad.zonaMilitar.label" default="Zona Militar" /></th>
    <th width="35%"><g:message code="escalonServicioSanidad.nombreInst.label" default="Nombre" /></th>
    <th width="39%"><g:message code="escalonServicioSanidad.domicilioInst.label" default="Domicilio" /></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${escalonServicioSanidadInstanceList}" status="i" var="escalonServicioSanidadInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <td>${fieldValue(bean: escalonServicioSanidadInstance, field: "codigoESS")}</td>
        <td>${fieldValue(bean: escalonServicioSanidadInstance, field: "zonaMilitar")}</td>
        <td>${fieldValue(bean: escalonServicioSanidadInstance, field: "nombreInst")}</td>
        <td>${fieldValue(bean: escalonServicioSanidadInstance, field: "domicilioInst")}</td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>

</sec:ifAnyGranted>
 <sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>