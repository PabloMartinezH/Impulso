
<%@ page import="impulso.GrupoMenu" %>
<%@ page import="impulso.ItemGrupoMenu" %>

<html>
  <head>
    <!-- <meta name="layout" content="main" />  -->
    <script type="text/javascript">
  $(document).ready(function () {
    $("div#accordion" ).accordion({autoHeight: false,navigation: false, collapsible: true});
      $('body').layout({ applyDefaultStyles: true });
      //$("div#contenidoMenu").load("menuFusion/generarMenu");
  });  
  </script>
  <export:resource />  
    
  </head>
  <body>
    
    <sec:ifNotLoggedIn>
    <g:include controller="login" action="auth"/>
  </sec:ifNotLoggedIn>

  <sec:ifAnyGranted roles="ROLE_ADMIN_IM,ROLE_OPERA_P,ROLE_SUPER_P,ROLE_OPERA_IM,ROLE_CONSUL_IM,ROLE_CONSUL_S">
    
    
    
      <!-- DIV ==== CENTRO ==== -->
      <div class="ui-layout-center" id="contenidoCentro">
        <p align="center">
          <img width="300" height="100" src="${resource(dir:'images',file:'Impulso_logo.jpg')}" align="center"/>
        </p>
        
  </div>
  
  <!-- DIV ==== NORTE ==== -->
  <div class="ui-layout-north" >
    <table witdth="100%">
      <tr >
        <td witdth="100%">
          <p align="center">
        <img width="200" src="${resource(dir:'images',file:'Impulso_logo.jpg')}" align="center"/>
          </p>
        </td>
      </tr>
    </table>
  </div>
  
    <!-- DIV ==== OESTE ==== -->
  <div class="ui-layout-west"> 
   
    <!-- <div id="contenidoMenu"></div> -->
    <g:include controller="menuImpulso/generarMenu"/>
    <br></br>
     <p class="etiqueta" align="center">Usuario</p>
     <h3  align="center"><sec:username/></h3>
     <p align="center"><g:link controller="logout">Salir</g:link></p>
  </div>
  
  
  <!-- DIV ==== SUR ==== -->
  <!-- <div class="ui-layout-south">South</div> -->
  
  
  <!-- DIV ==== ESTE ==== -->
<!--
  <div class="ui-layout-east">
   <div id="pageBody">
      <h2>Available Controllers:</h2>
      <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
          <li class="controller">
          <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
          </li>
        </g:each>
      </ul>
    </div>
  </div>
  -->
</sec:ifAnyGranted>
  
  </body>
</html>
