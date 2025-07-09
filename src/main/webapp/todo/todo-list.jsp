<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<title>User Management Application</title>

<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
</head>

</head>
<body>
 <header>
  <nav class="navbar navbar-expand-md navbar-dark"
   style="background-color: tomato">
   <div>
    <a href="https://github.com/ritikmaheshwari123/" class="navbar-brand"> Todo
     App</a>
   </div>

   <ul class="navbar-nav">
    <li><a href="<%=request.getContextPath()%>/list"
     class="nav-link">Todos</a></li>
   </ul>

   <ul class="navbar-nav navbar-collapse justify-content-end">
    <li><a href="<%=request.getContextPath()%>/logout"
     class="nav-link">Logout</a></li>
   </ul>
  </nav>
 </header>

 <div class="row">
  <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

  <div class="container">
   <h3 class="text-center">List of Todos</h3>
   <hr>
   <div class="container text-left">

    <a href="<%=request.getContextPath()%>/new"
     class="btn btn-success">Add Todo</a>
   </div>
   <br>
   <table class="table table-bordered">
     <thead>
       <tr>
         <th>Title</th>
         <th>Target Date</th>
         <th>Status</th>
         <th>Actions</th>
       </tr>
     </thead>
     <tbody>

       <c:choose>
         <c:when test="${not empty listTodo}">
           <c:forEach var="todo" items="${listTodo}" varStatus="loop">
             <!-- Actual Todo Row -->
             <tr>
               <td>${todo.title}</td>
               <td>${todo.targetDate}</td>
               <td>${todo.status ? 'Complete' : 'In Progress'}</td>
               <td>
                 <a href="edit?id=${todo.id}">Edit</a> &nbsp;
                 <a href="delete?id=${todo.id}">Delete</a>
               </td>
             </tr>
           </c:forEach>
         </c:when>

         <c:otherwise>
           <!-- 🔍 DEBUG: Empty list case -->
           <tr>
             <td colspan="4" class="text-center text-danger">
               No todos found
             </td>
           </tr>
         </c:otherwise>
       </c:choose>

     </tbody>
   </table>
  </div>
 </div>

 <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>