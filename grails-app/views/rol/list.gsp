
<%@ page import="impulso.Rol" %>

<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM">

        <g:set var="entityName" value="${message(code: 'rol.label', default: 'Rol')}" />
     <script type="text/javascript"> 
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
        </div>
    
        <br/>
            <h1>Roles del Sistema</h1>
            
          <br/>
            
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        

                            <th><g:message code="rol.authority.label" default="Código" /></th>
                        
                            <th><g:message code="rol.nombre.label" default="Nombre" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${rolInstanceList}" status="i" var="rolInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            
                            <td>${fieldValue(bean: rolInstance, field: "authority")}</td>
                        
                            <td>${fieldValue(bean: rolInstance, field: "nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
          </sec:ifAnyGranted>
        <sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>   