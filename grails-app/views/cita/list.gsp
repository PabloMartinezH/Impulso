
<%@ page import="impulso.Cita" %>
<%@ page import="impulso.Paciente" %>
<%@ page import="impulso.Oficina" %>



<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">

  <g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />
<script type="text/javascript"> </script>    

<%
def oficinas = Oficina.list(sort:"sucursal", order:"asc")
%>
  
<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('cita/list');">
      Citas de Hoy
    </a>
  </span> 
  <sec:ifAnyGranted roles="ROLE_SUPER_P,ROLE_OPERA_P">
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('cita/registrarCita');" >Registrar Cita</a>
  </span>
  </sec:ifAnyGranted>
</div>
<br/>
<h1 align="center">Citas</h1>

<br/>
<table>
  <tr>
    <td class="etiqueta">Nombre</td>
    <td><g:textField name="nombre" onchange="validarCampo(this,'texto','Nombre')" size="30" maxlength="70"/></td>
    <td class="etiqueta">Cita</td>
    <td><g:textField size="20" onmouseover="calendarioBuscarCita(this)" value="" id="fechaCita" name="fechaCita" readonly="true" /></td>
    <sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_CONSUL_S">
    <td class="etiqueta">Oficina</td>
    <td><g:select name="oficina" id="oficina" from="${oficinas}" value="${oficina?.id}" optionKey="id" optionValue="sucursal" noSelection="['': '']"  /></td></td>
    </sec:ifAnyGranted>
    <td>
      <span class="menuButton">
        <button type="button" style="font-size: 9px" onclick="javascript:buscarCitas(0);">Buscar</button>
      </span>
    </td>
  </tr>
</table>

<br/>
<br/>
<%
if(citaInstanceList.isEmpty()) {
%>
<div class="List">
  <table width="80%">
    <tr>
      <td>
        <p align="center" style="font-size:12px">No hay Citas a mostrar</p>
      </td>
    </tr>
  </table>
</div>
<% } else { %>
<p>Número de citas encontradas: <b>${citaInstanceList.size()}</b></p>
<br/>
<div class="list">
  <table>
    <thead>
      <tr>
        <th width="60px">Paciente</th>
        <th><g:message code="cita.fechaCita.label" default="Cita" /></th>
    <th><g:message code="cita.status.label" default="Status" /></th>
    <th><g:message code="cita.tipoCita.label" default="Tipo" /></th>
  
  <th>Aux. Aud.</th>
    <th><g:message code="cita.numeroCita.label" default="#" /></th>
  <th><g:message code="cita.oficina.label" default="Oficina" /></th>
    <th><g:message code="cita.fechaRegistro.label" default="Registro" /></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${citaInstanceList}" status="i" var="citaInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <td>
          <a href="#" onclick="javascript:cargaAlCentro('cita/show/+${citaInstance.id}');">
<%
def paciente = Paciente.get(citaInstance.paciente.id)
%>
            ${paciente.nombre} ${paciente.apePaterno}
          </a>
        </td>


        <td>
      <g:formatDate format="dd-MMM-yyyy" date="${citaInstance.fechaCita}" />
      - ${citaInstance.horaCita}
      </td>

      <td><p style="font-size:9px">${fieldValue(bean: citaInstance, field: "status")}</p></td>
      <td><p style="font-size:9px">${fieldValue(bean: citaInstance, field: "tipoCita")}</p></td>
      
      <td>${citaInstance.paciente.tipoAuxAud.modelo}</td>
      <td>${fieldValue(bean: citaInstance, field: "numeroCita")}</td>
      <td><p style="font-size:8px">${citaInstance.oficina}</p></td>
      <td>
      <g:formatDate format="dd-MMM-yyyy" date="${citaInstance.fechaRegistro}" />
      - ${citaInstance.horaRegistro}
      </td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>

<% } %>

</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>