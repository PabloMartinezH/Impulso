

<%@ page import="impulso.Oficina" %>
<%@ page import="impulso.Estado" %>
<%@ page import="impulso.TipoAuxAud" %>

<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">

<%
def estados = Estado.list(sort:"secuencia", order:"asc")  
def tiposAuxAud = TipoAuxAud.list(sort:"modelo", order:"asc") 
def oficinas = Oficina.list(sort:"sucursal", order:"asc") 
%>

  <div class="nav">
    <span class="menuButton">
      <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
  </div>

  <br/>
  <h1>Consultas y Reportes</h1>
  <br/>


  <table border="1">
    <tr>
      <td class="etiqueta">Estado</td>
      <td colspan="3"><g:select name="estado" id="estado" from="${estados}" value="${estado?.id}" optionKey="id" optionValue="nombre" noSelection="['': '']"  /></td>
    </tr>
    <tr>
      <td class="etiqueta">Fecha Inicio</td>
      <td><g:textField size="20" onmouseover="calendarioBuscarCita(this)" value="" id="fechaInicio" name="fechaInicio" readonly="true" /></td>
    <td class="etiqueta">Fecha Fin</td>
    <td><g:textField size="20" onmouseover="calendarioBuscarCita(this)" value="" id="fechaFin" name="fechaFin" readonly="true" /></td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo Aux. Aud.</td>
      <td><g:select name="tipoAuxAud" id="tipoAuxAud" from="${tiposAuxAud}" value="${tipoAuxAud?.id}" optionKey="id" optionValue="modelo" noSelection="['': '']"  /></td>

    <sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM">
      <td class="etiqueta">Oficina</td>
      <td><g:select name="oficina" id="oficina" from="${oficinas}" value="${oficina?.id}" optionKey="id" optionValue="sucursal" noSelection="['': '']"  /></td>
    </sec:ifAnyGranted>
    <td>
      <span class="menuButton">
        <button type="button" style="font-size: 9px" onclick="javascript:consultarReportes();">Buscar</button>
      </span>
    </td>
    </tr>
  </table>

  <br/>


<% 
if(citaInstanceList==null) {
  if(pacienteInstanceList.isEmpty()) {
    %>
    <br/>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="List">
      <table width="80%">
        <tr><td><p align="center" style="font-size:12px">No hay registros a mostrar</p></td></tr>
      </table>
    </div>
<% } else { %>

  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <br/>
  <p>Número de registros encontrados: <b>${pacienteInstanceList.size()}</b></p>
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
<%} else {
  if(citaInstanceList.isEmpty()) {
    %>
  <br/>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="List">
    <table width="80%">
      <tr>
        <td>
          <p align="center" style="font-size:12px">No hay registros a mostrar</p>
        </td>
      </tr>
    </table>
  </div>
    <% } else { %>
    
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <br/>
  <p>Número de registros encontrados: <b>${citaInstanceList.size()}</b></p>
  <br/>
  <div class="list">
    <table>
      <thead>
        <tr>
          <th><g:message code="paciente.nombre.label" default="Nombre" /></th>
      <th><g:message code="cita.status" default="Status" /></th>
      <th><g:message code="cita.numero" default="Cita" /></th>
      <th><g:message code="paciente.tipoPaciente.label" default="Tipo" /></th>
      <th>Aux. Aud.</th>
      <th>Estado</th>
      <th>Oficina</th>
      <th><g:message code="paciente.direccion.label" default="Dirección" /></th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${citaInstanceList}" status="i" var="citaInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td>
            <a href="#" onclick="javascript:cargaAlCentro('paciente/show/+${citaInstance.paciente.id}');">
    ${citaInstance.paciente.nombre}
    ${citaInstance.paciente.apePaterno}
    ${citaInstance.paciente.apeMaterno}
            </a>
          </td>

          <td>${citaInstance.status}</td>
     <%  Date date = new Date();
        java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MMM-dd")
        String fechaActual = sdf.format(citaInstance.fechaCita);
        %>  
          <td>${fechaActual} : ${citaInstance.horaCita}
          </td>  

          <td>${citaInstance.paciente.tipoPaciente.nombre}</td>  
          <td>${citaInstance.paciente.tipoAuxAud.modelo}</td>
          <td>${citaInstance.paciente.estado.nombre}</td>
          <td>${citaInstance.paciente.oficina}</td>
          <td>
    <% if(citaInstance.paciente.direccion != null ) { %>
            <p style="font-size: 9x">
      ${citaInstance.paciente.direccion.ciudad},
      ${citaInstance.paciente.direccion.estado}
            </p>
      <% } %>
          </td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
    <% } %>
  <% } %>


</sec:ifAnyGranted>