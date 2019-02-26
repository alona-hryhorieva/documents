<%--
  Created by IntelliJ IDEA.
  User: Алёна
  Date: 07.01.2019
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form method="POST" action="/registration" modelAttribute="newUser">
    <div class="row align-items-top">
        <div class="col-md-12 col-sm-12 col-12 mb-2">
            <div class="title">Registration:</div>
        </div>
        <div class="col-md-4 col-sm-6 col-12">
            <form:input path="login" type="text" placeholder="your login" cssErrorClass="field-error"/>
            <form:errors path="login" cssClass="error"/>
        </div>
        <div class="col-md-4 col-sm-6 col-12">
            <form:input path="password" type="password" placeholder="your password" cssErrorClass="field-error"/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <div class="col-md-4 col-sm-6 col-12">
            <input type="submit" class="button" value="send">
        </div>
    </div>
</form:form>
