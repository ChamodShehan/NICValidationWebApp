

<!DOCTYPE html>
<html lang="en" class="antialiased">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DataTables </title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" rel=" stylesheet">
    <!--Replace with your tailwind.css once created-->


    <!--Regular Datatables CSS-->
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
    <!--Responsive Extension Datatables CSS-->
    <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" rel="stylesheet">
    <link href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" rel=" stylesheet">

    <link rel="stylesheet" type="text/css" href="dist-assets/css/sweetalert2.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>

    <style>
        /*Overrides for Tailwind CSS */

        /*Form fields*/
        .container {
            /*display: flex;*/
            justify-content:  center;
        }
        .dataTables_wrapper select,
        .dataTables_wrapper .dataTables_filter input {
            color: #4a5568;
            /*text-gray-700*/
            padding-left: 1rem;
            /*pl-4*/
            padding-right: 1rem;
            /*pl-4*/
            padding-top: .5rem;
            /*pl-2*/
            padding-bottom: .5rem;
            /*pl-2*/
            line-height: 1.25;
            /*leading-tight*/
            border-width: 2px;
            /*border-2*/
            border-radius: .25rem;
            border-color: #edf2f7;
            /*border-gray-200*/
            background-color: #edf2f7;
            /*bg-gray-200*/
        }

        /*Row Hover*/
        table.dataTable.hover tbody tr:hover,
        table.dataTable.display tbody tr:hover {
            background-color: #ebf4ff;
            /*bg-indigo-100*/
        }

        /*Pagination Buttons*/
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            font-weight: 700;
            /*font-bold*/
            border-radius: .25rem;
            /*rounded*/
            border: 1px solid transparent;
            /*border border-transparent*/
        }

        /*Pagination Buttons - Current selected */
        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            color: #fff !important;
            /*text-white*/
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
            /*shadow*/
            font-weight: 700;
            /*font-bold*/
            border-radius: .25rem;
            /*rounded*/
            background: #667eea !important;
            /*bg-indigo-500*/
            border: 1px solid transparent;
            /*border border-transparent*/
        }

        /*Pagination Buttons - Hover */
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            color: #fff !important;
            /*text-white*/
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
            /*shadow*/
            font-weight: 700;
            /*font-bold*/
            border-radius: .25rem;
            /*rounded*/
            background: #667eea !important;
            /*bg-indigo-500*/
            border: 1px solid transparent;
            /*border border-transparent*/
        }

        /*Add padding to bottom border */
        table.dataTable.no-footer {
            border-bottom: 1px solid #e2e8f0;
            /*border-b-1 border-gray-300*/
            margin-top: 0.75em;
            margin-bottom: 0.75em;
        }

        /*Change colour of responsive icon*/
        table.dataTable.dtr-inline.collapsed>tbody>tr>td:first-child:before,
        table.dataTable.dtr-inline.collapsed>tbody>tr>th:first-child:before {
            background-color: #667eea !important;
            /*bg-indigo-500*/
        }
        .top-left-buttons {
            position: absolute;
            top: 10px;
            left: 10px;
        }

        .top-left-buttons button {
            padding: 10px;
        }
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
            height: 100vh;
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
    </style>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src=" dist-assets/js/sweetalert.script.min.js"></script>
    <script src=" dist-assets/js/sweetalert2.min.js"></script>


</head>

