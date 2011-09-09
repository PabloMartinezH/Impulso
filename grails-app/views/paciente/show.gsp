
<%@ page import="impulso.Paciente" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('paciente/list');">
      Pacientes
    </a>
  </span> 
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('reporte/generarReportes');">
      Reportes
    </a>
  </span> 
</div>


  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
  <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
</g:if>

  <br/>
  <div class="list">
<table style="border-color: white" border="1">
  <tbody >

    <tr>
      <td class="etiqueta">
        Expediente
      </td>
  <sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM">
      <td>
          <button type="button" style="font-size: 9px" 
                 onclick="javascript:cargaAlCentro('docs/altaExpediente?'+
                    'idPaciente='+${pacienteInstance.id});">Expediente</button>
        </td>
        </sec:ifAnyGranted>
  <sec:ifAnyGranted roles="ROLE_CONSUL_S,ROLE_OPERA_P,ROLE_SUPER_P">
              <td>
          <button type="button" style="font-size: 9px" 
                 onclick="javascript:cargaAlCentro('docs/altaExpediente?'+
                    'idPaciente='+${pacienteInstance.id});">Ver Exp.</button>
        </td>
        </sec:ifAnyGranted>
    </tr>
    
    
    <tr>
      <td class="etiqueta"><g:message code="paciente.nombre.label" default="Nombre" /></td>
<td>${fieldValue(bean: pacienteInstance, field: "nombre")}</td> 
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.apePaterno.label" default="Ape Paterno" /></td>
  
