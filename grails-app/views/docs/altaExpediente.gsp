<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>



<div class="nav">
  <span class="menuButton">
    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
</div>

<h1>Alta de expediente de paciente</h1>
<br/>

<fileuploader:form 	upload="docs" 
                    successAction="altaExpediente"
                    successController="docs"
                    errorAction="altaExpediente"
                    errorController="docs"
                    />
<%  System.out.println("Params-gsp: "+params) %>
<form method="post" enctype="multipart/form-data" id="formenviarexpediente">
  <input type="hidden" name="upload" value="docs">
  <input type="hidden" name="errorAction" value="altaExpediente">
  <input type="hidden" name="errorController" value="docs">
  <input type="hidden" name="successAction" value="altaExpediente">
  <input type="hidden" name="seccessController" value="docs">
  <input type="file" name="file" >
  
    <a href="#" class="save" onclick="javascript:enviarArchivo();">
      Enviar
    </a>
</div>


</form>
  
       



<br/>
<h2>Expediente</h2>
<g:each var="f" in="${files}">
  <table border="1">
    <tr>
      <td class="etiqueta">Nombre</td>
      <td>${f.name}</td>
    </tr>
    <!--<tr>
      <td><b>Path</b></td>
      <td>${f.path}</td>
    </tr>-->
    <tr>
      <td class="etiqueta">Tamaño</td>
      <% 
        def size = f.size 
        size = size/(1024*1024)
        DecimalFormat df1 = new DecimalFormat("##.00");
        def sizestr = df1.format(size);  
     
      %>
      <!--<td><fileuploader:prettysize size="${f.size}" /> (${f.size})</td>-->
      <td>${sizestr} Mb</td>
    </tr>
    <tr>
      <td class="etiqueta">Fecha de registro</td>
      <td><g:formatDate format="MM/dd/yyyy HH:mm" date="${f.dateUploaded}" /></td>
    </tr>
    
    <tr>
      <td></td>
      
      <td>
    <fileuploader:download 	id="${f.id}"
                            errorAction="altaExpediente"
                            errorController="docs">Bajar archivo</fileuploader:download></td>
    </tr>
    <tr>
      <td></td>
      <td>
    <!--<g:link controller="docs" action="delete" id="${f.id}">Eliminar archivo</g:link></td>-->
    
        <a href="javascript:cargaAlCentro('docs/delete?'+'id='+${f.id});">
          Eliminar
        </a>
      
    
      </td>
    </tr>					
  </table>
</g:each>



