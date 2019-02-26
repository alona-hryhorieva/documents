<%--
  Created by IntelliJ IDEA.
  User: Алёна
  Date: 25.11.2018
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../templates/header.jsp" >
    <jsp:param name="title" value="Main page" />
</jsp:include>
<div class="registration form_block py-5">
    <div class="container">
        <div class="registration_result">
            <%= request.getAttribute("result_message")%>
            <%= session.getAttribute("user")%>
        </div>
    </div>
</div>
<jsp:include page="../templates/footer.jsp" ></jsp:include>
