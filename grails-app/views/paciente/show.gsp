
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
      <td class="etiqueta"><g:message code="paciente.tipoPaciente.label" default="Tipo Paciente" /></td>
  
<td>${pacienteInstance?.tipoPaciente?.nombre}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.citas.label" default="Citas" /></td>
<td valign="top" style="text-align: left;" >
<lu>
    <g:each in="${pacienteInstance.citas}" var="c">
      <li>
      <g:formatDate format="dd-MMM-yyyy" date="${c?.fechaCita}" /> 
      - ${c?.horaCita}. 
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
  
    <tr>
      <td class="etiqueta"><g:message code="paciente.telefonos.label" default="Telefonos" /></td>
  
<td valign="top" style="text-align: left;" >
  <ul>
    <g:each in="${pacienteInstance.telefonos}" var="t">
      <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
    </g:each>
  </ul>
</td>
    
</tr>
</tbody>
</table>
  </div>

<% if (pacienteInstance?.estado?.secuencia == 6) { %>
  <br/>
  <h2>Asignación de Auxiliar Auditivo</h2>
  <br/>
  <div class="list" style="border-color: white" border="1">
    <table>
      <tr>
        <td class="etiqueta">Fecha de asignación</td>
        <td><g:formatDate format="dd-MMM-yyyy" date="${pacienteInstance?.asigAuxAud?.fechaAsignacion}" /></td>
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

      <tr>
        <td colspan="2">Auxiliar Auditivo Entregado</td>
      </tr>
      <tr>
        <td class="etiqueta">Marca</td>
        <td>${pacienteInstance?.asigAuxAud?.auxAudAsign?.auxAud?.marca}</td>
        </tr>
      <tr>
        <td class="etiqueta">Modelo</td>
        <td>${pacienteInstance?.asigAuxAud?.auxAudAsign?.tipoAuxAud?.modelo}</td>
        </tr>
      <tr>
        <td class="etiqueta">Serie</td>
        <td>${pacienteInstance?.asigAuxAud?.auxAudAsign?.serie}</td>
        </tr>
      <tr>
        <td class="etiqueta">Oido</td>
        <td>${pacienteInstance?.asigAuxAud?.auxAudAsign?.oido}</td>
      </tr>
      
   
      
      <tr>
        <td colspan="2">Checklist de Entrega</td>
      </tr>
      <g:each in="${pacienteInstance?.asigAuxAud?.estadoChecks}" var="check">
      <tr>
        <td>
          ${check?.checkEntrega?.descripcion}
        </td>
        <td>
          <% if (check) {%>
            SI
          <% } else { %>
            NO
          <% } %>
        </td>
      </tr>
      </g:each>
      <tr>
        
      </tr>
      <td>Evaluación</td>
      <tr>
        <td class="etiqueta">Nivel de Servicio</td>
        <td>${pacienteInstance?.asigAuxAud?.nivelServicio}</td>
        <td class="etiqueta">Comentarios</td>
        <td>${pacienteInstance?.asigAuxAud?.comentarios}</td>
      </tr>
    </table>
  </div>
  
  <% } %>
  
<% if (pacienteInstance?.estado?.secuencia != 6) { %>
<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('paciente/edit/'+${pacienteInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
    </a>
  </span> 
</div>
<% } %>
