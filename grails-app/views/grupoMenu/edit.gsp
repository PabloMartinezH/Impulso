

<%@ page import="impulso.GrupoMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'grupoMenu.label', default: 'GrupoMenu')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${grupoMenuInstance}">
            <div class="errors">
                <g:renderErrors bean="${grupoMenuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${grupoMenuInstance?.id}" />
                <g:hiddenField name="version" value="${grupoMenuInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="grupoMenu.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grupoMenuInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="30" value="${grupoMenuInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codigo"><g:message code="grupoMenu.codigo.label" default="Codigo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grupoMenuInstance, field: 'codigo', 'errors')}">
                                    <g:textField name="codigo" maxlength="15" value="${grupoMenuInstance?.codigo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ruta"><g:message code="grupoMenu.ruta.label" default="Ruta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grupoMenuInstance, field: 'ruta', 'errors')}">
                                    <g:textField name="ruta" value="${grupoMenuInstance?.ruta}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="items"><g:message code="grupoMenu.items.label" default="Items" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grupoMenuInstance, field: 'items', 'errors')}">
                                    <g:select name="items" from="${fusion.ItemGrupoMenu.list()}" multiple="yes" optionKey="id" size="5" value="${grupoMenuInstance?.items*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
