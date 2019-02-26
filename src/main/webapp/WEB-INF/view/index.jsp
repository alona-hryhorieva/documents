<%-- Created by IntelliJ IDEA. --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../templates/header.jsp" >
  <jsp:param name="title" value="Main page" />
</jsp:include>
<%--<jsp:include page="templates/registration.jsp" ></jsp:include>--%>
<sec:authorize access="isAuthenticated()">
  <div class="greeting_block pt-5">
    <div class="container">
      <div class="text-center greeting">
        Hello, <span><sec:authentication property="principal.username" /></span>
      </div>
    </div>
  </div>
</sec:authorize>

<div class="buttons py-5">
  <div class="container text-center">
    <sec:authorize access="hasRole('ADMIN')">
        <a href="/admin/add" class="button mx-3"><i class="fas fa-plus"></i>add document</a>
        <a href="/documents" class="button mx-3"><i class="fas fa-pencil-alt"></i>edit document</a>
    </sec:authorize>
    <sec:authorize access="hasRole('USER')">
        <a href="/documents" class="button mx-3"><i class="fas fa-eye"></i>watch document</a>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
      <a href="/registration" class="button mx-3"><i class="fas fa-user-alt"></i>authentication</a>
    </sec:authorize>
  </div>
</div>
<jsp:include page="../templates/footer.jsp" ></jsp:include>