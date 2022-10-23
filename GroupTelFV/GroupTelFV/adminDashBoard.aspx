<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashBoard.aspx.cs" Inherits="GroupTelFV.adminDashBoard" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Admin - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="CSS/sb-admin-2.css?v3" rel="stylesheet" />
</head>

<body id="page-top">
    <form id="form3" runat="server">
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="login.aspx" target="_blank">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <span class="nav-link">Dashboard</span>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Pages
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="Default.aspx" data-toggle="collapse" data-target="#collapseTwo"
                        aria-expanded="true" aria-controls="collapseTwo" target="_blank">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Default</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Components:</h6>
                            <a class="collapse-item" href="buttons.html">Buttons</a>
                            <a class="collapse-item" href="cards.html">Cards</a>
                        </div>
                    </div>
                </li>


                <li class="nav-item">
                    <a class="nav-link collapsed" href="contact.aspx" data-toggle="collapse" data-target="#collapseUtilities"
                        aria-expanded="true" aria-controls="collapseUtilities" target="_blank">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Contact</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                        data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Utilities:</h6>
                            <a class="collapse-item" href="utilities-color.html">Colors</a>
                            <a class="collapse-item" href="utilities-border.html">Borders</a>
                            <a class="collapse-item" href="utilities-animation.html">Animations</a>
                            <a class="collapse-item" href="utilities-other.html">Other</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="profile.aspx" data-toggle="collapse" data-target="#collapseTwo"
                        aria-expanded="true" aria-controls="collapseTwo" target="_blank">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Profile</span>
                    </a>
                    <div class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Components:</h6>
                            <a class="collapse-item" href="buttons.html">Buttons</a>
                            <a class="collapse-item" href="cards.html">Cards</a>
                        </div>
                    </div>
                </li>



                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->


                        <div class="input-group" dir="rtl">
                            <asp:TextBox runat="server" ID="searchBox" placeholder="מה ברצונכם למצוא?" CssClass="form-control bg-light border-0 small" />
                            <asp:Button runat="server" ID="searchBtn" Text="מצא" OnClick="searchBtn_Click" CssClass="btn btn-primary" />
                        </div>


                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                    aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                placeholder="Search for..." aria-label="Search"
                                                aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                            </li>
                     
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">
                                            Hi there! I am wondering if you can help me with a
                                            problem I've been having.
                                        </div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">
                                            I have the photos that you ordered last month, how
                                            would you like them sent to you?
                                        </div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">
                                            Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!
                                        </div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">
                                            Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...
                                        </div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                            </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small" runat="server" id="profileRole"></span>
                                    <asp:Image id="profilePicture" runat="server"  CssClass="img-profile rounded-circle"/>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                    aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">


                        <!-- Content Row -->
                      
                            
                          
                        <div class="row">
                              <!-- Earnings (total) Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2 overflowing">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                     כל הרווחים (כללי  עבור כל שנות הפעילות)
                                                </div>
                                                <asp:TextBox ID="totalEarnings" runat="server" ReadOnly="true" class="h5 mb-0 font-weight-bold text-gray-800 inputs" />
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <!-- Earnings (yearly) Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2 overflowing">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    רווחים שנתיים (כללי )
                                                </div>
                                                <asp:TextBox ID="yearlyEarnings" runat="server" ReadOnly="true" class="h5 mb-0 font-weight-bold text-gray-800 inputs" />
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2 overflowing">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    רווחים חודשיים (כללי בשקלים)
                                                </div>
                                                <asp:TextBox ID="monthlyEarnings" runat="server" ReadOnly="true" class="h5 mb-0 font-weight-bold text-gray-800 inputs" />
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        
                            <!-- closed group all bought -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2 overflowing">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                    קבוצות סגורות (עקב רכישת כל הכמות)
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <asp:TextBox runat="server" ReadOnly="true" ID="closedGroup" class="h5 mb-0 mr-3 font-weight-bold text-gray-800 inputs" />
                                                    </div>
                                                    <div class="col">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- open groups -->
                            <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2 overflowing">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    קבוצות פתוחות
                                                </div>
                                                <asp:TextBox runat="server" ID="openGroup" class="h5 mb-0 font-weight-bold text-gray-800 inputs"></asp:TextBox>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                        <div class="col-xl-2 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2 overflowing">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                     קבוצות סגורות (עקב לא מספיק רוכשים)
                                                </div>
                                                <asp:TextBox runat="server" ID="closedNoBuyers" class="h5 mb-0 font-weight-bold text-gray-800 inputs"></asp:TextBox>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                         <!-- closed no buyers group -->
                        </div>

                        <!-- Content Row -->

                        <div>

                            <!-- Area Chart -->

                            <div>
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between direction">
                                        <h6 class="m-0 font-weight-bold text-primary">העלאת מוצר</h6>
                                    </div>
                                    <div class="card-body">
                                        <!--Upload Item Card Body -->
                                        <div class="grid">
                                            <!-- For productCid -->
                                            <div>

                                                <!-- For productMenuCat -->
                                                <asp:TextBox ID="productMenuCat" placeholder="הזן שם קטגוריה" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMenuCat" runat="server" ControlToValidate="productMenuCat" ErrorMessage="*הזן שם קטגוריה" ForeColor="red" />

                                                <!--- For productName---->

                                                <asp:TextBox ID="productName" placeholder=" הזן שם מוצר " runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="productName" ErrorMessage="*הזן שם מוצר" ForeColor="red" />

                                                <!-- For productPrice -->
                                                <asp:TextBox ID="productPrice" placeholder="הזן מחיר מוצר" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ControlToValidate="productPrice" ErrorMessage="*הזן מחיר מוצר" ForeColor="red"></asp:RequiredFieldValidator>

                                                <!-- For productDisc -->
                                                <asp:TextBox ID="productDisc" placeholder="הזן תיאור מוצר" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDisc" runat="server" ControlToValidate="productDisc" ErrorMessage="*הזן תיאור מוצר" ForeColor="red" />
                                                <asp:DropDownList runat="server" ID="productCid">
                                                    <asp:ListItem Text="בחר קטגוריה" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="Hotels" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Electronics" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Furniture" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Toys" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="Adult_toys" Value="5"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server"
                                                    ControlToValidate="productCid" ValueToCompare="-1" Operator="NotEqual"
                                                    Type="Integer" ErrorMessage="בחר קטגוריה" ForeColor="red" />
                                            </div>
                                            <div>
                                                <!-- For smallText -->
                                                <asp:TextBox ID="productText" placeholder="הזן אותיות קטנות" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorText" runat="server" ControlToValidate="productText" ErrorMessage="*הזן אותיות קטנות" ForeColor="red"></asp:RequiredFieldValidator>

                                                <!-- For productQuantity -->
                                                <asp:TextBox ID="productQuantity" placeholder="הזן כמות" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" ControlToValidate="productQuantity" ErrorMessage="*הזן כמות" ForeColor="red" />

                                                <!-- For productAddress -->
                                                <asp:TextBox ID="productAddress" placeholder="הזן כתובת" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="productAddress" ErrorMessage="*הזן כתובת" ForeColor="red" />

                                                <!-- For finishDate -->
                                                <asp:TextBox ID="productDate" placeholder="Apr  8, 2023 12:00:00" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ControlToValidate="productDate" ErrorMessage="*הזן תאריך סיום" ForeColor="red"></asp:RequiredFieldValidator>

                                                <!-- For img -->
                                                <asp:FileUpload ID="imgUpload" runat="server" />
                                                <asp:Button ID="btnSave" runat="server" Text="העלאה" OnClick="btnSave_Click" />
                                                <asp:Literal ID="ltlMsg" runat="server"></asp:Literal>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pie Chart -->

                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">הכנסות שנתיות פר קטגוריה</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">הכנסות חופשות                                         
                                        <asp:TextBox runat="server" ID="vacationPercentageYearly" ReadOnly="true" class="small font-weight-bold float-right percentage"></asp:TextBox>
                                    </h4>

                                    <asp:TextBox runat="server" ID="vacationIncome" ReadOnly="true" class="inputs-progressbar">
                                    </asp:TextBox>

                                    <div class="progress mb-4">
                                        <asp:TextBox runat="server" ID="vacationIncomeColor" ReadOnly="true" class="progress-bar bg-danger" role="progressbar"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                        </asp:TextBox>
                                    </div>
                                    <h4 class="small font-weight-bold">הכנסות אלקטרוניקה                                        
                                        <asp:TextBox runat="server" ID="electronicPercentageYearly" ReadOnly="true" class="small font-weight-bold float-right percentage"></asp:TextBox>
                                    </h4>

                                    <asp:TextBox runat="server" ID="electronicIncome" ReadOnly="true" CssClass="inputs-progressbar">
                                    </asp:TextBox>

                                    <div class="progress mb-4">
                                        <asp:TextBox runat="server" ID="electronicIncomeColor" ReadOnly="true" class="progress-bar bg-info" role="progressbar"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                        </asp:TextBox>
                                    </div>
                                    <h4 class="small font-weight-bold">הכנסות ריהוט                                        
                                        <asp:TextBox runat="server" ID="furniturePercentageYearly" ReadOnly="true" class="small font-weight-bold float-right percentage"></asp:TextBox>
                                    </h4>


                                    <asp:TextBox runat="server" ID="furnitureIncome" ReadOnly="true" class="inputs-progressbar">
                                    </asp:TextBox>

                                    <div class="progress mb-4">
                                        <asp:TextBox ID="furnitureIncomeColor" ReadOnly="true" class="progress-bar bg-success" role="progressbar"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" runat="server"></asp:TextBox>
                                    </div>
                                                                 
                                </div>
                            </div>

                            <!-- Color System -->


                        </div>

                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">הכנסות חודשיות פר קטגוריה</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">הכנסות חופשות                                     
                                        <asp:TextBox runat="server" ID="vacationPercentageMonthly" ReadOnly="true" class="small font-weight-bold float-right percentage"></asp:TextBox>
                                    </h4>
                                   
                                        <asp:TextBox runat="server" ID="vacationIncomeMonth" ReadOnly="true" class="inputs-progressbar">
                                        </asp:TextBox>
                                    
                                    <div class="progress mb-4">
                                        <asp:TextBox runat="server" ID="vacationIncomeMonthColor" ReadOnly="true" class="progress-bar bg-danger" role="progressbar"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                        </asp:TextBox>
                                    </div>
                                    <h4 class="small font-weight-bold">הכנסות אלקטרוניקה                                        
                                        <asp:TextBox runat="server" ID="electronicPercentageMonthly" ReadOnly="true" class="small font-weight-bold float-right percentage"></asp:TextBox>
                                    </h4>
                                    
                                        <asp:TextBox runat="server" ID="electronicIncomeMonth" ReadOnly="true" class="inputs-progressbar">
                                        </asp:TextBox>
                                    
                                    <div class="progress mb-4">
                                        <asp:TextBox runat="server" ID="electronicIncomeMonthColor" ReadOnly="true" class="progress-bar bg-info" role="progressbar"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                        </asp:TextBox>
                                    </div>
                                    <h4 class="small font-weight-bold">הכנסות ריהוט                                        
                                        <asp:TextBox runat="server" ID="furniturePercentageMonthly" ReadOnly="true" class="small font-weight-bold float-right percentage"></asp:TextBox>
                                    </h4>
                                    
                                        <asp:TextBox runat="server" ID="furnitureIncomeMonth" ReadOnly="true" class="inputs-progressbar">
                                        </asp:TextBox>
                                    
                                    <div class="progress mb-4">
                                        <asp:TextBox runat="server" ID="furnitureIncomeMonthColor" ReadOnly="true" class="progress-bar bg-success" role="progressbar"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                        </asp:TextBox>
                                    </div>                                    
                                </div>
                            </div>

                            <!-- Color System -->


                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->



        </div>
        <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>&copy; GroupTel <span id="year"></span></span>
                </div>
            </div>
        </footer>
        <script src="JS/CopyRight.js"></script>
        <!-- End of Footer -->
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>

        <!-- ProgpressBar -->
        <script>
            var element1 = document.getElementById("vacationIncomeColor");
            element1.style.width = '<%=JSvactionYearlyPercentage%>' + '%';

            var element2 = document.getElementById("electronicIncomeColor");
            element2.style.width = '<%=JSelectronicYearlyPernectage%>' + '%';

            var element3 = document.getElementById("furnitureIncomeColor");
            element3.style.width = '<%=JSfurnitureYearlyPercentage%>' + '%';


            var element4 = document.getElementById("vacationIncomeMonthColor");
            element4.style.width = '<%=JSactionMonthlyPercentage%>' + '%';

            var element5 = document.getElementById("electronicIncomeMonthColor");
            element5.style.width = '<%=JSelectronicMonthlyPercentage%>' + '%';

            var element6 = document.getElementById("furnitureIncomeMonthColor");
            element6.style.width = '<%=JSfurnitureMonthlyPercentage%>' + '%';

        </script>
    </form>

</body>

</html>
