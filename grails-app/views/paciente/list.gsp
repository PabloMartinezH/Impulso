
<%@ page import="impulso.Paciente" %>


<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
<script type="text/javascript"></script>    

<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<h1>Pacientes</h1>

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
Cd: ${pacienteInstance.direccion.ciudad},
${pacienteInstance.direccion.estado},
          </p>
  <% } %>
        </td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>
