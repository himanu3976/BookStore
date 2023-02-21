<%@page import="store.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index Page</title>
        <!--CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
               clip-path: polygon(0 0, 100% 0, 100% 94%, 61% 82%, 24% 91%, 0 86%);
            }
        </style>
    </head>
    <body> 
        <%@include file="normal_navbar.jsp" %>
        
        <!--Banner-->
        <div class="container-fluid p-0 m-0"  >
            
            <div class="jumbotron primary-background text-white banner-background" >
                <div class="container">
                <h3 class="display-3">Welcome to TechBlog</h3>                             
                  <p>A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</p>
                  <p>The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language. Some languages are defined by a specification document (for example, the C programming language is specified by an ISO Standard) while other languages</p>
                </div>
                
                <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span>Its free</button>
                <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user fa-spin"></span>Login</a>
            </div>
            
         </div>
        
        
        
        <!--cards-->
        
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                   <div class="card">
                    
                     <div class="card-body">
                     <h5 class="card-title">Java</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary primary-background color-white">Read More</a>
                     </div>
                  </div>
                </div> 
                
                <div class="col-md-4">
                   <div class="card">
                    
                     <div class="card-body">
                     <h5 class="card-title">Java</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary primary-background color-white">Read More</a>
                     </div>
                  </div>
                </div>
                
                <div class="col-md-4">
                   <div class="card">
                    
                     <div class="card-body">
                     <h5 class="card-title">Java</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary primary-background color-white">Read More</a>
                     </div>
                  </div>
                </div>
                
            </div>    
                
            <div class="row">
                <div class="col-md-4">
                   <div class="card">
                    
                     <div class="card-body">
                     <h5 class="card-title">Java</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary primary-background color-white">Read More</a>
                     </div>
                  </div>
                </div> 
                
                <div class="col-md-4">
                   <div class="card">
                    
                     <div class="card-body">
                     <h5 class="card-title">Java</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary primary-background color-white">Read More</a>
                     </div>
                  </div>
                </div>
                
                <div class="col-md-4">
                   <div class="card">
                    
                     <div class="card-body">
                     <h5 class="card-title">Java</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary primary-background color-white">Read More</a>
                     </div>
                  </div>
                </div>
               
           </div>
        
        </div>
        
        
        
        
        
        
        
        
        

        
                
        
        
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>    
</html>