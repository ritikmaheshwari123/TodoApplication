<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
</head>
<body>
 <header>
  <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
   <div>
    <a href="https://github.com/ritikmaheshwari123/" class="navbar-brand">Todo App</a>
   </div>

   <ul class="navbar-nav">
    <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Todos</a></li>
   </ul>

   <ul class="navbar-nav navbar-collapse justify-content-end">
    <li><a href="<%=request.getContextPath()%>/logout" class="nav-link">Logout</a></li>
   </ul>
  </nav>
 </header>

 <div class="container col-md-5">
  <div class="card">
   <div class="card-body">
    <form action="${todo != null ? 'update' : 'insert'}" method="post">
     <h2>
      <c:choose>
       <c:when test="${todo != null}">Edit Todo</c:when>
       <c:otherwise>Add New Todo</c:otherwise>
      </c:choose>
     </h2>

     <c:if test="${todo != null}">
      <input type="hidden" name="id" value="${todo.id}" />
     </c:if>

     <!-- Todo Title -->
     <fieldset class="form-group">
      <label>Todo Title</label>
      <input type="text"
       value="<c:out value='${todo.title}' default=''/>"
       class="form-control"
       name="title" required="required" minlength="5">
     </fieldset>

     <!-- Todo Description -->
     <fieldset class="form-group">
      <label>Todo Description</label>
      <input type="text"
       value="<c:out value='${todo.description}' default=''/>"
       class="form-control"
       name="description" minlength="5">
     </fieldset>

     <fieldset class="form-group">
      <label>Todo Status</label>
      <select class="form-control" name="isDone">
       <option value="false"
        <c:if test="${todo != null && !todo.status}">selected</c:if>>In Progress</option>
       <option value="true"
        <c:if test="${todo != null && todo.status}">selected</c:if>>Complete</option>
      </select>
     </fieldset>

     <!-- Todo Target Date -->
     <fieldset class="form-group">
      <label>Todo Target Date</label>
      <c:choose>
        <c:when test="${not empty todo}">
          <input type="date"
              value="${todo.targetDate}"
              class="form-control"
              name="targetDate" required="required">
        </c:when>
        <c:otherwise>
          <input type="date"
           class="form-control"
           name="targetDate" required="required">
        </c:otherwise>
      </c:choose>
     </fieldset>
     <input type="hidden" name="username" value="${sessionScope.username}" />
     <button type="submit" class="btn btn-success">Save</button>
    </form>
   </div>
  </div>
 </div>

 <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
