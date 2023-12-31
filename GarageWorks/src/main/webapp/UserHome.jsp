<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%
HashMap userDetails=(HashMap)session.getAttribute("userDetails");
if(userDetails==null){
	session.setAttribute("msg", "sessionError");
	response.sendRedirect("User.jsp");
}else{
%>
<!DOCTYPE html>
<html>

<head>
    <title>GarageWorks</title>
    <link rel="icon" href="resource/autoworks-logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

    <!-- fontawesome -->
    <link rel="stylesheet" href="resource/fontawesome/fontawesome.min.css">
    <script src="resource/fontawesome/fontawesome.min.js"></script>
    <!-- fontawesome END -->

    <!-- Lightbox CSS & Script -->
    <script src="resource/lightbox/ekko-lightbox.js"></script>
    <link rel="stylesheet" href="resource/lightbox/ekko-lightbox.css" />

    <!-- AOS CSS & Script -->
    <script src="resource/aos/aos.js"></script>
    <link rel="stylesheet" href="resource/aos/aos.css"/>

    <!-- custom css-->
    <link rel="stylesheet" href="resource/custom.css" />
    <!-- custom css END-->

    <meta name="author" content="Rahul Chauhan" />
    <meta name="description" content="This is a Auto Service website" />
    <meta name="keywords" content="best Auto Service comapny in noida" />
</head>

<body>
	
    <nav class="navbar navbar-expand-sm bg-light sticky-top px-4">
        <a class="navbar-brand" href="UserHome.jsp">
            Garage<strong class="c-logo">Works</strong>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <i class="fas fa-bars"></i> Menu
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">
                <!-- <ul class="navbar-nav mr-auto"> -->
                <!-- <ul class="navbar-nav mx-auto"> -->
                <li class="nav-item">
                    <a class="nav-link" href="UserHome.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserProfile.jsp">Profile</a>
                </li>
            </ul>
            <div>
                Welcome: <b> <%= userDetails.get("name")%> </b>
                <img src="GetUserPhoto?email=<%= userDetails.get("email")%>" height="30px"/>
                <a href="Logout">Logout</a>
            </div>
        </div>
    </nav>
    
    <section class="container py-4">
    	<h3>Search Garage</h3>
    	<form action="SearchGarage" method="post" >
            <div class="py-2">
                <input name="state" class="form-control" type="text" placeholder="Enter state" required />
            </div>
            <div class="py-2">
                <input name="city" class="form-control" type="text" placeholder="Enter city" required />
            </div>
            <div class="py-2">
                <button class="btn btn-primary">Search</button>
            </div>
        </form>
        <hr/>
        <%
   		ArrayList<HashMap> allGarageDetails=(ArrayList<HashMap>)session.getAttribute("allGarageDetails");
   		if(allGarageDetails!=null){
	        for(HashMap garageDetails:allGarageDetails){
	   			%>
	   			<div class="bg-light p-2 m-2">
	   				<h3>Garage Name: <%= garageDetails.get("gname")%> </h3>
	   				<p>
	   				Name: <b><%= garageDetails.get("name")%> </b> 
	   				Phone: <b><%= garageDetails.get("phone")%> </b> 
	   				Email: <b><%= garageDetails.get("email")%> </b> 
	   				</p>
	   				<p>
	   				State: <b><%= garageDetails.get("state")%> </b> 
	   				City: <b><%= garageDetails.get("city")%> </b> 
	   				Sector/Village: <b><%= garageDetails.get("sec_vill")%> </b> 
	   				Shop No.: <b><%= garageDetails.get("shop_no")%> </b> 
	   				</p>
	   				<a class="btn btn-dark btn-sm" href="GarageDetails.jsp?email=<%= garageDetails.get("email")%>">More Details</a>
	   			</div>
	   			<%
	   		}
   		}
   		%>
    </section>
    
    <footer>
            Design & Develop by Dayanand and Manoj &copy; Reights reserved &nbsp;&nbsp;&nbsp; 
            Social Media:
            <a href="https://www.facebook.com/GalgotiasUniversity/" target="_blank" ><i class="fab fa-facebook"></i></a>
            <a href="https://www.instagram.com/galgotias_university/?hl=en" target="_blank" ><i class="fab fa-instagram"></i></a>
            <a href="https://www.youtube.com/watch?v=jn2nT-VI2Dk" target="_blank" ><i class="fab fa-youtube"></i></a>
    </footer>

    <a id="myTopBtn"><i class="fas fa-arrow-circle-up"></i></a>
</body>
<script>
    AOS.init();
</script>

<script>
    //script for light box
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
          event.preventDefault();
          $(this).ekkoLightbox();
      });
  </script>

<script>
    //script for scroll to top
    $("#myTopBtn").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
      });
  </script>


</html>
<%} %>

