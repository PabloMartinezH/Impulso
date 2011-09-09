
<%@ page import="impulso.Paciente" %>
<%@ page import="impulso.TipoPaciente" %>
<%@ page import="impulso.Oficina" %>


<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
<script type="text/javascript"></script>    

<%
def tiposPaciente = TipoPaciente.list(sort:"codigo", order:"asc")
def oficinas = Oficina.list(sort:"sucursal", order:"asc")
%>

<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<h1>Expedientes de Pacientes</h1>

<br/>


<table>
  <tr>
    <td class="etiqueta">Nombre</td>
    <td><g:textField name="nombre" onchange="validarCampo(this,'texto','Nombre')" size="20" maxlength="70"/></td>
    <td class="etiqueta">Tipo</td>
    <td><g:select name="tipoPaciente" id="tipoPaciente" from="${tiposPaciente}" value="${tipoPacienteInstance?.id}" optionKey="id" optionValue="nombre" noSelection="['': '']"  /></td>
    <td class="etiqueta">Oficina</td>
    <td><g:select name="oficina" id="oficina" from="${oficinas}" value="${oficina?.id}" optionKey="id" optionValue="sucursal" noSelection="['': '']"  /></td></td>
    <td>
      <span class="menuButton">
        <button type="button" style="font-size: 9px" onclick="buscarPacientes('IMPULSO');">Buscar</button>
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

<br/>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<div class="list">
  <table>
    <thead>
      <tr>
        <th><g:message code="paciente.nombre.label" default="Nombre" /></th>
    <th><g:message code="paciente.tipoPaciente.label" default="Tipo" /></th>
    <th><g:message code="paciente.edad.label" default="Edad" /></th>
    <th><g:message code="paciente.sexo.label" default="Sexo" /></th>
    <th>Aux. Aud.</th>
    <th>Estado</th>
    <th><g:message code="paciente.direccion.label" default="Dirección" /></th>
    <th></th>
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
        <td>
          <p align="center">
        ${fieldValue(bean: pacienteInstance, field: "edad")}
        </p>
        </td>
        <td>
          <p align="center">
${fieldValue(bean: pacienteInstance, field: "sexo")}
            </p>
        </td>
        <td>${pacienteInstance.tipoAuxAud.modelo}</td>
        <td>${pacienteInstance.estado.nombre}</td>
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



