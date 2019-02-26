<%--
  Created by IntelliJ IDEA.
  User: Алёна
  Date: 18.11.2018
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../templates/header.jsp" >
    <jsp:param name="title" value="Add form" />
</jsp:include>

<div class="form_block py-5">
<div class="container">
    <form:form method="POST" action="/admin/add" modelAttribute="document" enctype="multipart/form-data">
        <div class="row align-items-center">
            <div class="col-md-12 col-sm-12 col-12 mb-2">
                <div class="title">Add new document:</div>
            </div>
            <div class="col-md-4 col-sm-6 col-12">
                <input type="file" name="file" size="50" />
            </div>
            <div class="col-md-4 col-sm-6 col-12">
                <input type="submit" class="button" value="send">
            </div>
        </div>
    </form:form>
</div>
</div>
<jsp:include page="../templates/footer.jsp" ></jsp:include>
