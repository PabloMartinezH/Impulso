
<%@ page import="impulso.Usuario" %>

<sec:ifAnyGranted roles="ROLE_ADMIN_IM">

        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
     <script type="text/javascript"> 
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
            <span class="menuButton">
              <a class="create" href="#" onclick="javascript:cargaAlCentro('usuario/create');" >
                 <g:message code="default.new.label" args="[entityName]" />
              </a>
            </span>
        </div>
    
    <br/>    
            <h1>Usuarios del Sistema</h1>
    <br/>        
          
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th><g:message code="usuario.empresa.label" default="Empresa" /></th>
                        
                            <th><g:message code="usuario.username.label" default="Username" /></th>
                        
                            <th><g:message code="usuario.rol.label" default="Rol" /></th>
                            
                            <th><g:message code="usuario.nombre.label" default="Nombre" /></th>
                            
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                          
                          <td>${fieldValue(bean: usuarioInstance, field: "empresa")}</td>
                          
                            <td>
                              <a href="#" onclick="javascript:cargaAlCentro('usuario/show/+${usuarioInstance.id}');">
${fieldValue(bean: usuarioInstance, field: "username")}
                                </a>
                              </td>
                        
                            <td>${usuarioInstance.rol.authority}</td>  

                            <td>${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
          </sec:ifAnyGranted> 
<sec:ifNotGranted roles="ROLE_ADMIN_IM">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>