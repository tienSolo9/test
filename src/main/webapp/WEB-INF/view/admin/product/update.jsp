<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

                        const orgImg = "${productDetail.image}";
                        if (orgImg) {
                            urlImg = "/images/laptop/" + orgImg;
                            $("#avatarPreview").attr("src", urlImg);
                            $("#avatarPreview").css({ "display": "block" });
                        }

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

                            <form:form action="/admin/product/update" method="POST" modelAttribute="productDetail"
                                enctype="multipart/form-data">
                                <c:set var="eName">
                                    <form:errors path="name" />
                                </c:set>
                                <c:set var="pName">
                                    <form:errors path="price" />
                                </c:set>
                                <c:set var="dName">
                                    <form:errors path="detailDesc" />
                                </c:set>
                                <c:set var="sName">
                                    <form:errors path="shortDesc" />
                                </c:set>
                                <div class="row mx-auto col-md-6">
                                    <h1><b>Update product</b></h1>
                                    <hr>
                                    <div class="idProduct" style="display: none;">
                                        <form:input path="id" />
                                    </div>
                                    <div class="mb-3 col-6">
                                        <label for="nameP" class="form-label">Name</label>
                                        <form:input class="form-control ${not empty eName?'is-invalid':''}"
                                            path="name" />
                                        <form:errors path="name" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3 col-6">

                                        <label for="" class="form-label">Price</label>
                                        <form:input class="form-control ${not empty pName?'is-invalid':''}"
                                            type="number" step="any" path="price" />
                                        <form:errors path="price" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3 col-12">

                                        <label for="" class="form-label">Detail Description</label>
                                        <form:textarea class="form-control ${not empty dName?'is-invalid':''}" rows="3"
                                            path="detailDesc" />

                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3 col-6">

                                        <label for="nameP" class="form-label">Short description</label>
                                        <form:input class="form-control ${not empty sName?'is-invalid':''}"
                                            path="shortDesc" />
                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3 col-6">
                                        <c:set var="qName">
                                            <form:errors path="quantity" />
                                        </c:set>
                                        <label for="" class="form-label">Quantity</label>
                                        <form:input class="form-control ${not empty qName?'is-invalid':''}"
                                            type="number" path="quantity" />
                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                    </div>
                                    <div class="mb-3 col-6">
                                        <label for="" class="form-label">Factory</label>
                                        <form:select class="form-select" path="factory">
                                            <form:option value="apple">Apple</form:option>
                                            <form:option value="samsung">samsung</form:option>
                                        </form:select>
                                    </div>

                                    <div class="mb-3 col-6">
                                        <label for="" class="form-label">Target</label>
                                        <form:select class="form-select" path="target">
                                            <form:option value="gaming">Gaming</form:option>
                                            <form:option value="office">Office</form:option>
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
                                        <button type="submit" class="btn btn-primary col-auto pl-1">Update</button>
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