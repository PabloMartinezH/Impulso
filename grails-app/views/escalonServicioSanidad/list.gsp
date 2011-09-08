
<%@ page import="impulso.EscalonServicioSanidad" %>


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
    <a class="create" href="#" onclick="javascript:cargaAlCentro('escalonServicioSanidad/create');" >
      Nuevo Escalón de Servicio
    </a>
  </span>
</div>

<br></br>
<h1>Escalones de Servicio de Sanidad</h1>

<form>
  <p class="etiqueta">Buscar</p>
  <input type="text" name="search" value="" id="id_search" /> 
  <span class="loading">Loading...</span> 	
</form> 

<br></br>
<div class="list">
  <table>
    <thead>
      <tr>
        <th><g:message code="escalonServicioSanidad.codigoESS.label" default="Código" /></th>
    <th><g:message code="escalonServicioSanidad.zonaMilitar.label" default="Zona Militar" /></th>
    <th><g:message code="escalonServicioSanidad.nombreInst.label" default="Nombre" /></th>
    <th><g:message code="escalonServicioSanidad.domicilioInst.label" default="Domicilio" /></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${escalonServicioSanidadInstanceList}" status="i" var="escalonServicioSanidadInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

        <td>
          <a href="#" onclick="javascript:cargaAlCentro('escalonServicioSanidad/show/+${escalonServicioSanidadInstance.id}');">
${fieldValue(bean: escalonServicioSanidadInstance, field: "codigoESS")}
          </a>
        </td>
        <td>${fieldValue(bean: escalonServicioSanidadInstance, field: "zonaMilitar")}</td>
        <td>${fieldValue(bean: escalonServicioSanidadInstance, field: "nombreInst")}</td>
        <td>${fieldValue(bean: escalonServicioSanidadInstance, field: "domicilioInst")}</td>
      </tr>
    </g:each>
    </tbody>
  </table>
</div>
<div class="paginateButtons">
  <g:paginate total="${escalonServicioSanidadInstanceTotal}" />
</div>
