<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!-- Latest compiled and minified CSS -->


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Create User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link rel="stylesheet" href="/css/style.css">
            </head>

            <body>

                <form:form class="container mt-5" action="/admin/user/create" method="POST" modelAttribute="newUser">
                    <div class="row col-md-6 col-12 mx-auto">
                        <h1><b>Create User</b></h1>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <form:input type="email" class="form-control" id="email" value="${newUser.email}"
                                path="email" />
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <form:input type="password" class="form-control" id="password" value="${newUser.email}"
                                path="password" />
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <form:input type="text" class="form-control" id="phone" path="phone" />
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Fullname</label>
                            <form:input type="text" class="form-control" id="name" path="fullName" />
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <form:input type="text" class="form-control" id="address" path="address" />
                        </div>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </form:form>
            </body>

            </html>