<td>${fieldValue(bean: pacienteInstance, field: "apePaterno")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.apeMaterno.label" default="Ape Materno" /></td>
<td>${fieldValue(bean: pacienteInstance, field: "apeMaterno")}</td>
</tr>

<tr>
      <td class="etiqueta"><g:message code="paciente.telefono.label" default="Telefono" /></td>
<td>${fieldValue(bean: pacienteInstance, field: "telefono")}</td>
</tr>

<tr>
      <td class="etiqueta"><g:message code="paciente.celular.label" default="Celular" /></td>
<td>${fieldValue(bean: pacienteInstance, field: "celular")}</td>
</tr>


   <tr>
      <td class="etiqueta"><g:message code="paciente.tipoPaciente.label" default="Tipo Paciente" /></td>
  
<td>${pacienteInstance?.tipoPaciente?.nombre}</td>
    
</tr>


    <tr>
      <td class="etiqueta"><g:message code="paciente.edad.label" default="Edad" /></td>
  
<td>${fieldValue(bean: pacienteInstance, field: "edad")} años</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.sexo.label" default="Sexo" /></td>
  
<td>${fieldValue(bean: pacienteInstance, field: "sexo")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.rango.label" default="Rango" /></td>
  
<td>${fieldValue(bean: pacienteInstance, field: "rango")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.direccion.label" default="Direccion" /></td>
  
<td><% if(pacienteInstance?.direccion != null ) { %>
          <p style="font-size: 9x">
${pacienteInstance.direccion.calle},
Num. ${pacienteInstance.direccion.numExt},
<%if(!(pacienteInstance.direccion.numInt).isEmpty()) {%>
  Int. ${pacienteInstance.direccion.numInt},
<% } %>
Col. ${pacienteInstance.direccion.colonia},
CP: ${pacienteInstance.direccion.cp},
Ciudad: ${pacienteInstance.direccion.ciudad},
${pacienteInstance.direccion.estado},
${pacienteInstance.direccion.pais},
          </p>
  <% } %></td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.receta.label" default="Receta" /></td>
  
      <td>
<% 
def folio = pacienteInstance?.receta?.folio
System.out.println("Folio: "+folio)
if ((folio != null) && (!folio.isEmpty())) { 
%>
  - Tipo Aux Aud:  ${pacienteInstance?.receta?.tipoAuxAud?.modelo} <br/>
  - Folio:         ${pacienteInstance?.receta?.folio} <br/>
  - Matrícula:     ${pacienteInstance?.receta?.matricula} <br/>
  - Caracter:      ${pacienteInstance?.receta?.caracter} <br/>
  - Fecha Receta:  <g:formatDate format="dd-MMM-yyyy" date="${pacienteInstance?.receta?.fechaReceta}" /> <br/>
  - Serv. Sanidad: ${pacienteInstance?.receta?.escalonServSanidad?.zonaMilitar} <br/>
  - Médico:        ${pacienteInstance?.receta?.medicoMilitar?.nombre} 
  ${pacienteInstance?.receta?.medicoMilitar?.apePaterno}
  ${pacienteInstance?.receta?.medicoMilitar?.apeMaterno} / 
  ${pacienteInstance?.receta?.medicoMilitar?.area}
<% } %>
  </td>
    
</tr>

   
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.citas.label" default="Citas" /></td>
<td valign="top" style="text-align: left;" >
<lu>
    <g:each in="${pacienteInstance.citas}" var="c">
      <li>
      <g:formatDate format="dd-MMM-yyyy" date="${c?.fechaCita}" /> 
      - ${c?.horaCita}. 
      - ${c?.tipoCita}. 
      Status: ${c?.status}
      </li>
    </g:each>
  </lu>
</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.estado.label" default="Estado" /></td>
  
<td valign="top" style="text-align: left;" >
  Paso: ${pacienteInstance?.estado?.secuencia} / ${pacienteInstance?.estado?.nombre}
</td>
    
</tr>
  
</tbody>
</table>
  </div>
<% if (pacienteInstance?.estado?.secuencia == 6) { %>
  <br/>
  <h2>Asignación de Auxiliar Auditivo</h2>
  <br/>
  
  <div class="list">
    <table style="border-color: white" border="1">
      <tr>
        <td class="etiqueta">Fecha de asignación</td>
        <td><g:formatDate format="dd-MMM-yyyy" date="${pacienteInstance.asigAuxAud.fechaAsignacion}" /></td>
      </tr>
            <tr>
        <td class="etiqueta">Paciente recibe Aux. Aud.</td>
        <td>
          <% if (pacienteInstance?.asigAuxAud?.pacienteRecibeAuxAud) {%>
            SI
          <% } else { %>
            NO
          <% } %>
        </td>
      </tr>
      <% if (!(pacienteInstance?.asigAuxAud?.pacienteRecibeAuxAud)) {%>
      <tr>
        <td class="etiqueta">Nombre de quien recibe</td>
        <td>${pacienteInstance?.asigAuxAud?.nombreRecibeAuxAud}</td>
      </tr>
      <% }  %>
      <tr>
        <td class="etiqueta">Firmó de recibido</td>
        <td>
          <% if (pacienteInstance?.asigAuxAud?.firmaRecibido) {%>
            SI
          <% } else { %>
            NO
          <% } %>
        </td>
      </tr>
</table>
    
    
    <BR/>
     <h2>Auxiliar Auditivo Entregado</h2>
    <table style="border-color: white" border="1">
      <g:each var="auxaudasig" in="${pacienteInstance?.asigAuxAud?.auxAudAsigns}">
        <tr>
        <td class="etiqueta">Oido</td>
        <td>${auxaudasig.oido}</td>
      </tr>
      <tr>
        <td class="etiqueta">Marca</td>
        <td>${auxaudasig?.auxAud?.marca}</td>
        </tr>
      <tr>
        <td class="etiqueta">Modelo</td>
        <td>${auxaudasig?.tipoAuxAud?.modelo}</td>
        </tr>
      <tr>
        <td class="etiqueta">Serie</td>
        <td>${auxaudasig?.serie}</td>
        </tr>
      </g:each>
   
       </table>
    
    <br/>
     <h2>Checklist de Entrega</h2>
    <TABLE style="border-color: white" border="1">
      <% 
        def hm = new HashMap()
        def checks = pacienteInstance?.asigAuxAud?.estadoChecks?.checks
        checks.each() {
          hm.put(it.checkEntrega.secuencia,it)
        }
       for ( i in 1..(hm.size()) ) {
          def check = hm.get(i)
       %>  
      <tr>
        <td width="400px">
          ${check?.checkEntrega?.descripcion}
        </td>
        <td>
          <% if (check?.status == true) {%>
            SI
          <% } else { %>
            NO
          <% } %>
        </td>
      </tr>
      <% } %>
      <tr>
        </table>
    <br/>
    
    <h2>Evaluación</h2>
    <TABLE style="border-color: white" border="1">
      <tr>
        <td class="etiqueta">Nivel de Servicio</td>
        <td>${pacienteInstance?.asigAuxAud?.nivelServicio}</td>
      <TR/>
      <TR>
        <td class="etiqueta">Comentarios</td>
        <td>${pacienteInstance?.asigAuxAud?.comentarios}</td>
      </tr>
    </table>
  </div>
  
  <% } %>
  
  
<% if (pacienteInstance?.estado?.secuencia != 6) { %>
  <sec:ifAnyGranted roles="ROLE_SUPER_P">
<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('paciente/edit/'+${pacienteInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
    </a>
  </span> 
</div>
    </sec:ifAnyGranted>  
<% } %>
