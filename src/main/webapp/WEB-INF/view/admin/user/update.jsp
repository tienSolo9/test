<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Management</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link rel="stylesheet" href="/css/styles.css">
                <link rel="stylesheet" href="/css/style.css">
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                        });
                    });
                </script>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <form:form class="container mt-5 mb-5" action="/admin/user/update" method="POST"
                                    modelAttribute="user" enctype="multipart/form-data">
                                    <div class="row col-md-6 col-12 mx-auto">
                                        <h1><b>Update User</b></h1>

                                        <div class="mb-3" style="display: none;">
                                            <label for="id" class="form-label">Id</label>
                                            <form:input type="text" class="form-control" id="id" path="id" />
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <label for="email" class="form-label">Email</label>
                                            <form:input type="email" class="form-control" id="email" path="email"
                                                disabled="true" />
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
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
                                        <div class="mb-3">
                                            <label for="formFile" class="form-label">Avatar</label>
                                            <input class="form-control" type="file" id="avatarFile" name="avatarFile"
                                                value="" accept=".png, .jpg, .jpeg" />
                                            <img src="/images/avatar/${user.avatar}" class="avatarConfig"
                                                id="avatarPreview">
                                        </div>
                                        <div>
                                            <button type="submit" class="btn btn-primary col-auto pl-1">Update</button>
                                        </div>

                                    </div>
                                </form:form>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
            </body>

            </html>

            <style>
                .avatarConfig {
                    width: 100px;
                    height: 100px;
                    object-fit: cover;
                    margin-top: 30px;
                }
            </style>