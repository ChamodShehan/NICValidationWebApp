
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NIC Validating Application </title>
    <link rel="stylesheet" type="text/css" href="style.css">
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
        /*    cards css*/
        .card {
            width: 190px;
            height: 254px;
            background-image: linear-gradient(144deg, #0048bd, #44a7fd 50%, #0048bd);
            border: none;
            border-radius: 10px;
            padding-top: 10px;
            position: relative;
            margin: auto;
            font-family: inherit;
        }

        .card span {
            font-weight: 600;
            color: white;
            text-align: center;
            display: block;

            font-size: 30px;
        }

        .card .job {
            font-weight: 400;
            color: white;
            display: block;
            text-align: center;
            padding-top: 5px;
            font-size: 1em;
        }

        .card .img {
            width: 70px;
            height: 70px;
            background: #e8e8e8;
            border-radius: 100%;
            margin: auto;
            margin-top: 20px;
            position: relative; /* Add this */
        }

        .card .img .number {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 50px;
            font-weight: bold;
            color: #0048bd;
        }





    </style>
    <script>
        const baseUrl = "http://localhost:8081/";

        var male;
        var female;
        var dialog;
        var mobitel;
        var hutch;
        var airtel;
        function getUsers() {
            let xhr = new XMLHttpRequest();
            xhr.open("GET", baseUrl + "v1/user/ResponseCount", true);
            xhr.onload = function () {
                let response = JSON.parse(xhr.responseText);
                displayResponse(response);
            };
            xhr.send();
        }

        function displayResponse(response) {

            male=parseInt(response.maleCount);
            female=parseInt(response.femaleCount);
             dialog=parseInt(response.dialogCount);
             mobitel=parseInt(response.mobitelCount);
             hutch=parseInt(response.hutchCount);
             airtel=parseInt(response.airtelCount);

            document.getElementById("total").innerHTML= male + female ;
            document.getElementById("female").innerHTML=female;
            document.getElementById("male").innerHTML=male;
            document.getElementById("inactiveUsers").innerHTML=response.isDeletedOneCount;
        }

        // Call the function to fetch and display the users
        getUsers();


    </script>
    <script>
        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainerBar", {
                animationEnabled: true,
                theme: "light1", // "light1", "light2", "dark1", "dark2"
                title: {
                    text: "Service Provider Growth"
                },
                axisY: {
                    title: "Growth Rate  ",
                    // suffix: "%"
                },
                axisX: {
                    title: "Service Providers"
                },
                data: [{
                    type: "column",
                    // yValueFormatString: "#,##0.0#\"%\"",
                    dataPoints: [
                        { label: "Dialog", y:  dialog  },
                        { label: "Mobitel", y:  mobitel  },
                        { label: "Hutch", y:  hutch },
                        { label: "Airtel", y: airtel },


                    ]
                }]
            });
            chart.render();
            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                title: {
                    text: "Gender Growth"
                },
                data: [{
                    type: "pie",
                    startAngle: 240,
                    // yValueFormatString: "##0.00\"%\"",
                    indexLabel: "{label} {y}",
                    dataPoints: [
                        {y:  male , label: "Male"},
                        {y:  female , label: "Femal"},

                    ]
                }]
            });
            chart.render();

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

        <div  class="main-container">
            <aside >
                <p>   </p>
                <a href="registration.jsp" style="font-size: 30px">
                    Register Page
                </a>
                <a href="userList.jsp" style="font-size: 30px">
                    View Page
                </a>
                <a href="chart.jsp" style="font-size: 30px">
                    Report
                </a>
                <a href="index.jsp" style="font-size: 30px">
                    Logout
                </a>

            </aside>




            <div class="box-root padding-top--24 flex-flex flex-direction--column"  >
                <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">

                    <div class="card">
                        <div class="card-border-top">
                        </div>
                        <div class="img">
                            <span class="number" id="total"> </span>
                        </div>
                        <span style="padding-top: 25px"> Active Users</span>
                        <%--                            <p class="job"> Job Title</p>--%>

                    </div>
                    <div class="card">
                        <div class="card-border-top">
                        </div>
                        <div class="img" >
                            <span class="number" id="male"> </span>
                        </div>
                        <span style="padding-top: 25px"> Male</span>
                        <%--                            <p class="job"> Job Title</p>--%>

                    </div>
                    <div class="card">
                        <div class="card-border-top">
                        </div>
                        <div class="img">
                            <span class="number" id="female"> </span>
                        </div>
                        <span style="padding-top: 25px"> Femal</span>
                        <%--                            <p class="job"> Job Title</p>--%>

                    </div>
                    <div class="card">
                        <div class="card-border-top">
                        </div>
                        <div class="img">
                            <span class="number" id="inactiveUsers"> </span>
                        </div>
                        <span style="padding-top: 25px"> Deleted Users</span>
                        <%--                            <p class="job"> Job Title</p>--%>

                    </div>



                </div>


                <div  >
                    <div id="chartContainerBar" style="height: 500px; width: 100%; margin: 50px; "></div>

                    <div id="chartContainer" style="height: 500px; width: 100%;  margin :50px;  "></div>
                </div>
            </div>
        </div>


    </div>
</div>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>

</body>
</html>
