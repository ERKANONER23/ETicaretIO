<%-- 
    Document   : kargoekle
    Created on : 11.Oca.2020, 12:59:20
    Author     : (DESSAS)
--%>



<%@page import="DataBase.DataAccessObject.KartegoriDAO"%>
<%@page import="DataBase.DataTransferObject.Kategori"%>
<%
    String mesaj = "Resimi  giriniz";
    String form = request.getParameter("kaydet");
    if (form != null) {
        String kategoriadi = request.getParameter("kategoriadi");
        String aciklama = request.getParameter("aciklama");

        int id = 0;
        Kategori kategori = new Kategori(id, kategoriadi, aciklama);

        KartegoriDAO kartegoriDAO = new KartegoriDAO();
        int etkilenen = kartegoriDAO.insert(kategori);

        if (etkilenen > 0) {
            mesaj = "Bilgiler Eklenmistir";
            response.sendRedirect("kategorilistele.jsp");
        } else {
            mesaj = "Bilgiler Eklenemedi";
        }

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
        <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

        <title>Kategori Ekle</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/bootstrap-reset.css" rel="stylesheet">
                <!--external css-->
                <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
                <!-- Custom styles for this template -->
                <link href="css/style.css" rel="stylesheet">
                    <link href="css/style-responsive.css" rel="stylesheet" />

                    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
                    <!--[if lt IE 9]>
                      <script src="js/html5shiv.js"></script>
                      <script src="js/respond.min.js"></script>
                    <![endif]-->
                    </head>

                    <body>

                    <section id="container" class="">
                        <!--header start-->
                        <header class="header white-bg">
                            <div class="sidebar-toggle-box">
                                <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
                            </div>
                            <!--logo start-->
                            <a href="index.html" class="logo" >Flat<span>lab</span></a>
                            <!--logo end-->
                            <div class="nav notify-row" id="top_menu">
                                <!--  notification start -->
                                <ul class="nav top-menu">
                                    <!-- settings start -->
                                    <li class="dropdown">
                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                            <i class="icon-tasks"></i>
                                            <span class="badge bg-success">6</span>
                                        </a>
                                        <ul class="dropdown-menu extended tasks-bar">
                                            <div class="notify-arrow notify-arrow-green"></div>
                                            <li>
                                                <p class="green">You have 6 pending tasks</p>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="task-info">
                                                        <div class="desc">Dashboard v1.3</div>
                                                        <div class="percent">40%</div>
                                                    </div>
                                                    <div class="progress progress-striped">
                                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                            <span class="sr-only">40% Complete (success)</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="task-info">
                                                        <div class="desc">Database Update</div>
                                                        <div class="percent">60%</div>
                                                    </div>
                                                    <div class="progress progress-striped">
                                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                            <span class="sr-only">60% Complete (warning)</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="task-info">
                                                        <div class="desc">Iphone Development</div>
                                                        <div class="percent">87%</div>
                                                    </div>
                                                    <div class="progress progress-striped">
                                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 87%">
                                                            <span class="sr-only">87% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="task-info">
                                                        <div class="desc">Mobile App</div>
                                                        <div class="percent">33%</div>
                                                    </div>
                                                    <div class="progress progress-striped">
                                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 33%">
                                                            <span class="sr-only">33% Complete (danger)</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="task-info">
                                                        <div class="desc">Dashboard v1.3</div>
                                                        <div class="percent">45%</div>
                                                    </div>
                                                    <div class="progress progress-striped active">
                                                        <div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                                                            <span class="sr-only">45% Complete</span>
                                                        </div>
                                                    </div>

                                                </a>
                                            </li>
                                            <li class="external">
                                                <a href="#">See All Tasks</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <!-- settings end -->
                                    <!-- inbox dropdown start-->
                                    <li id="header_inbox_bar" class="dropdown">
                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                            <i class="icon-envelope-alt"></i>
                                            <span class="badge bg-important">5</span>
                                        </a>
                                        <ul class="dropdown-menu extended inbox">
                                            <div class="notify-arrow notify-arrow-red"></div>
                                            <li>
                                                <p class="red">You have 5 new messages</p>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini.jpg"></span>
                                                    <span class="subject">
                                                        <span class="from">Jonathan Smith</span>
                                                        <span class="time">Just now</span>
                                                    </span>
                                                    <span class="message">
                                                        Hello, this is an example msg.
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini2.jpg"></span>
                                                    <span class="subject">
                                                        <span class="from">Jhon Doe</span>
                                                        <span class="time">10 mins</span>
                                                    </span>
                                                    <span class="message">
                                                        Hi, Jhon Doe Bhai how are you ?
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini3.jpg"></span>
                                                    <span class="subject">
                                                        <span class="from">Jason Stathum</span>
                                                        <span class="time">3 hrs</span>
                                                    </span>
                                                    <span class="message">
                                                        This is awesome dashboard.
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini4.jpg"></span>
                                                    <span class="subject">
                                                        <span class="from">Jondi Rose</span>
                                                        <span class="time">Just now</span>
                                                    </span>
                                                    <span class="message">
                                                        Hello, this is metrolab
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">See all messages</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <!-- inbox dropdown end -->
                                    <!-- notification dropdown start-->
                                    <li id="header_notification_bar" class="dropdown">
                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                                            <i class="icon-bell-alt"></i>
                                            <span class="badge bg-warning">7</span>
                                        </a>
                                        <ul class="dropdown-menu extended notification">
                                            <div class="notify-arrow notify-arrow-yellow"></div>
                                            <li>
                                                <p class="yellow">You have 7 new notifications</p>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="label label-danger"><i class="icon-bolt"></i></span>
                                                    Server #3 overloaded.
                                                    <span class="small italic">34 mins</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="label label-warning"><i class="icon-bell"></i></span>
                                                    Server #10 not respoding.
                                                    <span class="small italic">1 Hours</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="label label-danger"><i class="icon-bolt"></i></span>
                                                    Database overloaded 24%.
                                                    <span class="small italic">4 hrs</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="label label-success"><i class="icon-plus"></i></span>
                                                    New user registered.
                                                    <span class="small italic">Just now</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="label label-info"><i class="icon-bullhorn"></i></span>
                                                    Application error.
                                                    <span class="small italic">10 mins</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">See all notifications</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <!-- notification dropdown end -->
                                </ul>
                            </div>
                            <div class="top-nav ">
                                <ul class="nav pull-right top-menu">
                                    <li>
                                        <input type="text" class="form-control search" placeholder="Search">
                                    </li>
                                    <!-- user login dropdown start-->
                                    <li class="dropdown">
                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                            <img alt="" src="img/avatar1_small.jpg">
                                                <span class="username">Jhon Doue</span>
                                                <b class="caret"></b>
                                        </a>
                                        <ul class="dropdown-menu extended logout">
                                            <div class="log-arrow-up"></div>
                                            <li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>
                                            <li><a href="#"><i class="icon-cog"></i> Settings</a></li>
                                            <li><a href="#"><i class="icon-bell-alt"></i> Notification</a></li>
                                            <li><a href="login.html"><i class="icon-key"></i> Log Out</a></li>
                                        </ul>
                                    </li>
                                    <!-- user login dropdown end -->
                                </ul>
                            </div>
                        </header>
                        <!--header end-->
                        <!--sidebar start-->
                        <aside>
                            <div id="sidebar"  class="nav-collapse ">
                                <!-- sidebar menu start-->
                                <ul class="sidebar-menu" id="nav-accordion">
                                    <li>
                                        <a class="active" href="index.html">
                                            <i class="icon-dashboard"></i>
                                            <span>Yönetim Paneli</span>
                                        </a>
                                    </li>


                                    <li class="sub-menu">
                                        <a href="javascript:;" >
                                            <i class="icon-book"></i>
                                            <span>Ekleme Islemleri</span>
                                        </a>
                                        <ul class="sub">
                                            <li><a  href="kargoekle.jsp">Kargo Ekle</a></li>
                                            <li><a  href="kategoriekle.jsp">Kategori Ekle</a></li>
                                            <li><a  href="markaresimekle.jsp">Marka Ekle</a></li>
                                            <li><a  href="urunresimekle.jsp">Urun Ekleme</a></li>

                                        </ul>
                                    </li>


                                    <li class="sub-menu">
                                        <a href="javascript:;" >
                                            <i class="icon-book"></i>
                                            <span>Listeleme Islemleri</span>
                                        </a>
                                        <ul class="sub">
                                            <li><a  href="kargolistele.jsp">Kargo Listele</a></li>
                                            <li><a  href="kategorilistele.jsp">Kategori Listele</a></li>
                                            <li><a  href="markalisteleme.jsp">Marka Listele</a></li>
                                            <li><a  href="urunlisteleme.jsp">Urun Listele</a></li>

                                        </ul>
                                    </li>



                                    <li class="sub-menu">
                                        <a href="javascript:;" >
                                            <i class="icon-shopping-cart"></i>
                                            <span>Satıs Islemlerı</span>
                                        </a>
                                        <ul class="sub">
                                            <li><a  href="product_list.html">List View</a></li>
                                            <li><a  href="product_details.html">Details View</a></li>
                                        </ul>
                                    </li>


                                    <li>
                                        <a  href="login.html">
                                            <i class="icon-user"></i>
                                            <span>Çıkış Yap</span>
                                        </a>
                                    </li>


                                </ul>
                                <!-- sidebar menu end-->
                            </div>
                        </aside>
                        <!--sidebar end-->
                        <!--main content start-->
                        <section id="main-content">
                            <section class="wrapper">
                                <!-- page start-->


                                <div class="row">
                                    <div class="col-lg-12">
                                        <section class="panel">
                                            <header class="panel-heading">
                                                MarkaREsim Ekleme  <br>
                                                <%= mesaj%>
                                            </header>
                                            <div class="panel-body">
                                                <div class="form">
                                                    <form class="cmxform form-horizontal tasi-form" id="kargoform" method="get" action="urunekle.jsp">
                                                        <div class="form-group ">
                                                            <label for="urunadi" class="control-label col-lg-2">Kategori Adi</label>
                                                            <div class="col-lg-10">
                                                                <input class=" form-control" id="sirketadi" name="kategoriadi" type="text" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group ">
                                                            <label for="aciklama" class="control-label col-lg-2">Aciklama</label>
                                                            <div class="col-lg-10">
                                                                <input class=" form-control" id="adres" name="aciklama" type="text" />
                                                            </div>
                                                        </div>


                                                </div>
                                                <br>
                                                <br>
                                                <div class="form-group">
                                                    <div class="col-lg-offset-2 col-lg-10">
                                                        <button class="btn btn-danger" type="submit" name="kaydet">Kaydet</button>
                                                        <button class="btn btn-default" type="button">Iptal Et</button>
                                                    </div>
                                                </div>
                                                </form>


                                                Select a file to upload: <br />
                                                <form action = "urunekle.jsp" method = "post"
                                                      enctype = "multipart/form-data">
                                                    <input type = "file" name = "file" size = "50" />
                                                    <br />

                                                    <input type = "submit" value = "Upload File" />
                                                </form>

                                            </div>
                                    </div>
                            </section>
                            </div>
                            </div>
                            <!-- page end-->
                        </section>
                    </section>
                    <!--main content end-->
                    <!--footer start-->
                    <footer class="site-footer">
                        <div class="text-center">
                            2013 &copy; FlatLab by VectorLab.
                            <a href="#" class="go-top">
                                <i class="icon-angle-up"></i>
                            </a>
                        </div>
                    </footer>
                    <!--footer end-->
                    </section>

                    <!-- js placed at the end of the document so the pages load faster -->
                    <script src="js/jquery.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
                    <script src="js/jquery.scrollTo.min.js"></script>
                    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
                    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
                    <script src="js/respond.min.js" ></script>

                    <!--common script for all pages-->
                    <script src="js/common-scripts.js"></script>

                    <!--script for this page-->
                    <script src="js/form-validation-script.js"></script>


                    </body>
                    </html>
