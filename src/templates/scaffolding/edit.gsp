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
  <span class="menuButton">
    <a class="create" href="#" onclick="javascript:cargaAlCentro('${domainClass.propertyName}/create');" >
      <g:message code="default.new.label" args="[entityName]" />
    </a>
  </span>
</div>


<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:if test="\${flash.message}">
      <div class="message">\${flash.message}</div>
</g:if>
<g:hasErrors bean="\${${propertyName}}">
  <div class="errors">
    <g:renderErrors bean="\${${propertyName}}" as="list" />
  </div>
</g:hasErrors>

<form id="formupdate${domainClass.propertyName}">
  <g:hiddenField name="id" value="\${${propertyName}?.id}" />
  <g:hiddenField name="version" value="\${${propertyName}?.version}" />
 
    <table>
      <tbody>
<%  excludedProps = Event.allEvents.toList() << 'version' << 'id' << 'dateCreated' << 'lastUpdated'
persistentPropNames = domainClass.persistentProperties*.name
props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
display = true
boolean hasHibernate = PluginManagerHolder.pluginManager.hasGrailsPlugin('hibernate')
props.each { p ->
  if (hasHibernate) {
    cp = domainClass.constrainedProperties[p.name]
    display = (cp?.display ?: true)
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
    <%  }   } %>
      </tbody>
    </table>
 
  <div class="nav">
    <span class="menuButton">
    <a href="#" class="save" onclick="javascript:sabEntidad('${domainClass.propertyName}','update');">
      <g:message code="default.button.update.label" default="Update"/>
    </a>
  </span> 
    <span class="menuButton">
    <a href="#" class="delete" onclick="javascript:confirmacionSab('${domainClass.propertyName}','delete');">
      <g:message code="default.button.delete.label" default="Delete"/>
    </a>
  </span> 
  </div>
<form>
