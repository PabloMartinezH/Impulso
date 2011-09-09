

<%@ page import="impulso.Usuario" %>


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
<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<br/>
<g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${usuarioInstance}">
  <div class="errors">
    <g:renderErrors bean="${usuarioInstance}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdateusuario">
  <g:hiddenField name="id" value="${usuarioInstance?.id}" />
  <g:hiddenField name="version" value="${usuarioInstance?.version}" />
 
    <table>
      <tbody>

        
        <tr >
          <td class="etiqueta">
            <label for="empresa"><g:message code="usuario.empresa.label" default="Empresa" /></label>
          </td>
          <td>${usuarioInstance.empresa}</td>
        </tr>

  
        <% if(usuarioInstance.empresa.equals('RDR')) { %>
            <tr >
          <td class="etiqueta">
            <label for="oficina"><g:message code="usuario.oficina.label" default="Oficina" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'oficina', 'errors')}">
    <g:select name="oficina.id" from="${impulso.Oficina.list()}" optionKey="id" optionValue="sucursal" value="${usuarioInstance?.oficina?.id}"  />
          </td>
        </tr>
        <% } %>
        
         <tr >
          <td class="etiqueta">
            <label for="nombre"><g:message code="usuario.nombre.label" default="Nombre" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nombre', 'errors')}">
    <g:textField name="nombre" size="50" maxlength="150" onchange="validarCampo(this,'texto','Nombre')" value="${usuarioInstance?.nombre}" />
          </td>
        </tr>
        
        
        <tr >
          <td class="etiqueta">
            <label for="username"><g:message code="usuario.username.label" default="Username" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'username', 'errors')}">
    <g:textField name="username" size="12" maxlength="12" onchange="validarCampo(this,'texto','Username')" value="${usuarioInstance?.username}" />
          </td>
        </tr>
    
        <tr >
          <td class="etiqueta">
            <label for="password"><g:message code="usuario.password.label" default="Password" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'password', 'errors')}">
            <g:passwordField name="password" value="${usuarioInstance?.password}" /> 
          </td>
        </tr>

        <tr >
          <td class="etiqueta">
            <label for="rol"><g:message code="usuario.rol.label" default="Rol" /></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'rol', 'errors')}">
    <g:select name="rol.id" from="${impulso.Rol.list()}" optionKey="id" optionValue="nombre" value="${usuarioInstance?.rol?.id}"  />
          </td>
        </tr>
    
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('usuario','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('usuario','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
