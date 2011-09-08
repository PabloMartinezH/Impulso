
<%@ page import="impulso.Empresa" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
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
              <a class="create" href="#" onclick="javascript:cargaAlCentro('empresa/create');" >
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
                        
                            <th><g:message code="empresa.id.label" default="Id" /></th>
                        
                            <th><g:message code="empresa.codigoEmp.label" default="Codigo Emp" /></th>
                        
                            <th><g:message code="empresa.nombreEmp.label" default="Nombre Emp" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            
                            <a href="#" onclick="javascript:cargaAlCentro('empresa/show/+${empresaInstance.id}');">
                              ${fieldValue(bean: empresaInstance, field: "id")}
                            </a>
                              
                            </td>
                        
                            <td>${fieldValue(bean: empresaInstance, field: "codigoEmp")}</td>
                        
                            <td>${fieldValue(bean: empresaInstance, field: "nombreEmp")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${empresaInstanceTotal}" />
            </div>
 