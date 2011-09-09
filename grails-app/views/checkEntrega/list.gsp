
<%@ page import="impulso.CheckEntrega" %>



<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
<g:set var="entityName" value="${message(code: 'checkEntrega.label', default: 'CheckEntrega')}" />
<script type="text/javascript"> 
  
</script>    


<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>

</div>

<br/>
<h1>Kit de Entrega de Auxiliar Auditivo</h1>

<br/>


<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<div class="list">
  <table>
    <thead>
      <tr>

        

    <th><g:message code="checkEntrega.secuencia.label" default="Secuencia" /></th>

    <th><g:message code="checkEntrega.descripcion.label" default="Descripción" /></th>

    <th><g:message code="checkEntrega.necesario.label" default="Necesario" /></th>

    </tr>


    </thead>
    <tbody>
    <g:each in="${checkEntregaInstanceList}" status="i" var="checkEntregaInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        
        <td><p align="center">${fieldValue(bean: checkEntregaInstance, field: "secuencia")}</p></td>

        <td>${fieldValue(bean: checkEntregaInstance, field: "descripcion")}</td>

        <td>
      <% if(checkEntregaInstance.necesario) { %>
        SI
      <% } else { %>
       OPCIONAL
       <% } %>
      </td>

      </tr>
    </g:each>
    </tbody>
  </table>
</div>
</sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>