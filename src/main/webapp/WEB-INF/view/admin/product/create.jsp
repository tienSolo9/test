<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Create Product</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />

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
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main class="mb-5">
                            <div class="container-fluid px-4">
                                <h1 class="mt-5">Manage Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">product</li>
                                </ol>
                            </div>
                            <form:form action="/admin/product/create" method="POST" modelAttribute="newProduct"
                                enctype="multipart/form-data">
                                <div class="row mx-auto col-md-6">
                                    <h1><b>Create User</b></h1>
                                    <hr>
                                    <div class="mb-3 col-6">
                                        <label for="nameP" class="form-label">Name</label>
                                        <form:input class="form-control" path="name" />
                                    </div>
                                    <div class="mb-3 col-6">
                                        <label for="" class="form-label">Price</label>
                                        <form:input class="form-control" type="number" path="price" />
                                    </div>
                                    <div class="mb-3 col-12">
                                        <label for="" class="form-label">Detail Description</label>
                                        <textarea class="form-control" rows="3" path="detailDesc" name="detailDesc"
                                            value="${newProduct.detailDesc}"></textarea>
                                    </div>
                                    <div class="mb-3 col-6">
                                        <label for="nameP" class="form-label">Short description</label>
                                        <form:input class="form-control" path="shortDesc" />
                                    </div>
                                    <div class="mb-3 col-6">
                                        <label for="" class="form-label">Quantity</label>
                                        <form:input class="form-control" type="number" path="quantity" />
                                    </div>
                                    <div class="mb-3 col-6">
                                        <label for="" class="form-label">Factory</label>
                                        <form:select class="form-select" path="factory">
                                            <form:option value="1">Apple</form:option>
                                            <form:option value="2">samsung</form:option>
                                        </form:select>
                                    </div>

                                    <div class="mb-3 col-6">
                                        <label for="" class="form-label">Target</label>
                                        <form:select class="form-select" path="factory">
                                            <form:option value="1">Gaming</form:option>
                                            <form:option value="2">Office</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <label for="formFile" class="form-label">Avatar</label>
                                        <input class="form-control" type="file" id="avatarFile" name="productFile"
                                            accept=".png, .jpg, .jpeg" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img id="avatarPreview" style="max-height: 250px;display: none;">
                                    </div>
                                    <div class="">
                                        <button type="submit " class="btn btn-primary col-auto pl-1">Create</button>
                                    </div>
                            </form:form>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>