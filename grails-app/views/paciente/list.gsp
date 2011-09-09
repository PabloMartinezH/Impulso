
<%@ page import="impulso.Paciente" %>
<%@ page import="impulso.TipoPaciente" %>
<%@ page import="impulso.Oficina" %>



<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
<script type="text/javascript"></script>    
<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">

<%
def tiposPaciente = TipoPaciente.list(sort:"codigo", order:"asc")
def oficinas = Oficina.list(sort:"sucursal", order:"asc")
%>
<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<br/>

<h1>Pacientes</h1>

<br/>


<table>
  <tr>
    <td class="etiqueta">Nombre</td>
    <td><g:textField name="nombre" onchange="validarCampo(this,'texto','Nombre')" size="20" maxlength="70"/></td>
    <td class="etiqueta">Tipo</td>
    <td><g:select name="tipoPaciente" id="tipoPaciente" from="${tiposPaciente}" value="${tipoPacienteInstance?.id}" optionKey="id" optionValue="nombre" noSelection="['': '']"  /></td>
    
    <sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_CONSUL_S">
    <td class="etiqueta">Oficina</td>
    <td><g:select name="oficina" id="oficina" from="${oficinas}" value="${oficina?.id}" optionKey="id" optionValue="sucursal" noSelection="['': '']"  /></td></td>
    </sec:ifAnyGranted>
    
    <td>
      <span class="menuButton">
        <button type="button" style="font-size: 9px" onclick="javascript:buscarPacientes('RDR');">Buscar</button>
      </span>
    </td>
  </tr>
</table>


<%
if(pacienteInstanceList.isEmpty()) {
%>
<br/>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
<div class="List">
  <table width="80%">
    <tr>
      <td>
        <p align="center" style="font-size:12px">No hay pacientes a mostrar</p>
      </td>
    </tr>
  </table>
</div>
<% } else { %>

<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
<br/>
<p>Número de pacientes encontrados: <b>${pacienteInstanceList.size()}</b></p>
<br/>
<div class="list">
  <table>
    <thead>
      <tr>
        <th><g:message code="paciente.nombre.label" default="Nombre" /></th>
    <th><g:message code="paciente.tipoPaciente.label" default="Tipo" /></th>
    <th>Aux. Aud.</th>
    <th>Estado</th>
    <th>Oficina</th>
    <th><g:message code="paciente.direccion.label" default="Dirección" /></th>
 </tr>
    </thead>
    <tbody>
    <g:each in="${pacienteInstanceList}" status="i" var="pacienteInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <td>
          <a href="#" onclick="javascript:cargaAlCentro('paciente/show/+${pacienteInstance.id}');">
${fieldValue(bean: pacienteInstance, field: "nombre")}
${fieldValue(bean: pacienteInstance, field: "apePaterno")}
${fieldValue(bean: pacienteInstance, field: "apeMaterno")}
          </a>
        </td>

        <td>${pacienteInstance.tipoPaciente.nombre}</td>  
        <td>${pacienteInstance.tipoAuxAud.modelo}</td>
        <td>${pacienteInstance.estado.nombre}</td>
        <td>${pacienteInstance.oficina}</td>
        <td>
          <% if(pacienteInstance.direccion != null ) { %>
          <p style="font-size: 9x">
${pacienteInstance.direccion.ciudad},
${pacienteInstance.direccion.estado}
          </p>
  <% } %>
        </td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>
<%}%>
</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>