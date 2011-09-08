<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.plugins.PluginManagerHolder %>
<%=packageName%>

<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />

<div class="nav">
  <span class="menuButton"><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton">
    <a href="#" class="list" onclick="javascript:cargaAlCentro('${domainClass.propertyName}/list');">
      <g:message code="default.list.label" args="[entityName]" />
    </a>
  </span> 
</div>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="\${flash.message}">
      <div class="message">\${flash.message}</div>
</g:if>
<g:hasErrors bean="\${${propertyName}}">
  <div class="errors">
    <g:renderErrors bean="\${${propertyName}}" as="list" />
  </div>
</g:hasErrors>

<form id="formsave${domainClass.propertyName}">
  
    <table>
      <tbody>
<%  excludedProps = Event.allEvents.toList() << 'version' << 'id' << 'dateCreated' << 'lastUpdated'
persistentPropNames = domainClass.persistentProperties*.name
props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
display = true
boolean hasHibernate = PluginManagerHolder.pluginManager.hasGrailsPlugin('hibernate')
props.each { p ->
  if (!Collection.class.isAssignableFrom(p.type)) {
    if (hasHibernate) {
      cp = domainClass.constrainedProperties[p.name]
      display = (cp ? cp.display : true)
    }
    if (display) { %>
        <tr >
          <td class="etiqueta">
            <label for="${p.name}"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
          </td>
          <td valign="top" class="value \${hasErrors(bean: ${propertyName}, field: '${p.name}', 'errors')}">
      ${renderEditor(p)}
          </td>
        </tr>
      <%  }   }   } %>
      </tbody>
    </table>
  
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('${domainClass.propertyName}','save');">
      <g:message code="default.button.save.label" default="Save"/>
    </a>
  </span> 
  
  </div>
 <form>
