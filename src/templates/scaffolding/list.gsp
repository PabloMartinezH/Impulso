<% import grails.persistence.Event %>
<%=packageName%>

    
        
        
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
     <script type="text/javascript"> 
    \$(document).ready(function () {
      \$("#id_search").quicksearch("table tbody tr", {
        noResults: '#noresults',
        stripeRows: ['odd', 'even'],
        loader: 'span.loading'
      });
    });
    </script>    


        <div class="nav">
            <span class="menuButton">
              <a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            </span>
            <span class="menuButton">
              <a class="create" href="#" onclick="javascript:cargaAlCentro('${domainClass.propertyName}/create');" >
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
            
            
            <g:if test="\${flash.message}">
            <div class="message">\${flash.message}</div>
            </g:if>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        <%  excludedProps = Event.allEvents.toList() << 'version'
                            allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
                            props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && !Collection.isAssignableFrom(it.type) }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.eachWithIndex { p, i ->  %>
                            <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
                        <% } %>
                        </tr>
                        

                    </thead>
                    <tbody>
                    <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                        <tr class="\${(i % 2) == 0 ? 'odd' : 'even'}">
                        <%  props.eachWithIndex { p, i ->
                                if (i == 0) { %>
                            <td>
                            
                            <a href="#" onclick="javascript:cargaAlCentro('${domainClass.propertyName}/show/+\${${propertyName}.id}');">
                              \${fieldValue(bean: ${propertyName}, field: "${p.name}")}
                            </a>
                              
                            </td>
                        <%      } else  {
                                    if (p.type == Boolean.class || p.type == boolean.class) { %>
                            <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                        <%          } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
                            <td><g:formatDate format="dd-MMM-yyyy" date="\${${propertyName}.${p.name}}" /></td>
                        <%          } else { %>
                            <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                        <%  }   }   } %>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="\${${propertyName}Total}" />
            </div>
 