<body class="bg-gray-100 text-gray-900 tracking-wider leading-normal">

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


                <div  class="main-container">
                    <aside >
                        <p>   </p>
                        <a href="registration.jsp">
                            <i class="fa fa-user-o" aria-hidden="true"></i>
                            <span class="text">Register Page</span>
                        </a>
                        <a href="userList.jsp">
                            <i class="fa fa-laptop" aria-hidden="true"></i>
                            <span class="text">View Page</span>
                        </a>
                        <a href="chart.jsp">
                            <i class="fa fa-clone" aria-hidden="true"></i>
                            <span class="text">Report</span>
                        </a>
                        <a href="index.jsp">
                            <i class="fa fa-clone" aria-hidden="true"></i>
                            <span class="text">Logout</span>
                        </a>

                    </aside>


                    <!--Container-->
                    <div class="container w-full md:w-4/5 xl:w-3/5  mx-auto px-2">    <!--Card-->
                        <div id='recipients' class="p-8 mt-6 lg:mt-0 rounded shadow bg-white">

                            <table id="example" class="stripe hover" style="width:100%; padding-top: 1em;  padding-bottom: 1em;">
                                <thead>
                                <tr>
                                    <th data-priority="1">User Id</th>
                                    <th data-priority="2">Name</th>
                                    <th data-priority="3">Address</th>

                                    <th data-priority="4">NIC</th>
                                    <th data-priority="5">TelePhone</th>
                                    <th data-priority="6">Action</th>
                                </tr>
                                </thead>
                                <tbody id="tablebody">

                                <!-- Rest of your data (refer to https://datatables.net/examples/server_side/ for server side processing)-->


                                </tbody>

                            </table>


                        </div>
                        <!--/Card-->


                    </div>
                    <!--/container-->
                </div>

            </div>
        </div>


    </div>
    <div class="modal" id="modal3form" style=" display: none">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
<%--                    <form class="container" action="editController.jsp">--%>
                        <div class="mb-3 mt-3">
                            <label for="id" class="form-label">Id:</label>
                            <input type="text" class="form-control" id="id"   name="id" readonly >
                        </div>
                        <div class="mb-3 mt-3">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" class="form-control" id="name"   name="name">
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address:</label>
                            <input type="text" class="form-control" id="address"  name="address">
                        </div>
                        <div class=" mb-3">
                            <label for="nic" class="form-label">NIC:</label>
                            <input type="text" class="form-control" id="nic"  name="nic" onmouseout="handleMouseoutNicValidation()">
                        </div>
                        <div class=" mb-3">
                            <label for="telephone" class="form-label">Telephone:</label>
                            <input type="text" class="form-control" id="telephone" name="telephone"  onmouseout="validateTelephonenumber()">
                        </div>
                        <button type="submit" class="btn btn-primary" onclick="update()">Update</button>
<%--                    </form>--%>
                </div>
            </div>
        </div>
    </div>
    <%--         Modal of   doestn't accept NIC pattern--%>
    <div class="modal" id="nicerror" style=" display: none">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form class="container" action=" ">
                        <div class="mb-3 mt-3">

                            <label class="form-label text-danger fs-5">doestn't accept NIC pattern</label>

                        </div>
                        <button type="button" class="btn btn-danger" onclick="closeModalNiC()">Close</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%--         Modal of  doestn't accept NIC pattern--%>

    <%--         Modal of   doestn't accept Telephone pattern--%>
    <div class="modal" id="mobileerror" style=" display: none">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form class="container" action=" ">
                        <div class="mb-3 mt-3">

                            <label class="form-label text-danger fs-5">doestn't accept Telephone number pattern</label>

                        </div>
                        <button type="button" class="btn btn-danger" onclick="closeModalTelephone()">Close</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%--         Modal of  doestn't accept Telephone pattern--%>

</div>



<!-- jQuery -->
<%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>--%>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/datatables.min.js"></script>
<script src="js/datatables.script.min.js"></script>
<!--Datatables -->
<%--<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>--%>
<script>
    $(document).ready(function() {

        var table = $('#example').DataTable({
            responsive: true
        })
            .columns.adjust()
            .responsive.recalc();
    });
</script>

<script>
    function handleMouseoutNicValidation() {

        var nicValue = document.getElementById("nic").value;

        if(nicValue===""){

        }else{

            var oldPatternNIC = /^[0-9]{9}[V|X|v|x]$/;
            var newpatterNIC= /^(19|20)\d{10}$/;

            if (!oldPatternNIC.test(nicValue) && !newpatterNIC.test(nicValue) ) {
                // alert('Your NIC pattern is wrong');

                // window.location.assign("main.jsp");
                // $('#myModal').modal('show');
                document.getElementById("nicerror").style.display = "block";

            }



        }
        // year=nicValue.substring(0, 2);


    }
</script>
<script>
    function closeModalNiC() {
        var modal = document.getElementById('nicerror');
        modal.style.display = 'none';
    }
    function closeModalTelephone(){
        document.getElementById("mobileerror").style.display = "none";
    }
</script>

<script>
    function  validateTelephonenumber() {
        var telephone = document.getElementById('telephone').value;
        var patternTelephone = /^(0|94)?[0-9]{9}$/;
        var patter2Telephone = /^\+94\d{9}$/;
        var patter3Telephone = /^7\d{8}$/;

        if (telephone == "") {


        }
        else
        {
            if (!patternTelephone.test(telephone) && !patter2Telephone.test(telephone) && !patter3Telephone.test(telephone))  {

                document.getElementById("mobileerror").style.display = "block";

            }


        }


    }
</script>

<script>
    function redirectToMain() {
        window.location.href = "main.jsp";
    }

    function redirectToIndex() {
        window.location.href = "index.jsp";
    }
</script>
<script>
    const baseUrl = "http://localhost:8081/";

    function getUsers() {
        let xhr = new XMLHttpRequest();
        xhr.open("GET", baseUrl + "v1/user/Userlist", true);
        xhr.onload = function () {
            let users = JSON.parse(xhr.responseText);
            displayUsers(users);
        };
        xhr.send();
    }

    function displayUsers(users) {
        let tableBody = document.getElementById("tablebody");
        tableBody.innerHTML = "";

        for (let i = 0; i < users.length; i++) {
            let user = users[i];

            let row = document.createElement("tr");

            let userIdCell = document.createElement("td");
            userIdCell.textContent = user.id;
            row.appendChild(userIdCell);

            let nameCell = document.createElement("td");
            nameCell.textContent = user.fname;
            row.appendChild(nameCell);

            let addressCell = document.createElement("td");
            addressCell.textContent = user.address;
            row.appendChild(addressCell);

            let nicCell = document.createElement("td");
            nicCell.textContent = user.nic;
            row.appendChild(nicCell);

            let telephoneCell = document.createElement("td");
            telephoneCell.textContent = user.telephone;
            row.appendChild(telephoneCell);

            let actionCell = document.createElement("td");

            // Create the "Update" button
            let updateButton = document.createElement("button");
            updateButton.id = "update";
            updateButton.type = "button";
            updateButton.className = "btn btn-primary";
            updateButton.textContent = "Update";
            updateButton.addEventListener("click", () => {
                openForm(user.id, user.fname, user.address, user.nic, user.telephone);
            });
            actionCell.appendChild(updateButton);

            // Create the "Delete" button
            let deleteButton = document.createElement("button");
            deleteButton.type = "submit";
            deleteButton.className = "btn btn-danger";
            deleteButton.name = `deleteBtn_${user.id}`;
            deleteButton.textContent = "Delete";
            deleteButton.addEventListener("click", () => {
                deleteButtonHandler(user.id);
            });
            actionCell.appendChild(deleteButton);

            row.appendChild(actionCell);

            tableBody.appendChild(row);
        }
    }

    // Call the function to fetch and display the users
    getUsers();
    function openForm(id,name,address,nic,telephone) {
        document.getElementById("modal3form").style.display = "block";
        // console.log(name);
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("address").value = address;
        document.getElementById("nic").value = nic;
        document.getElementById("telephone").value = telephone;
    }

    function update(){
        let RequestUrl = baseUrl + 'v1/user/UpdateUser';

        let id = document.getElementById("id");
        let fname = document.getElementById("name");
        let address = document.getElementById("address");
        let nic = document.getElementById("nic");
        let telephone = document.getElementById("telephone");

        let RequestObject = {
            // "name":Name.value,
            // "date":Date.value,
            // "mobile":Mobile.value,
            // "address":Address.value
            "id":id.value,
            "fname": fname.value,
            "address": address.value,
            "nic": nic.value,
            "telephone": telephone.value,

        };

        $.ajax({
            url: RequestUrl,
            method: 'PUT',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(RequestObject),
            success: function (Data, StatusText, XHR) {

                if (XHR.status === 200) {
                    swal({
                        type: 'success',
                        title: 'Success!',
                        text: 'Updated',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(() => {
                        window.location.href = 'userList.jsp'; // Redirect to index.jsp
                    } ) ;
                    InputFieldsReset();
                } else {
                    console.log('ApiCallForUserSave.Response.status:', XHR.status);
                }

            },

        }).then();

    }

    function deleteButtonHandler(userid) {
        let RequestUrl = baseUrl + 'v1/user/DeleteUser';

        let RequestObject = {

            "id": userid,


        };

        $.ajax({
            url: RequestUrl,
            method: 'Delete',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(RequestObject),
            success: function (Data, StatusText, XHR) {

                if (XHR.status === 200) {
                    swal({
                        type: 'success',
                        title: 'Success!',
                        text: 'Deleted',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(() => {
                        window.location.href = 'userList.jsp'; // Redirect to index.jsp
                    } ) ;
                    InputFieldsReset();
                } else {
                    console.log('ApiCallForUserSave.Response.status:', XHR.status);
                }

            },


        }).then();

    }
</script>
<script type="text/javascript">

    $(document).ready(function () {
        loadTable();
    });

    function loadTable() {
        $('#example').DataTable({
            "paging": true,
            "dom": 'Bfrtip',
            "buttons": [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "responsive": true,
            "bDestroy": true
        });
    }
</script>

</body>

</html>