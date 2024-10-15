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
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <h2>Product detail</h2>
                                <div class="card mb-3 mt-5 mx-auto" style="width:80%;">
                                    <div class="row g-0">
                                        <div class="col-md-4 avatar">
                                            <img src="/images/laptop/${productDetail.image}" alt=""
                                                class="img-fluid rounded-start">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body info">
                                                <h5 class="card-title">Id: ${productDetail.id}</h5>
                                                <p class="card-text">Full name: ${productDetail.name}</p>
                                                <p class="card-text">Email: ${productDetail.price}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
            </body>

            </html>

            <style>
                .avatar img {
                    height: 100%;
                    object-fit: cover;
                }

                .info {
                    font-size: 20px;
                }
            </style>