<%--
  Created by IntelliJ IDEA.
  User: Vega
  Date: 6/8/2023
  Time: 11:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NIC Validating Application </title>
    <link rel="stylesheet" type="text/css" href="style.css">

    <link rel="stylesheet" type="text/css" href="dist-assets/css/sweetalert2.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src=" dist-assets/js/sweetalert.script.min.js"></script>
    <script src=" dist-assets/js/sweetalert2.min.js"></script>
</head>
<body>
<div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
        <div class="loginbackground box-background--white padding-top--64">
            <div class="loginbackground-gridContainer">
                <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
                    <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
                    </div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
                    <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
                    <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
                    <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
                    <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
                    <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
                    <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
                    <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
                    <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
                </div>
            </div>
        </div>
        <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
            <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">

                <h1><a href=" " rel="dofollow">Forgot Password Page</a></h1>
            </div>
            <div class="formbg-outer">
                <div class="formbg">
                    <div class="formbg-inner padding-horizontal--48">
                        <!-- <span class="padding-bottom--15">Sign in to your account</span> -->
<%--                        <form id="stripe-login" action="forgotPasswordController.jsp"  method="POST">--%>
                            <div class="field padding-bottom--24">
                                <label for="username">User name:</label>
                                <input type="text" id="username" name="username" required>
                            </div>
                            <div class="field padding-bottom--24">
                                <label for="newpassword">Enter New Password:</label>
                                <input type="text" id="newpassword" name="newpassword" required>
                            </div>

                            <div class="field padding-bottom--24">
                                <%--                                <button type="submit" name="submit" >Login</button>--%>
                                <input type="submit" name="submit" value="Continues" onclick="ApiCallForForgotPassword()">
                            </div>
                            <!--   <div class="field">
                                <a class="ssolink" href="#">Use single sign-on (Google) instead</a>
                              </div> -->

<%--                        </form>--%>


                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>

    const baseUrl = "http://localhost:8081/";

    let username = document.getElementById("username");
    let password = document.getElementById("newpassword");
    function ApiCallForForgotPassword(){
        let RequestUrl = baseUrl + 'api/v1/ForgotPassword/update';

        let RequestObject = {
            // "name":Name.value,
            // "date":Date.value,
            // "mobile":Mobile.value,
            // "address":Address.value

            "username": username.value,
            "password": password.value,

        };

        $.ajax({
            url: RequestUrl,
            method: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(RequestObject),
            success: function (Data, StatusText, XHR) {

                if (XHR.status === 200) {
                    swal({
                        type: 'success',
                        title: 'Success!',
                        text: 'Successfully',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(() => {
                        window.location.href = 'index.jsp'; // Redirect to index.jsp
                    } ) ;
                    InputFieldsReset();
                } else {
                    console.log('ApiCallForUserSave.Response.status:', XHR.status);
                }

            },
            error: function (XHR, textStatus, errorThrown) {
                if (XHR.status === 401) {
                    swal({
                        type: 'error',
                        title: 'Error!',
                        text: 'Wrong username',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-danger'
                    });
                } else {
                    console.log('ApiCallForUserSave.Response.Error:', errorThrown);
                }
            }

        }).then();
    }

    function InputFieldsReset(){
        // Name.value="";
        // Date.value="";
        // Mobile.value="";
        // Address.value="";
    }

</script>
</body>
</html>
