<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!-- Latest compiled and minified CSS -->

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Delete User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link rel="stylesheet" href="/css/style.css">
            </head>

            <body>
                <div class="container">
                    <h2 class="mb-5 mt-5">Delete User</h2>
                    <div class="alert alert-danger" role="alert">
                        Bạn có muốn xóa user có Id = ${id}
                    </div>
                    <div>
                        <form:form action="/admin/user/delete" method="POST" modelAttribute="user">

                            <div class="mb-3" style="display: none;">
                                <form:input type="text" class="form-control" path="id" value="${id}" />
                            </div>


                            <button type="submit" class="btn btn-danger">Xóa</button>
                            <a class="btn btn-success" href="/admin/user">Back</a>
                        </form:form>

                    </div>
                </div>

            </body>

            </html>