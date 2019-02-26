<%--
  Created by IntelliJ IDEA.
  User: Алёна
  Date: 18.11.2018
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>${param.title}</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin=“anonymous">
    <link href="/css/custom.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <header class="header py-4">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-sm-4 col-12">
                            <div class="logo">
                                <a href="/"><i class="fas fa-cat"></i></a>
                            </div>
                        </div>
                        <div class="col-sm-8 col-12">
                            <menu class="main_menu text-md-right text-center p-0 m-0">
                                <li><a href="/documents">documents</a></li>
                                <sec:authorize access="isAnonymous()">
                                    <li><a href="<c:url value="/registration" />" class="button sign_in">sign in</a></li>
                                </sec:authorize>
                                <sec:authorize access="isAuthenticated()">
                                    <li><a href="<c:url value="/logout" />" class="button sign_out">sign out</a></li>
                                </sec:authorize>

                            </menu>
                        </div>
                    </div>
                </div>
            </header>
