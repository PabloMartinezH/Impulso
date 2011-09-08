
<%@ page import="impulso.TipoPaciente" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'tipoPaciente.label', default: 'TipoPaciente')}" />
     <script type="text/javascript"> 
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
            <span class="menuButton">
              <a class="create" href="#" onclick="javascript:cargaAlCentro('tipoPaciente/create');" >
                 <g:message code="default.new.label" args="[entityName]" />
              </a>
            </span>
        </div>
    
        
            <h1>Tipos de Paciente</h1>
            
            <br></br>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            
                        
                            <th><g:message code="tipoPaciente.codigo.label" default="Código" /></th>
                        
                            <th><g:message code="tipoPaciente.nombre.label" default="Nombre" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${tipoPacienteInstanceList}" status="i" var="tipoPacienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                              <a href="#" onclick="javascript:cargaAlCentro('tipoPaciente/show/+${tipoPacienteInstance.id}');">
${fieldValue(bean: tipoPacienteInstance, field: "codigo")}
                                </a>
                              </td>
                        
                            <td>${fieldValue(bean: tipoPacienteInstance, field: "nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tipoPacienteInstanceTotal}" />
            </div>
 