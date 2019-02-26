<%--
  Created by IntelliJ IDEA.
  User: Алёна
  Date: 07.01.2019
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<c:if test="${error} == true">--%>
    <%--Wrong login or password--%>
<%--</c:if>--%>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <div class="error">
        Your login attempt was not successful.
        <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.
    </div>
</c:if>
<form:form method="POST" action="/login" modelAttribute="user">
    <div class="row align-items-top">
        <div class="col-md-12 col-sm-12 col-12 mb-2">
            <div class="title">Sign in:</div>
        </div>
        <div class="col-md-4 col-sm-6 col-12">
            <form:input path="login" type="text" placeholder="your login"/>
        </div>
        <div class="col-md-4 col-sm-6 col-12">
            <form:input path="password" type="password" placeholder="your password"/>
        </div>
        <div class="col-md-4 col-sm-6 col-12">
            <input type="submit" class="button" value="send">
        </div>
    </div>
</form:form>
