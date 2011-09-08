
<%@ page import="impulso.MedicoMilitar" %>

    
        
        
        <g:set var="entityName" value="${message(code: 'medicoMilitar.label', default: 'MedicoMilitar')}" />
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
              <a class="create" href="#" onclick="javascript:cargaAlCentro('medicoMilitar/create');" >
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
                        
                            <th><g:message code="medicoMilitar.id.label" default="Id" /></th>
                        
                            <th><g:message code="medicoMilitar.nombre.label" default="Nombre" /></th>
                        
                            <th><g:message code="medicoMilitar.apePaterno.label" default="Ape Paterno" /></th>
                        
                            <th><g:message code="medicoMilitar.apeMaterno.label" default="Ape Materno" /></th>
                        
                            <th><g:message code="medicoMilitar.area.label" default="Area" /></th>
                        
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="${medicoMilitarInstanceList}" status="i" var="medicoMilitarInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>
                            
                            <a href="#" onclick="javascript:cargaAlCentro('medicoMilitar/show/+${medicoMilitarInstance.id}');">
                              ${fieldValue(bean: medicoMilitarInstance, field: "id")}
                            </a>
                              
                            </td>
                        
                            <td>${fieldValue(bean: medicoMilitarInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: medicoMilitarInstance, field: "apePaterno")}</td>
                        
                            <td>${fieldValue(bean: medicoMilitarInstance, field: "apeMaterno")}</td>
                        
                            <td>${fieldValue(bean: medicoMilitarInstance, field: "area")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${medicoMilitarInstanceTotal}" />
            </div>
 