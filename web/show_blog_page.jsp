
    
 <%@page import="store.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="store.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="store.entities.Category"%>
<%@page import="store.entities.User"%>
<%@page import="store.entities.Post"%>
<%@page import="store.dao.PostDao"%>
<%@page import="store.helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp" %>
    <%
        User user = (User)session.getAttribute("currentUser");
        if(user==null){
        response.sendRedirect("login.jsp");
        }

    %>
<% 
       int postId= Integer.parseInt(request.getParameter("post_id"));
        PostDao pd1= new PostDao(ConnectionProvider.getConnection());
       
       Post p= pd1.getPostByPostId(postId);
    %>   

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%></title>
        <!--CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <style>
                .banner-background{
                   clip-path: polygon(0 0, 100% 0, 100% 94%, 61% 82%, 24% 91%, 0 86%);
                }
                .post-title{
                    font-weight: 100;
                    font-size: 30px;
                }
                .post-content{
                    font-weight: 100;
                    font-size: 25px;
                }
                .post-user-info{
                    font-size: 15px;
                }
                .post-date{
                    font-style: italic;
                    font-weight: bold;
                    font-size: 15px;
                }
                .row-user{
                    border: 1px solid #e2e2e2;
                    padding-top: 15px;
                }
                body{
                    background: url(img/bg.jpeg);
                    background-attachment: fixed;
                    background-size: cover;
                }
            </style>
    </head>
    <body>
           <!--Start of nav bar-->

            <nav class="navbar navbar-expand-lg navbar-dark primary-background">
      <a class="navbar-brand" href="index.jsp"><span class="fa fa-briefcase"></span>TechBlog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
              <a class="nav-link" href="profile_page.jsp"><span class="fa fa-archive"></span>Luv2Code <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"><span class="fa fa-phone "></span>Contact</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk "></span>Do Post</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Categories
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">C++</a>
              <a class="dropdown-item" href="#">Java</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Data Structures</a>
            </div>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="#"><span class="fa fa-blind"></span>More..</a>
          </li>

        </ul>
          <ul class="navbar-nav mr-right">
              <li class="nav-item">
            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-plus"></span> <%=user.getName()%></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LogoutServlet"><span class="fa fa-user"></span>Logout</a>
          </li>
          </ul>
      </div>
    </nav>

       <!--End of nav bar-->
       
    <div class="container">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center">
                    <h4 class="post-title"><%= p.getpTitle()%></h4>
                </div>
                
                <div class="card-body">
                    <img class="card-img-top my-2" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
                    
                   <div class="row my-3 row-user">
                       <div class="col-md-8">
                           <% UserDao d= new UserDao(ConnectionProvider.getConnection()); %>
                           <p class="post-user-info"> <a href="#!"><%=d.getUserByUserId(p.getUserId()).getName() %></a> has posted </p>
                       </div>
                       <div class="col-md-4">
                           <p class="post-date"> <%= DateFormat.getDateInstance().format(p.getpDate())%>
                       </div>
                   </div>
                    <p class="post-content"><%= p.getpContent() %></p>
                    <br>
                    <br>
                    <div class="post-code">
                    <pre><%=p.getpCode()%></pre>
                    </div>
                </div>
                <%    
                     LikeDao ld= new LikeDao(ConnectionProvider.getConnection());
                    %>
    
                    <div class="card-footer primary-background">
                        <a href="#!" class="btn btn-outline-light btn-sm" onClick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                </div> 
                
                
            </div>
        </div>       
    </div>
        
             <!--Start of modal -->
    <!-- Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header primary-background text-white">
            <h5 class="modal-title" id="exampleModalLabel">TechSoft</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="container text-center">
                  <img src="pics/<%=user.getProfile() %>" class= "img-fluid" style="border-radius:50%;width:50px;"> 
                  <br>

              <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
              </div>

            <!--Details -->
      <div id="profile-details">
        <table class="table">
            <tbody>
        <tr>
          <th scope="row">ID:</th>
          <td><%= user.getId()%></td>

        </tr>
        <tr>
          <th scope="row">Email:</th>
          <td><%= user.getEmail()%></td>

        </tr>
        <tr>
          <th scope="row">Gender:</th>
          <td><%=user.getGender()%></td>
        </tr>

        <tr>
          <th scope="row">Status:</th>
          <td><%=user.getAbout()%></td>
        </tr>

        <tr>
          <th scope="row">Registered on:</th>
          <td><%=user.getDateTime().toString()%></td>
        </tr>
      </tbody>
    </table>
         </div>
                    <!--Details end -->


        <div id="profile-edit" style="display:none">
            <h3 class="mt-2"> Please enter carefully </h3>
            <form action="EditServlet" method="Post" enctype="multipart/form-data">
                <table class="table">
                    <tr>
                        <td>ID </td>
                        <td><%= user.getId() %> </td>
                    </tr> 

                    <tr>
                        <td>Name</td>
                        <td><input type="name" class="form-control" name="user_name" value="<%= user.getName()%>"</td>
                    </tr>

                    <tr>
                        <td>Email</td>
                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"</td>
                    </tr>

                    <tr>
                        <td>Password</td>
                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"</td>
                    </tr>

                    <tr>
                        <td>Gender </td>
                        <td><%= user.getGender().toUpperCase()%> </td>
                    </tr> 

                    <tr>
                        <td>About</td>
                        <td>
                            <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout() %>
                              </textarea>
                        </td>
                    </tr>

                    <tr>
                        <td>New Profile Pic</td>
                        <td>
                            <input type="file" name="image" class="form-control">
                        </td>
                    </tr>
                </table>
                  <div class="container text-center">
                      <button  type="submit" class="btn btn-outline-primary ">Save</button>
                  </div>
            </form>
        </div>





          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
          </div>
        </div>
      </div>
    </div>
    </div>

       <!-- End of modal -->
       
       <!-- ADD POST MODAL -->

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>--Select your category--</option>
                      
                      <% 
                          PostDao pd= new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list= pd.getAllCategory();
                           for(Category c: list){
                       %>
                       <option value="<%= c.getcId()%>"><%= c.getName() %></option>
                       <%
                           }
                        %>
                  </select>
              </div>
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter post title" class="form-control">
              </div>
              
              <div class="form-group">
                  <textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter your content"></textarea>
              </div>
              <div class="form-group">
                  <textarea name="pCode" class="form-control" style="height:200px;" placeholder="Enter your code(if any)"></textarea>
              </div>
              <div class="form-group">
                  <label>Select your pic </label><br>
                  <input type="file" name="pic"\>
              </div>
                  <div class="container text-center">
                      <button type="submit" class="btn btn-outline-primary">Post</button>
                  </div>
                  
          </form>
      </div>
         
                  
    </div>
  </div>
