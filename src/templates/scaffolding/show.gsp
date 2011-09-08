<% import grails.persistence.Event %>
<%=packageName%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

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


  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
  <g:if test="\${flash.message}">
        <div class="message">\${flash.message}</div>
</g:if>

<table>
  <tbody>
<%  excludedProps = Event.allEvents.toList() << 'version'
allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
props.each { p -> %>
    <tr>
      <td class="etiqueta"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></td>
  <%  if (p.isEnum()) { %>
<td>\${${propertyName}?.${p.name}?.encodeAsHTML()}</td>
    <%  } else if (p.oneToMany || p.manyToMany) { %>
<td valign="top" style="text-align: left;" >
  <ul>
    <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
      <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
    </g:each>
  </ul>
</td>
    <%  } else if (p.manyToOne || p.oneToOne) { %>
<td><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></td>
    <%  } else if (p.type == Boolean.class || p.type == boolean.class) { %>
<td><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></td>
    <%  } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
<td><g:formatDate format="dd-MMM-yyyy" date="\${${propertyName}?.${p.name}}" /></td>
    <%  } else if(!p.type.isArray()) { %>
<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
    <%  } %>
</tr>
  <%  } %>
</tbody>
</table>



<div class="nav">
  <span class="menuButton">
    <a class="edit" href="#" onclick="javascript:cargaAlCentro('${domainClass.propertyName}/edit/'+\${${propertyName}?.id});">
      <g:message code="default.button.edit.label" default="Edit"/>
      
    </a>
  </span> 
</div>

