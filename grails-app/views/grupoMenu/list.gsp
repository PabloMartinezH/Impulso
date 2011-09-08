
<%@ page import="impulso.GrupoMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'grupoMenu.label', default: 'GrupoMenu')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'grupoMenu.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'grupoMenu.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="codigo" title="${message(code: 'grupoMenu.codigo.label', default: 'Codigo')}" />
                        
                            <g:sortableColumn property="ruta" title="${message(code: 'grupoMenu.ruta.label', default: 'Ruta')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${grupoMenuInstanceList}" status="i" var="grupoMenuInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${grupoMenuInstance.id}">${fieldValue(bean: grupoMenuInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: grupoMenuInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: grupoMenuInstance, field: "codigo")}</td>
                        
                            <td>${fieldValue(bean: grupoMenuInstance, field: "ruta")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${grupoMenuInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
