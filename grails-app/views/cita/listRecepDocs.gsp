
<%@ page import="impulso.Cita" %>
<%@ page import="impulso.TipoCita" %>
<%@ page import="impulso.Paciente" %>


<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />
<script type="text/javascript"></script>    


<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('cita/listRecepDocs');">
      Citas de Hoy
    </a>
  </span> 
</div>

<h1 align="center">Citas para Recepción de Documentos</h1>


<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<table>
  <tr>
    <td class="etiqueta">Nombre</td>
    <td><g:textField name="nombre" onchange="validarCampo(this,'texto','Nombre')" size="30" maxlength="70"/></td>
    <td class="etiqueta">Cita</td>
    <td><g:textField size="20" onmouseover="calendarioCita(this)" value="" id="fechaCita" name="fechaCita" readonly="true" /></td>
    <td>
      <span class="menuButton">
        <button type="button" style="font-size: 9px" onclick="javascript:buscarCitas(1);">Buscar</button>
      </span>
    </td>
  </tr>
</table>

<br></br>

<%
if(citaInstanceList.isEmpty()) {
%>
<div class="List">
  <table><tr><td><p>No hay citas a mostrar</p></td></tr></table>
</div>
<% } else { %>

<div class="list">
  <table>
    <thead>
      <tr>
        <th width="60px">Paciente</th>
        <th><g:message code="cita.fechaCita.label" default="Cita" /></th>
    <th><g:message code="cita.status.label" default="Status" /></th>
    <th><g:message code="cita.tipoCita.label" default="Tipo" /></th>
  <th>Aux. Aud.</th>
    <th><g:message code="cita.numeroCita.label" default="# Cita" /></th>
    <th><g:message code="cita.fechaRegistro.label" default="Registro" /></th>
    <th></th>
    <th></th>
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

      <td><p style="font-size:9px">${citaInstance.paciente.tipoAuxAud.modelo}</p></td>
  
      <td>${fieldValue(bean: citaInstance, field: "numeroCita")}</td>

      <td>
      <g:formatDate format="dd-MMM-yyyy" date="${citaInstance.fechaRegistro}" />
      - ${citaInstance.horaRegistro}
      </td>

      <% if(citaInstance.paciente.estado.secuencia==1) { %>
      
      <td>
        <button type="button" style="font-size: 9px" 
                onclick="javascript:cargaAlCentro('cita/verificarDocs1erCita?idCita='+${citaInstance.id});">
                ${citaInstance.paciente.estado.boton}
        </button>  
      </td>
      
      <% } else if (citaInstance.paciente.estado.secuencia==2) { %>
      
       <td>
        <button type="button" style="font-size: 9px" 
                onclick="javascript:cargaAlCentro('paciente/completarInfo?idPaciente='+${citaInstance.paciente.id});">
                ${citaInstance.paciente.estado.boton}
        </button>  
      </td>
      
    <% } else if (citaInstance.paciente.estado.secuencia==3) { %>
      
       <td>
        <button type="button" style="font-size: 9px" 
                onclick="javascript:cargaAlCentro('cita/programarCita?'+
                    'idPaciente='+${citaInstance.paciente.id}+
                    '&secuencia='+${citaInstance.paciente.estado.secuencia}+
                    '&idCita='+${citaInstance.id}+
                    '&razon=PROGRAMACION');">
                ${citaInstance.paciente.estado.boton}
        </button>  
      </td>
      
      <% } %>
      
      
     <% if(!(citaInstance.paciente.estado.secuencia==3)) { %> 
      
     <%
     def tipoCita = TipoCita.find("from TipoCita as tc where tc.codigo='"+citaInstance.tipoCita+"'")
     %>
  
      <td>
        <button type="button" style="font-size: 9px" 
                 onclick="javascript:cargaAlCentro('cita/programarCita?'+
                    'idPaciente='+${citaInstance.paciente.id}+
                    '&secuencia='+${citaInstance.paciente.estado.secuencia}+
                    '&idCita='+${citaInstance.id}+
                    '&idTipoCita='+${tipoCita.id}+
                    '&razon=CANCELACION');">
          Reprogramar Cita
        </button>  
      </td>
   
      <% } %>
      
      </tr>
    </g:each>
    </tbody>
  </table>
</div>

<% } %>