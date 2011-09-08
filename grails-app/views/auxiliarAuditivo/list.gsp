
<%@ page import="impulso.AuxiliarAuditivo" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'auxiliarAuditivo.label', default: 'AuxiliarAuditivo')}" />
     <script type="text/javascript"> 
 
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
            <span class="menuButton">
              <a class="create" href="#" onclick="javascript:cargaAlCentro('auxiliarAuditivo/create');" >
                 <g:message code="default.new.label" args="[entityName]" />
              </a>
            </span>
        </div>
    
        
            <h1>Auxiliares Auditivos</h1>
            
            <br></br>
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                        
                            <th><g:message code="auxiliarAuditivo.numeroAA.label" default="#" /></th>
                            
                            <th><g:message code="auxiliarAuditivo.modeloAA.label" default="Modelo" /></th>
                        
                            <th><g:message code="auxiliarAuditivo.nombreAA.label" default="Nombre" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${auxiliarAuditivoInstanceList}" status="i" var="auxiliarAuditivoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        
                          <td>${fieldValue(bean: auxiliarAuditivoInstance, field: "numeroAA")}</td>
                          
                            <td>
                              <a href="#" onclick="javascript:cargaAlCentro('auxiliarAuditivo/show/+${auxiliarAuditivoInstance.id}');">
${fieldValue(bean: auxiliarAuditivoInstance, field: "modeloAA")}
                                </a>
                              </td>
                        
                            <td>${fieldValue(bean: auxiliarAuditivoInstance, field: "nombreAA")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${auxiliarAuditivoInstanceTotal}" />
            </div>
 