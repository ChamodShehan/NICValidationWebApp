<%--
  Created by IntelliJ IDEA.
  User: Vega
  Date: 5/31/2023
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%


%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NIC Validating Application </title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>
        .main-container {
            display: grid;
            grid-template-columns: 1fr 4fr; /* Divide the main container into two columns */
            /* Adjust the gap between the columns */
        }

        .text{
            font-size: 30px;

        }


        aside {
            color: #fff;
            width: 300px;
            padding-left: 20px;
            height: 100%;
            background-image: linear-gradient(30deg , #0048bd, #44a7fd);
            border-top-right-radius: 80px;
            z-index: 15;

            background-color: #f1f1f1; /* Set background color for the aside element */
            padding: 10px;

        }

        aside a {
            font-size: 12px;
            color: #fff;
            display: block;
            padding: 12px;
            padding-left: 30px;
            text-decoration: none;
            -webkit-tap-highlight-color:transparent;
        }


        aside a:hover {
            color: #3f5efb;
            background: #fff;
            outline: none;
            position: relative;
            background-color: #fff;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            font-size: 30px;
        }

        aside a i {
            margin-right: 5px;
        }


        aside a:hover::after {
            content: "";
            position: absolute;
            background-color: transparent;
            bottom: 100%;
            right: 0;
            height: 35px;
            width: 35px;
            border-bottom-right-radius: 18px;
            box-shadow: 0 20px 0 0 #fff;
        }

        aside a:hover::before {
            content: "";
            position: absolute;
            background-color: transparent;
            top: 38px;
            right: 0;
            height: 35px;
            width: 35px;
            border-top-right-radius: 18px;
            box-shadow: 0 -20px 0 0 #fff;
        }

        aside p {
            margin: 0;
            padding: 40px 0;
        }

        body {
            font-family: 'Roboto';
            width: 100%;
            height: 100vh;
            margin: 0;
        }

        .social {
            height: 0;
        }

        .social i:before {
            width: 14px;
            height: 14px;
            font-size: 14px;
            position: fixed;
            color: #fff;
            background: #0077B5;
            padding: 10px;
            border-radius: 50%;
            top:5px;
            right:5px;
        }

        .hover-blue:hover {
            color: blue;
        }
    </style>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        function doCalculate() {
            // var nic = document.getElementById('nic').value;
            var telephone = document.getElementById('telephone').value;
            // var patternNIC = /[0-9]{9}[V|X|v|x]/;
            var patternTelephone = /^(0|94)?[0-9]{9}$/;

            // if (!patternNIC.test(nic)) {
            //     alert('Invalid NIC number');
            //     return false;
            // }

            // if (!patternTelephone.test(telephone)) {
            //     alert('Invalid Telephone number');
            //     return false;
            // }

            return true;
        }

        function  handleMouseoutProvider() {
            var telephone = document.getElementById('telephone').value;
            var patternTelephone = /^(0|94)?[0-9]{9}$/;
            var patter2Telephone = /^\+94\d{9}$/;
            var patter3Telephone = /^7\d{8}$/;

            if (telephone == "") {

                document.getElementById('serviceProvider').value = "";
            }
            else
            {
                if (!patternTelephone.test(telephone) && !patter2Telephone.test(telephone) && !patter3Telephone.test(telephone))  {

                    // if (!patter2Telephone.test(telephone)) {
                    //     if (!patter3Telephone.test(telephone)) {
                    // alert("doestn't accept mobile number pattern ");
                    document.getElementById("modalMobile").style.display = "block";
                    document.getElementById('serviceProvider').value = "";
                    //     }
                    // }

                }else {


                    var str1 = telephone.substr(0, 2);
                    var serviceProvider = "";
                    var str3 = telephone.substr(0, 1);
                    var str2 = telephone.substr(0, 3);

                    if (str1 === "94") {
                        serviceProvider = telephone.substr(2, 2);
                        console.log(serviceProvider);
                    } else if (str2 === "+94") {
                        console.log(serviceProvider);
                        serviceProvider = telephone.substr(3, 2);

                    } else if (str3 === "0") {
                        serviceProvider = telephone.substr(1, 2);
                        console.log(serviceProvider);
                    } else {
                        serviceProvider = telephone.substr(0, 2);
                    }

                    if (serviceProvider === "70" || serviceProvider === "71") {
                        document.getElementById('serviceProvider').value = "Mobitel";
                    } else if (serviceProvider === "72" || serviceProvider === "78") {
                        document.getElementById('serviceProvider').value = "Hutch";
                    } else if (serviceProvider === "74" || serviceProvider === "76" || serviceProvider === "77") {
                        document.getElementById('serviceProvider').value = "Dialog";
                    } else if (serviceProvider === "75") {
                        document.getElementById('serviceProvider').value = "Airtel";
                    }
                }


            }


        }
        function handleMouseoutNicValidation() {
            // Perform actions when the text field loses focus
            // alert("handled");
            // Add your desired functionality here

            // var nic = document.getElementById('nic').value;


            var gender="";
            var year="";
            var month="";
            var day="";



            var nicValue = document.getElementById("nic").value;

            if(nicValue===""){
                document.getElementById("age").value="";
                document.getElementById("gender").value="";
                document.getElementById("birthday").value="";
            }else{

                var oldPatternNIC = /^[0-9]{9}[V|X|v|x]$/;
                var newpatterNIC= /^(19|20)\d{10}$/;

                if (!oldPatternNIC.test(nicValue) && !newpatterNIC.test(nicValue) ) {
                    // alert('Your NIC pattern is wrong');

                    // window.location.assign("main.jsp");
                    // $('#myModal').modal('show');
                    document.getElementById("myForm").style.display = "block";
                    document.getElementById("age").value="";
                    document.getElementById("gender").value="";
                    document.getElementById("birthday").value="";

                }else
                {
                    if(nicValue.length==12){
                        year=  parseInt(nicValue.substr(0, 4));
                        year= year;
                        console.log(year);

                        var midnumber = nicValue.substr(4,3);
                        console.log(midnumber);

                    }else
                    {
                        year=  parseInt(nicValue.substr(0, 2));
                        year=1900+year;
                        console.log(year);

                        var midnumber = nicValue.substring(2, 5);
                        console.log(midnumber);

                    }

                    var intMidValue = parseInt(midnumber);

                    if(intMidValue>500)
                    {
                        gender="Female";
                        intMidValue=intMidValue-500;

                    }else
                    {
                        gender="Male";
                    }
                    document.getElementById("gender").value=gender;

                    if(intMidValue<1 && intMidValue>366){
                        // alert("Invalid NIC number");
                        document.getElementById("modal2form").style.display = "block";
                        document.getElementById("age").value="";
                        document.getElementById("gender").value="";
                        document.getElementById("birthday").value="";

                    }else
                    {
                        if(intMidValue>335)
                        {
                            day=intMidValue-335;
                            month = "December";
                        }else if(intMidValue>305)
                        {
                            day=intMidValue-305;
                            month = "November";
                        }else if(intMidValue>274)
                        {
                            day=intMidValue-274;
                            month = "October";
                        }else if(intMidValue>244)
                        {
                            day=intMidValue-244;
                            month = "September";
                        }else if(intMidValue>213)
                        {
                            day=intMidValue-213;
                            month = "Auguest";
                        }else if(intMidValue>182)
                        {
                            day=intMidValue-182;
                            month = "July";
                        }else if(intMidValue>152)
                        {
                            day=intMidValue-152;
                            month = "June";
                        }else if(intMidValue>121)
                        {
                            day=intMidValue-121;
                            month = "May";
                        }else if(intMidValue>91)
                        {
                            day=intMidValue-91;
                            month = "April";
                        }else if(intMidValue>60)
                        {
                            day=intMidValue-60;
                            month = "March";
                        }else if(intMidValue>60)
                        {
                            day=intMidValue-60;
                            month = "March";
                        }else if(intMidValue>31)
                        {
                            day=intMidValue-31;
                            month = "Febuary";
                        }else if(intMidValue<=31)
                        {
                            day=intMidValue;
                            month = "January";
                        }

                    }
                    // console.log(year );
                    // console.log( month  );
                    // console.log( day);
                    document.getElementById("birthday").value=year+"-"+month+"-"+day;
                    var currentDate = new Date();
                    var currentYear = currentDate.getFullYear();
                    document.getElementById("age").value= currentYear-year;

                    // console.log(currentYear);
                }



            }
            // year=nicValue.substring(0, 2);


        }
    </script>

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
                    <div id="animation1" class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
                    <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
                    <div id="animation2"  class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
                    <div id="animation3" class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
                    <div id="animation4"  class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
                    <div id="animation5" class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
                    <div id="animation6" class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                </div>
                <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
                    <div id="animation7" class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
                </div>
            </div>
        </div>

        <div  class="main-container">
            <aside >
                <p>   </p>
                <a class="ah" href="registration.jsp" style="text-decoration: none; font-size: 30px"  >
                    Register Page
                </a>
                <a style="text-decoration: none; font-size: 30px"  href="userList.jsp">
                    View Page
                </a>
                <a style="text-decoration: none; font-size: 30px" href="chart.jsp">
                    Report
                </a>
                <a style="text-decoration: none; font-size: 30px" href="index.jsp">
                    Logout
                </a>

            </aside>



            <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
                <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
                    <h1><a href=" " rel="dofollow">NIC Validating Application</a></h1>
                </div>

                <div class="formbg-outer">
                    <div class="formbg">
                        <div class="formbg-inner padding-horizontal--48">
                            <!-- <span class="padding-bottom--15">Sign in to your account</span> -->
                            <form id="stripe-login"  method="POST" onsubmit="return doCalculate(this)">
                                <div class="field padding-bottom--24">
                                    <label for="fname">Full name:</label>
                                    <input type="text" id="fname" name="fname" required>
                                </div>
                                <div class="field padding-bottom--24">
                                    <label for="address">Address:</label>
                                    <input type="text" id="address" name="address" required>
                                </div>
                                <%--                            <div class="field padding-bottom--24">--%>
                                <%--                                <label for="nationality">Nationality:</label>--%>
                                <%--                                <input type="text" id="nationality" name="nationality" required>--%>
                                <%--                            </div>--%>
                                <div class="field padding-bottom--24">
                                    <label for="nic">NIC:</label>
                                    <input type="text" id="nic" onmouseout="handleMouseoutNicValidation()" name="nic" required>
                                </div>
                                <div class="field padding-bottom--24">
                                    <label for="birthday">Birthday:</label>
                                    <input type="text" id="birthday" name="birthday" required>
                                </div>
                                <div class="field padding-bottom--24">
                                    <label for="gender">Gender:</label>
                                    <input type="text" id="gender" name="gender" required>
                                </div>
                                <div class="field padding-bottom--24">
                                    <label for="age">Age:</label>
                                    <input type="text" id="age" name="age" required>
                                </div>
                                <div class="field padding-bottom--24">
                                    <label for="telephone">Telephone:</label>
                                    <input type="text" id="telephone" name="telephone" required onmouseout="handleMouseoutProvider()">
                                </div>
                                <div class="field padding-bottom--24">
                                    <label for="serviceProvider">Service Provider:</label>
                                    <input type="text" id="serviceProvider" name="serviceProvider"    >
                                </div>
                                <div class="field padding-bottom--24">
                                    <input type="submit" name="submit" value="Save" onclick="ApiCallForUserSave()">
                                </div>

                            </form>
                        </div>
                    </div>

                </div>

                <%--         Modal of   doestn't accept mobile number pattern--%>
                <div class="modal" id="modalMobile" style=" display: none">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="container" action=" ">
                                    <div class="mb-3 mt-3">

                                        <label class="form-label text-danger fs-5">doestn't accept mobile number pattern </label>

                                    </div>
                                    <button type="button" class="btn btn-danger" onclick="closeModalMobile()">Close</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%--         Modal of   doestn't accept mobile number pattern--%>

                <%--            Modal of Your NIC pattern is wrong--%>
                <div class="modal" id="myForm" style=" display: none">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="container" action=" ">
                                    <div class="mb-3 mt-3">

                                        <label class="form-label text-danger fs-5">Your NIC pattern is wrong</label>

                                    </div>
                                    <button type="button" class="btn btn-danger" onclick="closeModal()">Close</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <%--            Modal of Your NIC pattern is wrong--%>


                </div>


                <%--    modal of Invalid NIC number--%>
                <div class="modal" id="modal2form" style=" display: none">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <form class="container" action=" ">
                                    <div class="mb-3 mt-3">

                                        <label class="form-label text-danger fs-5">Invalid NIC number</label>

                                    </div>
                                    <button type="button" class="btn btn-danger" onclick="closeModal2()">Close</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <%--    modal of Invalid NIC number--%>
            </div>
        </div>


    </div>
    <script>
        function closeModal() {
            var modal = document.getElementById('myForm');
            modal.style.display = 'none';
        }
    </script>
    <script>
        function closeModal2() {
            var modal = document.getElementById('modal2form');
            modal.style.display = 'none';
        }
    </script>
    <script>
        function closeModalMobile() {
            var modal = document.getElementById('modalMobile');
            modal.style.display = 'none';
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="js/bootstrap.bundle.js"></script>
</div>
<script src="dist-assets/js/bootstrap.min.js"></script>
<script src="dist-assets/js/jquery-3.2.1.min.js"></script>
<script src="dist-assets/js/sweetalert2.min.js"></script>
<script src="dist-assets/js/sweetalert.script.min.js"></script>
<script>

    const baseUrl = "http://localhost:8081/";

    let fname = document.getElementById("fname");
    let address = document.getElementById("address");
    let nic = document.getElementById("nic");
    let birthday = document.getElementById("birthday");
    let gender = document.getElementById("gender");
    let age = document.getElementById("age");
    let telephone = document.getElementById("telephone");
    let serviceProvider = document.getElementById("serviceProvider");

    function ApiCallForUserSave(){
        let RequestUrl = baseUrl + 'v1/user/Save';

        let RequestObject = {
            // "name":Name.value,
            // "date":Date.value,
            // "mobile":Mobile.value,
            // "address":Address.value

            "fname": fname.value,
            "address": address.value,
            "nic": nic.value,
            "birthday": birthday.value,
            "gender": gender.value==="Male"?"M":"F",
            "age": age.value,
            "telephone": telephone.value,
            "serviceProvider": serviceProvider.value
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
                        text: 'User Details has been successfully saved',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    });
                    InputFieldsReset();
                } else {
                    console.log('ApiCallForUserSave.Response.status:', XHR.status);
                }

            },
            error: function (Error) {
                console.log('ApiCallForUserSave.Response.Error:', Error);
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