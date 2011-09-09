
<%@ page import="impulso.TipoAuxAud" %>

    
        
<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
        <g:set var="entityName" value="${message(code: 'tipoAuxAud.label', default: 'TipoAuxAud')}" />
     <script type="text/javascript"> 
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
        </div>
    
        <BR/>
            <h1>Tipos de Auxiliares Auditivos</h1>
            
           <BR/>
            
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th><g:message code="tipoAuxAud.id.label" default="Id" /></th>
                        
                            <th><g:message code="tipoAuxAud.modelo.label" default="Modelo" /></th>
                        
                            <th><g:message code="tipoAuxAud.nombre.label" default="Nombre" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${tipoAuxAudInstanceList}" status="i" var="tipoAuxAudInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            
                            <a href="#" onclick="javascript:cargaAlCentro('tipoAuxAud/show/+${tipoAuxAudInstance.id}');">
                              ${fieldValue(bean: tipoAuxAudInstance, field: "id")}
                            </a>
                              
                            </td>
                        
                            <td>${fieldValue(bean: tipoAuxAudInstance, field: "modelo")}</td>
                        
                            <td>${fieldValue(bean: tipoAuxAudInstance, field: "nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
          </sec:ifAnyGranted>
<sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>