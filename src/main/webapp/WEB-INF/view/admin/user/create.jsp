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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <link rel="stylesheet" href="/css/styles.css">
                <link rel="stylesheet" href="/css/style.css">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <form:form class="container mt-5 mb-5" action="/admin/user/create" method="POST"
                                    modelAttribute="newUser" enctype="multipart/form-data">
                                    <div class="row col-md-6 col-12 mx-auto">

                                        <h1><b>Create User</b></h1>
                                        <hr>
                                        <div class="mb-3 col-6">
                                            <c:set var="emailError">
                                                <form:errors path="email" />
                                            </c:set>

                                            <label for="email" class="form-label">Email</label>
                                            <form:input type="email"
                                                class="form-control ${not empty emailError?'is-invalid':''}" id="email"
                                                path="email" />
                                            <form:errors path="email" cssClass="invalid-feedback" />

                                        </div>

                                        <div class="mb-3 col-6">
                                            <c:set var="errorPassword">
                                                <form:errors path="password" />
                                            </c:set>
                                            <label for="password" class="form-label">Password</label>
                                            <form:input type="password"
                                                class="form-control ${not empty errorPassword?'is-invalid':'is-valid'}"
                                                id="password" path="password" />
                                            <form:errors path="password" cssClass="invalid-feedback" />
                                        </div>
                                        <div class="mb-3 col-6">
                                            <label for="phone" class="form-label">Phone</label>
                                            <form:input type="text" class="form-control" id="phone" path="phone" />
                                        </div>
                                        <div class="mb-3 col-6">
                                            <c:set var="errorFullName">
                                                <form:errors path="fullName" />
                                            </c:set>
                                            <label for="name" class="form-label">Full name</label>
                                            <form:input type="text"
                                                class="form-control ${not empty errorFullName?'is-invalid':''}"
                                                id="name" path="fullName" />
                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="address" class="form-label">Address</label>
                                            <form:input type="text" class="form-control" id="address" path="address" />
                                        </div>
                                        <div class="col-6 mb-3">
                                            <div class="form-label">Role</div>
                                            <form:select class="form-select" path="role.name">
                                                <form:option value="admin">Admin</form:option>
                                                <form:option value="user">user</form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <label for="formFile" class="form-label">Avatar</label>
                                            <input class="form-control" type="file" id="avatarFile" name="hoidanitFile"
                                                accept=".png, .jpg, .jpeg" />

                                        </div>
                                        <div class="col-12 mb-3">
                                            <img id="avatarPreview" style="max-height: 250px;display: none;">
                                        </div>
                                        <div>
                                            <button type="submit " class="btn btn-primary col-auto pl-1">Create</button>
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