</div>
       
       <!-- END POST MODAL -->
       <script src="js/myjs.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
       $(document).ready(function(){
           let editStatus= false;

           $('#edit-profile-button').click(function(){

               if(editStatus===false){

                $("#profile-details").hide();
                $("#profile-edit").show();
                editStatus= true;
                $(this).text("Back");
               }

               else{
                   $("#profile-details").show();
                $("#profile-edit").hide();
                editStatus= false;
                $(this).text("Edit");
               }


           });

       }) ;

     </script>
     
     <script>
         $(document).ready(function(e){
           $("#add-post-form").on("submit",function(event){
               event.preventDefault();
               console.log("You have clicked");
              
               let form = new FormData(this);
               
               $.ajax({
                   url: "AddPostServlet",
                   type: 'POST',
                   data: form,
                   success: function(data,textStatus,jqXHR){
                       console.log(data);
                       if(data.trim() === 'done')
                       {
                           swal("Good job!,","saved successfully","success");
                       }else
                       {
                           swal("Error!,","something went wrong try again..","error");
                       }
                   },
                   error: function(jqXHR,textStatus,errorThrown){
                       swal("Error!,","something went wrong try again..","error");
                   },
                   processData: false,
                   contentType: false
               });
           });
           
         });
         
        </script>
        
    </body>
</html>