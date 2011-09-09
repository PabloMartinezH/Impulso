
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
  <!--<div class="ui-layout-north" ></div>-->

  <!-- DIV ==== OESTE ==== -->
  <div class="ui-layout-west"> 
    <br/>
    <img width="150" src="${resource(dir:'images',file:'Impulso_logo.jpg')}" align="center"/>
    <!-- <div id="contenidoMenu"></div> -->
    <br/>
    <g:include controller="menuImpulso/generarMenu"/>
    <br/>
    <p class="etiqueta" align="center">Usuario</p>
    <h3  align="center"><sec:username/></h3>
    <p align="center"><g:link controller="logout">Salir</g:link></p>
  </div>


  <!-- DIV ==== SUR ==== -->
  <!-- <div class="ui-layout-south">South</div> -->


  <!-- DIV ==== ESTE ==== -->
  <!-- <div class="ui-layout-east"></div> -->
</sec:ifAnyGranted>

</body>
</html>
