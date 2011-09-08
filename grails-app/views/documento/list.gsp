
<%@ page import="impulso.Documento" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
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
              <a class="create" href="#" onclick="javascript:cargaAlCentro('documento/create');" >
                 Nuevo Documento
              </a>
            </span>
        </div>
    
        
            <h1>Lista de documentos</h1>
            
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
                        
                            
                        
                            <th><g:message code="documento.ordenDoc.label" default="Secuencia" /></th>
                        
                            <th><g:message code="documento.codigoDoc.label" default="Código" /></th>
                        
                            <th><g:message code="documento.nombreDoc.label" default="Nombre" /></th>
                        
                            <th><g:message code="documento.caracteristicas.label" default="Caracteristicas" /></th>
                        
                            <th><g:message code="documento.tipoCita.label" default="Tipo Cita" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${documentoInstanceList}" status="i" var="documentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: documentoInstance, field: "ordenDoc")}</td>
                        
                            <td>
                              <a href="#" onclick="javascript:cargaAlCentro('documento/show/+${documentoInstance.id}');">
                              ${fieldValue(bean: documentoInstance, field: "codigoDoc")}
                                </a>
                            </td>
                        
                            <td>${fieldValue(bean: documentoInstance, field: "nombreDoc")}</td>
                        
                            <td>${fieldValue(bean: documentoInstance, field: "caracteristicas")}</td>
                        
                            <td>${documentoInstance.tipoCita.codigo}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${documentoInstanceTotal}" />
            </div>
 