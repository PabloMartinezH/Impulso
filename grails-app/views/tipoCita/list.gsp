
<%@ page import="impulso.TipoCita" %>

    
<sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
        
        <g:set var="entityName" value="${message(code: 'tipoCita.label', default: 'TipoCita')}" />
     <script type="text/javascript"> 
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
        </div>
    
        <BR/>
            <h1>Tipos de Cita</h1>
         <BR/>   

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                          <th><g:message code="tipoCita.secuencia.label" default="Secuencia" /></th>

                          <th><g:message code="tipoCita.codigo.label" default="Codigo" /></th>
                        
                            <th><g:message code="tipoCita.nombre.label" default="Nombre" /></th>
                        
                            
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${tipoCitaInstanceList}" status="i" var="tipoCitaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                           <td>${fieldValue(bean: tipoCitaInstance, field: "secuencia")}</td>
                           
                            <td>${fieldValue(bean: tipoCitaInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: tipoCitaInstance, field: "nombre")}</td>
                        
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
         </sec:ifAnyGranted>
           <sec:ifNotGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_CONSUL_S">
  <h2><p align="center">El usuario <b><sec:username/></b> no tiene permisos para usar esta función</p></h2>
</sec:ifNotGranted>