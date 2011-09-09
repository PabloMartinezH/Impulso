
<%@ page import="impulso.Usuario" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />


<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('usuario/list');">
      Lista de Usuarios
    </a>
  </span> 
</div>

<br/>
  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
  <br/>
  <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
</g:if>

<table>
  <tbody>

    <tr>
      <td class="etiqueta"><g:message code="usuario.empresa.label" default="Empresa" /></td>
  
<td>${fieldValue(bean: usuarioInstance, field: "empresa")}</td>
    
</tr>
  <% if(usuarioInstance.empresa.equals('RDR')) { %>
    <tr>
      <td class="etiqueta"><g:message code="usuario.oficina.label" default="Oficina" /></td>
<td>${usuarioInstance?.oficina?.sucursal}</td>
</tr>
<% } %>
    
     <tr>
      <td class="etiqueta"><g:message code="usuario.nombre.label" default="Nombre" /></td>
  
<td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
    
</tr>

    <tr>
      <td class="etiqueta"><g:message code="usuario.username.label" default="Username" /></td>
  
<td>${fieldValue(bean: usuarioInstance, field: "username")}</td>
    
</tr>
  
    <tr>
      <td class="etiqueta"><g:message code="usuario.password.label" default="Password" /></td>
  
      <td><input type="password" value="${fieldValue(bean: usuarioInstance, field: "password")}" readOnly="true"/></td>
    
</tr>
  
  


    <tr>
      <td class="etiqueta"><g:message code="usuario.rol.label" default="Rol" /></td>
  
<td>${usuarioInstance?.rol?.nombre}</td>
    
</tr>
  
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('usuario/edit/'+${usuarioInstance?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

