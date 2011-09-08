
<%@ page import="impulso.Estado" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
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
              <a class="create" href="#" onclick="javascript:cargaAlCentro('estado/create');" >
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
                        
                            <th><g:message code="estado.id.label" default="Id" /></th>
                        
                            <th><g:message code="estado.nombre.label" default="Nombre" /></th>
                        
                            <th><g:message code="estado.boton.label" default="Boton" /></th>
                        
                            <th><g:message code="estado.secuencia.label" default="Secuencia" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${estadoInstanceList}" status="i" var="estadoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            
                            <a href="#" onclick="javascript:cargaAlCentro('estado/show/+${estadoInstance.id}');">
                              ${fieldValue(bean: estadoInstance, field: "id")}
                            </a>
                              
                            </td>
                        
                            <td>${fieldValue(bean: estadoInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: estadoInstance, field: "boton")}</td>
                        
                            <td>${fieldValue(bean: estadoInstance, field: "secuencia")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${estadoInstanceTotal}" />
            </div>
 