<%-- 
    Document   : kargolistele
    Created on : 11.Oca.2020, 13:26:28
    Author     : (DESSAS)
--%>

<%@page import="java.util.Date"%>
<%@page import="DataBase.DataTransferObject.Urun"%>
<%@page import="DataBase.DataAccessObject.UrunDAO"%>
<%@page import="DataBase.DataTransferObject.Marka"%>
<%@page import="DataBase.DataAccessObject.MarkaDAO"%>
<%@page import="DataBase.DataTransferObject.Kategori"%>
<%@page import="DataBase.DataAccessObject.KartegoriDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DataBase.DataTransferObject.Kargo"%>
<%@page import="DataBase.DataAccessObject.KargoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    request.setCharacterEncoding("utf-8");
    String urunad = request.getParameter("urunad");
    if (urunad != null) {
        String alisfiyati = request.getParameter("alisfiyati");
        String satisfiyati = request.getParameter("satisfiyati");
        String sonkullanmatarihi = request.getParameter("sonkullanmatarihi");
        String kategori = request.getParameter("kategori");
        String markaid = request.getParameter("marka");
        String resimyolu = request.getParameter("resimyolu");
        String aciklama = request.getParameter("aciklama");
        resimyolu = resimyolu.replace("D:\\PROJELER\\NETBEANS81\\ETicaretIO\\web\\template_content\\", "");
        // http://localhost:8084/ETicaretIO/template_content/D:/PROJELER/NETBEANS81/ETicaretIO/web/template_content/resimler/12e49b89f83b7d0d6aad72d6e326d12c.jpg
        // D:\PROJELER\NETBEANS81\ETicaretIO\web\template_content\resimler\12e49b89f83b7d0d6aad72d6e326d12c.jpg	
        // D:/PROJELER/NETBEANS81/ETicaretIO/web/template_content/
        UrunDAO urunDAO = new UrunDAO();
        String eklemeTarihi = new Date().toString();

        Urun urun = new Urun();
        urun.setId(0);
        urun.setAd(urunad);
        urun.setAlisFiyati(Double.valueOf(alisfiyati));
        urun.setSatisFiyati(Double.valueOf(satisfiyati));
        urun.setEklemeTarihi(eklemeTarihi);
        urun.setSonKullanmaTarihi(sonkullanmatarihi);
        urun.setAciklama(aciklama);
        urun.setKategoriID(Integer.parseInt(kategori));
        urun.setMarkaID(Integer.valueOf(markaid));
        urun.setResimYolu(resimyolu);

        int etkilenen = urunDAO.insert(urun);
        if (etkilenen > 0) {
            out.print("bilgiler eklenmistir");
        } else {
            out.print("bilgiler eklenmemistir");
        }
    }

%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Mosaddek">
    <link rel="shortcut icon" href="img/favicon.png">

        <title>Urun Listesi</title>

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

                                    <div class="col-sm-12">
                                        <section class="panel">
                                            <header class="panel-heading">
                                                Kategori Listesi
                                            </header>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>

                                                        <th>ID</th>
                                                        <th>Kategori Adi</th>
                                                        <th>Aciklamasi</th>
                                                        <th>Resim Yolu</th>
                                                        <th>Resim </th>

                                                    </tr>
                                                </thead>
                                                <tbody>


                                                    <%                                                        
                                                        UrunDAO urunDAO = new UrunDAO();

                                                        List<Urun> urunList = urunDAO.urunFullList();

                                                        Iterator<Urun> iterator = urunList.iterator();

                                                        while (iterator.hasNext()) {
                                                            Urun urun = iterator.next();
                                                            out.print("<tr>");
                                                            out.print("<td>");
                                                            out.print(urun.getId());
                                                            out.print("</td>");
                                                            out.print("<td>");
                                                            out.print(urun.getAd());
                                                            out.print("</td>");
                                                            out.print("<td>");
                                                            out.print(urun.getAciklama());
                                                            out.print("</td>");
                                                            out.print("<td>");
                                                            out.print(urun.getAlisFiyati());
                                                            out.print("</td>");
                                                            out.print("<td>");
                                                            out.print(urun.getSatisFiyati());
                                                            out.print("</td>");
                                                            out.print("<td>");
                                                            out.print(urun.getMarkaID());
                                                            out.print("</td>");
                                                            out.print("<td>");
                                                            out.print(urun.getResimYolu());
                                                            out.print("</td>");

                                                            out.print("<td>");
                                                            out.print("<img src=" + urun.getResimYolu() + " width='30'>");
                                                            out.print("</td>");

                                                            out.print("</tr>");

                                                        }

                                                    %>
                                                </tbody>
                                            </table>
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
                    <script src="js/respond.min.js" ></script>

                    <!--common script for all pages-->
                    <script src="js/common-scripts.js"></script>


                    </body>
                    </html>
