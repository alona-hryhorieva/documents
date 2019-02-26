<%--
  Created by IntelliJ IDEA.
  User: Алёна
  Date: 25.11.2018
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../templates/header.jsp" >
    <jsp:param name="title" value="Main page" />
</jsp:include>
<div class="registration form_block py-5">
    <div class="container">
        <div class="tabs_block">
            <div class="tabs_titles">
                <div class="tab_name active">registration</div>
                <div class="tab_name">sign in</div>
            </div>
            <div class="tabs_content">
                <div class="tab_text p-4">
                    <jsp:include page="forms/registrationForm.jsp" ></jsp:include>
                </div>
                <div class="tab_text p-4">
                    <jsp:include page="forms/authorizationForm.jsp" ></jsp:include>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../templates/footer.jsp" ></jsp:include>
