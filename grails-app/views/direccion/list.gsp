
<%@ page import="impulso.Direccion" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />
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
              <a class="create" href="#" onclick="javascript:cargaAlCentro('direccion/create');" >
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
                        
                            <th><g:message code="direccion.id.label" default="Id" /></th>
                        
                            <th><g:message code="direccion.calle.label" default="Calle" /></th>
                        
                            <th><g:message code="direccion.numExt.label" default="Num Ext" /></th>
                        
                            <th><g:message code="direccion.numInt.label" default="Num Int" /></th>
                        
                            <th><g:message code="direccion.colonia.label" default="Colonia" /></th>
                        
                            <th><g:message code="direccion.cp.label" default="Cp" /></th>
                        
                            <th><g:message code="direccion.ciudad.label" default="Ciudad" /></th>
                        
                            <th><g:message code="direccion.pais.label" default="Pais" /></th>
                        
                            <th><g:message code="direccion.estado.label" default="Estado" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${direccionInstanceList}" status="i" var="direccionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            
                            <a href="#" onclick="javascript:cargaAlCentro('direccion/show/+${direccionInstance.id}');">
                              ${fieldValue(bean: direccionInstance, field: "id")}
                            </a>
                              
                            </td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "calle")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "numExt")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "numInt")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "colonia")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "cp")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "ciudad")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "pais")}</td>
                        
                            <td>${fieldValue(bean: direccionInstance, field: "estado")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${direccionInstanceTotal}" />
            </div>
 