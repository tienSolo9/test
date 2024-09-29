<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Management</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <link rel="stylesheet" href="/css/style.css">
        </head>

        <body>
            <div class="container">
                <div class="row col-12 mt-5">
                    <div class="head d-flex justify-content-between p-0">
                        <h2 class="">Table Users</h2>
                        <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                    </div>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>Full Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <th>${user.id}</th>
                                    <th>${user.email}</th>
                                    <th>${user.fullName}</th>
                                    <th>
                                        <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                                        <a href="/admin/user/update/${user.id}" class="btn btn-warning">Update</a>
                                        <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                                    </th>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>

            </div>

        </body>

        </html>