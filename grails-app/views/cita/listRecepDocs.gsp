
<%@ page import="impulso.Cita" %>
<%@ page import="impulso.TipoCita" %>
<%@ page import="impulso.Oficina" %>
<%@ page import="impulso.Paciente" %>


<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">

<%
def oficinas = Oficina.list(sort:"sucursal", order:"asc")
%>
  
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
<br/>
<h1 align="center">Citas para Entrega de Documentos y Toma de Moldes</h1>
<br/>

<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

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
        <button type="button" style="font-size: 9px" onclick="javascript:buscarCitas(1);">Buscar</button>
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
    <sec:ifAnyGranted roles="ROLE_OPERA_P,ROLE_SUPER_P">
    <th></th>
    <th></th>
    </sec:ifAnyGranted>
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

      <td><p style="font-size:8px">${citaInstance.oficina}</p></td>
  
      <td>
      <g:formatDate format="dd-MMM-yyyy" date="${citaInstance.fechaRegistro}" />
      - ${citaInstance.horaRegistro}
      </td>

      <sec:ifAnyGranted roles="ROLE_OPERA_P,ROLE_SUPER_P">
      
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
      </sec:ifAnyGranted>
      
      </tr>
    </g:each>
    </tbody>
  </table>
</div>

<% } %>
</sec:ifAnyGranted>