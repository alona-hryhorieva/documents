<%--
  Created by IntelliJ IDEA.
  User: Алёна
  Date: 18.11.2018
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../templates/header.jsp" >
    <jsp:param name="title" value="Documents (watch, edit, delete)" />
</jsp:include>
<% Integer i = 1; %>
<div class="documents_block py-5">
    <div class="container">
        <h1>Documents</h1>
        <div class="table_wrapper">
            <table class="documents">
                <thead>
                    <tr>
                        <td>№</td>
                        <td>Title</td>
                        <td>Publish date</td>
                        <td>User Login</td>
                        <td>Options</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items='${documents}' var="doc">
                        <tr class="doc" data-id="${doc.getId()}">
                            <td><%= i++ %></td>
                            <td class="name"><span>${doc.getName()}</span></td>
                            <td><span>${doc.getDate()}</span></td>
                            <td><span>${doc.getUser().getLogin()}</span></td>
                            <td>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <button class="button edit"><i class="fas fa-pencil-alt"></i>edit</button>
                                    <button class="button delete"><i class="fas fa-trash-alt"></i>delete</button>
                                </sec:authorize>
                                <sec:authorize access="hasAnyRole('USER','ADMIN')">
                                    <button class="button download">
                                        <a href="/documents/download?id=${doc.getId()}" target="_blank">
                                            <i class="fas fa-download"></i>download
                                        </a>
                                    </button>
                                </sec:authorize>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    <sec:authorize access="hasRole('ADMIN')">
        <a href="/admin/add" class="add mt-3">add new document</a>
    </sec:authorize>
    </div>
</div>

<jsp:include page="../templates/footer.jsp" ></jsp:include>