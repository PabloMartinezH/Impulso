<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="impulso.CheckEntrega" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
</div>
<h1>Documentar Entrega de Auxiliar Auditivo</h1>
<br/>


<g:hiddenField name="idCita" id="idCita" value="${citaInstance.id}" />
<g:hiddenField name="idPaciente" id="idPaciente" value="${pacienteInstance.id}" />

<table>
  <tr>
    <td class="etiqueta">Fecha de entrega</td>
    <td><g:textField size="30" value="" id="fechaCita" name="fechaEntrega" value="${fechaActual}" readonly="true" class="noEditable" />*</td>
</table>
 
<br/>

<div class="list">
  <h2>Paciente</h2>
  <br/>
<table style="border-color: white" border="1">
  <tr>
    <td class="etiqueta">¿Es el paciente quien recibe el Aux. Aud.? *</td>
    <td>
       &nbsp; &nbsp; Si.....<input type="radio"  name="pacienteRecibe" value="${true}" checked="checked"/> 
       &nbsp; &nbsp; No....<input type="radio"  name="pacienteRecibe" value="${false}"/>
    </td>
  <tr>
    <tr>
    <td class="etiqueta">Nombre de quien recibe el Aux. Aud.</td>
    <td><g:textField size="30" onchange="validarCampo(this,'texto','Nombre')" id="nombreRecibeAuxAud" name="nombreRecibeAuxAud" />*(Si es diferente al paciente)</td>
  </tr>
    </table>
  </div>
<br/>
<br/>

<div class="list">
  <h2>Áuxiliar Auditivo Entregado</h2>
  <table style="border-color: white" border="1">
    <tr>
      <td class="etiqueta" size="40px">Oido Derecho</td>  
      <td>
         &nbsp; &nbsp; Si.....<input type="radio"  name="oidoDerecho" value="${true}" /> 
         &nbsp; &nbsp; No....<input type="radio"  name="oidoDerecho" value="${false}" checked="checked"/>
      </td>
    </tr>
    <tr>
        <td class="etiqueta" size="100px">Marca</td>
        <td>
        <g:select name="marcaDerecho" id="marcaDerecho" from="${auxsAuditivosInstance}" value="${auxAudInstance?.id}" optionKey="id" optionValue="marca"  />*
        </td>
  </tr>
  
  <tr>
        <td class="etiqueta" size="20px">Modelo</td>
        <td>
        <g:select name="tipoAuxAudDerecho" id="tipoAuxAudDerecho" from="${impulso.TipoAuxAud.list()}" value="${pacienteInstance.tipoAuxAud}" optionValue="modelo"  optionKey="id" />
        </td>
  </tr>
      <tr>
        <td class="etiqueta" size="20px">No. Serie</td>
        <td><g:textField size="30" onchange="validarCampo(this,'serie','Serie')" id="serieDerecho" name="serieDerecho" />*</td>
  </table>
  
  <br/>
  <table style="border-color: white" border="1">
    <tr>
      <td class="etiqueta" size="40px">Oido Izquierdo</td>  
      <td>
         &nbsp; &nbsp; Si.....<input type="radio"  name="oidoIzquierdo" value="${true}" /> 
         &nbsp; &nbsp; No....<input type="radio"  name="oidoIzquierdo" value="${false}" checked="checked"/>
      </td>
    </tr>
    <tr>
        <td class="etiqueta" size="100px">Marca</td>
        <td>
        <g:select name="marcaIzquierdo" id="marcaIzquierdo" from="${auxsAuditivosInstance}" value="${auxAudInstance?.id}" optionKey="id" optionValue="marca"  />*
        </td>
  </tr>
  
  <tr>
        <td class="etiqueta" size="20px">Modelo</td>
        <td>
        <g:select name="tipoAuxAudIzquierdo" id="tipoAuxAudIzquierdo" from="${impulso.TipoAuxAud.list()}" value="${pacienteInstance.tipoAuxAud}" optionValue="modelo"  optionKey="id" />
        </td>
  </tr>
      <tr>
        <td class="etiqueta" size="20px">No. Serie</td>
        <td><g:textField size="30" onchange="validarCampo(this,'serie','Serie')" id="serieIzquierdo" name="serieIzquierdo" />*</td>
  </table>
</div>  


<br/>
<br/>
<div class="list" id="checks" >
  <h2>Checklist de Entrega</h2>
<% def checks = CheckEntrega.list(sort:"secuencia", order:"asc") %>
  <table style="border-color: white" border="1">
    <tr>
      <th>#</th>
      <th>Producto</th>
      <th>Requerido</th>
      <th>Entregado</th>
    </tr>
<% checks.each() { %>
    <tr>
      <td><p align="center">${it.secuencia}</p></td>
      <td><p>${it.descripcion}</p></td>
      <% if(it.necesario == true) { %>
      <td><p align="center">Si</p></td>
      <% } else { %>
      <td><p align="center">Op</p></td>
      <% } %>
      <td><p align="center"><g:checkBox codigo="${it.secuencia}" id="${it.id}" class="check" necesario="${it.necesario}"/></p></td>
    </tr>
  <% } %>
  </table>
  <p>* Op = Opcional</p>
</div>


  <br/>
  <br/>
<div class="list">
<table style="border-color: white" border="1">
    <tr>
    <td class="etiqueta">¿La persona firmó de recibido?</td>
    <td><g:checkBox id="firmaRecibido" name="firmaRecibido" value="${false}" />*</td>
  </tr>
</table>  
</div>

  <br/>
  <br/>
<div class="list" >
  <h2>Calificación del servicio</h2>
<table style="border-color: white" border="1">
 <tr>
    <td class="etiqueta">Calificación del servicio</td>
    <td>
      <g:select name="nivelServ" id="nivelServ" from="${asigAuxAudInstance.constraints.nivelServicio.inList}" value="${asigAuxAudInstance?.nivelServicio}" valueMessagePrefix="asignacionAuxAud.nivelServicio" />*
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Comentario sobre el servicio</td>
    <td>
      <g:textArea name="comentarios" onchange="javascript:validarCampo(this,'comentario','Comentarios')" id="comentarios" cols="40" rows="4"/>
    </td>
  </tr>
  </table>
</div>
  

  
<BR/>
<div class="nav">
  <span class="menuButton">
    <button type="button" onclick="javascript:guardarDocumentarEntrega();" >Guardar</button>
  </span>
</div>
