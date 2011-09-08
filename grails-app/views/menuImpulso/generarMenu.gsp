

<%@ page import="impulso.GrupoMenu" %>
<%@ page import="impulso.ItemGrupoMenu" %>
<%@ page import="java.util.Collections" %>


<div id="accordion">
 <g:each var="grupo" in="${grupos}">
    <h3><a href="#">${grupo.nombre}</a></h3>
      <div>
        <ul>
          <% def submenu = grupo.items;
             submenu.each { %>
            <li><a href="#" onclick="javascript:cargaAlCentro('${it.ruta}');">${it.nombre}</a></li>  
          <% } %>
          
        </ul>
      </div> 
  </g:each>
</div>
 