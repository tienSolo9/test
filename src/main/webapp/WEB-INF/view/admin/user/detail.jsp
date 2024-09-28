<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User detail</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <div class="container mt-5">
                <h2>User detail</h2>
                <div class="card mb-3 mt-5 border-5" style="width:60%;">
                    <div class="row g-0">
                        <div class="col-md-4 avatar">
                            <img src="data:image/jpeg;base64,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"
                                class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Id: ${userDetail.id}</h5>
                                <p class="card-text">Full name: ${userDetail.fullName}</p>
                                <p class="card-text">Email: ${userDetail.email}</p>
                                <p class="card-text">Address: ${userDetail.address}</p>
                                <p class="card-text"><small class="text-muted">infomation</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn btn-primary">
                    <a href="/admin/user" style="color:#fff;text-decoration: none;">Back</a>
                </div>

            </div>

        </body>


        </html>
        <style>
            .avatar img {
                height: 100%;
                object-fit: cover;
            }
        </style>