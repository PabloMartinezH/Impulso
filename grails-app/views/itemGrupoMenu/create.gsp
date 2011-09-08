

<%@ page import="impulso.ItemGrupoMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'itemGrupoMenu.label', default: 'ItemGrupoMenu')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${itemGrupoMenuInstance}">
            <div class="errors">
                <g:renderErrors bean="${itemGrupoMenuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="itemGrupoMenu.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: itemGrupoMenuInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="30" value="${itemGrupoMenuInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigo"><g:message code="itemGrupoMenu.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: itemGrupoMenuInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" maxlength="15" value="${itemGrupoMenuInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ruta"><g:message code="itemGrupoMenu.ruta.label" default="Ruta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: itemGrupoMenuInstance, field: 'ruta', 'errors')}">
                                    <g:textField name="ruta" value="${itemGrupoMenuInstance?.ruta}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
