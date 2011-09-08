
<%@ page import="impulso.Receta" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'receta.label', default: 'Receta')}" />
     <script type="text/javascript"> 
    $(document).ready(function () {
      $("#id_search").quicksearch("table tbody tr", {
        noResults: '#noresults',
        stripeRows: ['odd', 'even'],
        loader: 'span.loading'
      });
    });
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
            <span class="menuButton">
              <a class="create" href="#" onclick="javascript:cargaAlCentro('receta/create');" >
                 <g:message code="default.new.label" args="[entityName]" />
              </a>
            </span>
        </div>
    
        
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            
            <form>
              <p class="etiqueta">Buscar</p>
              <input type="text" name="search" value="" id="id_search" /> 
              <span class="loading">Loading...</span> 	
            </form> 
            
            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <th><g:message code="receta.id.label" default="Id" /></th>
                        
                            <th><g:message code="receta.caracter.label" default="Caracter" /></th>
                        
                            <th><g:message code="receta.fechaReceta.label" default="Fecha Receta" /></th>
                        
                            <th><g:message code="receta.folio.label" default="Folio" /></th>
                        
                            <th><g:message code="receta.matricula.label" default="Matricula" /></th>
                        
                            <th><g:message code="receta.observaciones.label" default="Observaciones" /></th>
                        
                            <th><g:message code="receta.auxiliarAuditivo.label" default="Auxiliar Auditivo" /></th>
                        
                            <th><g:message code="receta.escalonServSanidad.label" default="Escalon Serv Sanidad" /></th>
                        
                            <th><g:message code="receta.medicoMilitar.label" default="Medico Militar" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${recetaInstanceList}" status="i" var="recetaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            
                            <a href="#" onclick="javascript:cargaAlCentro('receta/show/+${recetaInstance.id}');">
                              ${fieldValue(bean: recetaInstance, field: "id")}
                            </a>
                              
                            </td>
                        
                            <td>${fieldValue(bean: recetaInstance, field: "caracter")}</td>
                        
                            <td><g:formatDate format="dd-MMM-yyyy" date="${recetaInstance.fechaReceta}" /></td>
                        
                            <td>${fieldValue(bean: recetaInstance, field: "folio")}</td>
                        
                            <td>${fieldValue(bean: recetaInstance, field: "matricula")}</td>
                        
                            <td>${fieldValue(bean: recetaInstance, field: "observaciones")}</td>
                        
                            <td>${fieldValue(bean: recetaInstance, field: "auxiliarAuditivo")}</td>
                        
                            <td>${fieldValue(bean: recetaInstance, field: "escalonServSanidad")}</td>
                        
                            <td>${fieldValue(bean: recetaInstance, field: "medicoMilitar")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${recetaInstanceTotal}" />
            </div>
 