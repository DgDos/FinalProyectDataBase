<%@page import="model.Servicio"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Eliminar Servicio</title>
        <!--
        Ocean Theme
        http://www.templatemo.com/tm-484-ocean
        -->

        <!-- load stylesheets -->

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400"><!-- Google web font "Open Sans", https://www.google.com/fonts/specimen/Open+Sans -->
        <link rel="stylesheet" href="font-awesome-4.5.0/css/font-awesome.min.css"> <!-- Font Awesome, https://fortawesome.github.io/Font-Awesome/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">                       <!-- Bootstrap style, http://v4-alpha.getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">   
        <link rel="stylesheet" href="css/proyecto.css">      <!-- Templatemo style -->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
    </head>

    <body>

        <div class="row tm-section">

            <section class="tm-section-contact">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">

                    <h2 class="tm-section-title">Eliminar Servicio</h2>
                    <br><br>

                </div>
                <div class="form-group col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 tm-form-group-left">
                    <form align="center" action="ServicioM" method="GET" class="tm-contact-form">                                
                        <label align="center" for="servicio">Escoja el servicio a eliminar</label>
                        <select name="servicio" class="form-control form-control-lg">
                            <%
                                if (request.getAttribute("servicios") != null) {
                                    ArrayList<Servicio> array = (ArrayList<Servicio>) request.getAttribute("servicios");
                                    for (Servicio s : array) {
                            %>
                            <option value="<%=s.getIdServicio()%>"><%=s.getNombreS()%></option>
                            <%      }
                                }
                            %>
                        </select> 
                        <%
                            if (request.getAttribute("respuesta") != null) {%>
                        <h6 class="tm-2-col-text-description">No tiene permisos para eliminar usuarios</h6>
                        <%} else {%>
                        <br>
                        <%}%>
                        <label align="center" for="usuario">Usuario</label>
                        <input type="text" name="usuario" maxlength="30" class="form-control" placeholder="máx. 30"  required/>
                        <br>
                        <label align="center" for="password">Password</label>
                        <input type="password" name="password" maxlength="30" class="form-control" placeholder="máx. 30"  required/>
                        <br>
                        <br>
                        <button type="submit" class="btn tm-bordered-btn pull-xs-center">Eliminar</button>
                        <a class="btn tm-bordered-btn pull-xs-center" href="menu.jsp" role="button">Volver</a>
                    </form>  

                </div>                         


            </section>



        </div>

    </div>

</body>
</html>