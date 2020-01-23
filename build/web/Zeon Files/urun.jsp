<%-- 
    Document   : urun
    Created on : 19.Oca.2020, 23:04:46
    Author     : (DESSAS)
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataBase.DataAccessObject.UrunDAO"%>
<%@page import="DataBase.DataTransferObject.Urun"%>
<%

    String urunID = request.getParameter("id");
    String satilanurunid = request.getParameter("satilanurunid");
    Urun urun = null;
    if (satilanurunid != null) {
        satilanurunid = satilanurunid.trim();

        UrunDAO urunDAO = new UrunDAO();
        int id = Integer.valueOf(satilanurunid);
        urun = urunDAO.urunByID(id);

        Cookie cookieAlinanUrunler = new Cookie("alinanurunids" + id, satilanurunid);
        cookieAlinanUrunler.setMaxAge(10000);

        response.addCookie(cookieAlinanUrunler);
        out.print("cookie eklendi");
        out.print(cookieAlinanUrunler.getName());

    }

    if (urunID == null && satilanurunid == null) {
        response.sendRedirect("urunler.jsp");
    } else if (urunID != null) {
        urunID = urunID.trim();

        UrunDAO urunDAO = new UrunDAO();
        int id = Integer.valueOf(urunID);
        urun = urunDAO.urunByID(id);

    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
    <title>Zeon</title>
    <meta name="description" content="Here goes description" />
    <meta name="author" content="author name" />
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <!-- ======================================================================
                                Mobile Specific Meta
    ======================================================================= -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!-- ======================================================================
                                Style CSS + Google Fonts
    ======================================================================= 
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400italic,700italic,400,600,700,800" rel="stylesheet" type="text/css"> -->
    <link rel="stylesheet" href="css/bootstrap.css" />    
    <link rel="stylesheet" href="css/style.css" />
</head>
<body class="home-blog-show">
<div class="modal fade" id="write-review" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-review">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>Write a review</h3>
            <form>
                <p>Name</p>
                <input class="input-line" name="author" type="text">
                    <p>Website</p>
                    <input class="input-line" name="author" type="text">

                        <p>Your review</p>
                        <textarea class="text-area" name="comment"></textarea>
                        <a href="#" class="button-6">Write a review</a>
                        </form>
                        </div>
                        </div>
                        </div>

                        <!-- ======================================================================
                                                        START SCRIPTS
                        ======================================================================= -->
                        <div class="header">
                            <div class="container">

                                <div class="header-middle-info">
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-8">
                                        <ul class="header-middle-account">

                                            <%                        String userMail = (String) session.getAttribute("userMail");
                                                if (userMail == null) {
                                                    out.print("<li><a href=\"kayitol.jsp\"><i class=\"icon-351\" title=\"Login\"></i> Giriş Yap</a></li>");
                                                } else {
                                                    out.print("<li>");
                                                    out.print(userMail);
                                                    out.print("</li>");
                                                }

                                            %>


                                            <li><a href="sepet.jsp"><i class="icon-259" title="Checkout"></i> Sepet</a></li>
                                        </ul>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="menu">

                                    <%                Cookie cookie[] = request.getCookies();

                                        ArrayList<Urun> urunList = new ArrayList<>();
                                        double toplam = 0;

                                        for (Cookie cookie1 : cookie) {
                                            if (cookie1.getName().indexOf("alinanurunids") >= 0) {

                                                String alinanurunid = cookie1.getValue();
                                                int urunid = Integer.valueOf(alinanurunid);
                                                Urun siradakiUrun = new UrunDAO().urunByID(urunid);
                                                urunList.add(siradakiUrun);
                                                toplam += siradakiUrun.getSatisFiyati();
                                            }
                                        }

                                    %>

                                    <div class="search-cart">
                                        <form class="search">
                                            <input type="text" class="search-line" placeholder="Arama" name="serch" />
                                            <input type="submit" value="" class="search-button" />
                                        </form>
                                        <div class="cart-all">
                                            <i class="icon-19" title="19"></i>Sepetteki Urunler Toplami <%=toplam%>
                                            <div class="inside-cart">
                                                <p>Alışveriş Sepetinde 2 ürün</p>
                                                <ul>
                                                    <%
                                                        for (Urun sepette : urunList) {
                                                            out.print("   <li>");
                                                    %>
                                                    <a href="urun.jsp?id=<%=sepette.getId()%>"> <%= sepette.getAd()%> 

                                                        <%
                                                            out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + sepette.getResimYolu() + " />");
                                                            out.print("adet fiyati : " + urun.getSatisFiyati() + "<br>");
                                                        %>

                                                        <%                                        out.print("   </li>");
                                                            }

                                                        %>




                                                </ul>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="repsonsive-menu"><i class="icon-406" title="406"></i> Menu</div>
                                    <ul>
                                        <li class="menu-item-has-children"><a href="index.jsp">Anasayfa</a>

                                        </li>

                                        <li class="active"><a href="urunler.jsp">Tum Urunler</a></li>



                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </div>
                        <!-- ======================================================================
                                                        END HEADER
                        ======================================================================= --> 

                        <!-- ======================================================================
                                                        START CONTENT
                        ======================================================================= -->
                        <div class="content">
                            <div class="product-one">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="the-slider product-big-image" data-tesla-plugin="slider" data-tesla-item=".slide" data-tesla-next=".product-image-arrows-right" data-tesla-prev=".product-image-arrows-left" data-tesla-container=".slide-wrapper">
                                                <ul class="product-image-arrows">
                                                    <li class="product-image-arrows-left"><i class="icon-517" title="left"></i></li>
                                                    <li class="product-image-arrows-right"><i class="icon-501" title="right"></i></li>
                                                </ul>
                                                <ul class="slide-wrapper">
                                                    <li class="slide">
                                                        <%                                                            out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + urun.getResimYolu() + " />");

                                                        %>

                                                    </li>

                                                </ul>
                                                <div class="row">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <h2>
                                                <%= urun.getAd()%>
                                            </h2>

                                            <div class="clear"></div>
                                            <div class="quantity">
                                                <input type="button" value="-" class="minus">
                                                    <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="input-text qty text">
                                                        <input type="button" value="+" class="plus">

                                                            </div>
                                                            <hr/>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="product-price">Fiyat :  <%= urun.getSatisFiyati()%></div>
                                                                </div>
                                                                <div class="col-md-6">

                                                                    <a href="urun.jsp?id=<%=urun.getId()%>&satilanurunid=<%=urun.getId()%>" class="button-2"> Sepete Ekle </a>
                                                                </div>
                                                            </div>
                                                            <ul class="nav nav-tabs">
                                                                <li class="active"><a href="#description" data-toggle="tab">Ürün açıklaması</a></li>

                                                            </ul>
                                                            <div class="tab-content">
                                                                <div class="tab-pane active" id="description">
                                                                    <h1>

                                                                        <%= urun.getAciklama()%>

                                                                    </h1>

                                                                    <ul class="social-share">
                                                                        <li><span>Paylaş</span></li>
                                                                        <li><a href="#"><i class="icon-160" title="161"></i></a></li>
                                                                        <li><a href="#"><i class="icon-138" title="161"></i></a></li>
                                                                        <li><a href="#"><i class="icon-106" title="161"></i></a></li>
                                                                        <li><a href="#"><i class="icon-169" title="161"></i></a></li>
                                                                        <li><a href="#"><i class="icon-163" title="161"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                                <div class="tab-pane" id="reviews">
                                                                    <div class="product-review">
                                                                        <div class="product-review-avatar">
                                                                            <img src="images/elements/testimonial-avatar.jpg" alt="avatar" />
                                                                        </div>
                                                                        <div class="product-review-author">Jane Doe <span>12 Jan</span></div>
                                                                        <p>I like the item very much, it is so on my size and it looks great.</p>
                                                                    </div>

                                                                    <div class="product-review">
                                                                        <div class="product-review-avatar">
                                                                            <img src="images/elements/testimonial-avatar.jpg" alt="avatar" />
                                                                        </div>
                                                                        <div class="product-review-author">Jane Doe <span>10 Jan</span></div>
                                                                        <p>It is so on my size, i like the item very much, it is so on my size and it looks great i like it a lot It is so on my size, i like the item very much, it is so on my size and it looks great.</p>
                                                                    </div>
                                                                    <a href="#" class="button-6" data-toggle="modal" data-target="#write-review">Write a review</a>
                                                                </div>
                                                            </div> 
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>

                                                            <div class="container">
                                                                <div class="tesla-carousel" data-tesla-plugin="carousel" data-tesla-container=".tesla-carousel-items" data-tesla-item=">div" data-tesla-autoplay="false" data-tesla-rotate="false">

                                                                    <div class="row">
                                                                        <div class="tesla-carousel" data-tesla-plugin="carousel" data-tesla-container=".tesla-carousel-items" data-tesla-item=">div" data-tesla-autoplay="false" data-tesla-rotate="false">
                                                                            <div class="site-title">
                                                                                <ul class="wrapper-arrows">
                                                                                    <li><i class="icon-517 prev" title="left arrow"></i></li>
                                                                                    <li><i class="icon-501 next" title="right arrow"></i></li>
                                                                                </ul>
                                                                                <div class="site-inside"><span>Featured Products</span></div></div> 
                                                                            <div class="row">
                                                                                <div class="tesla-carousel-items">


                                                                                    <%
                                                                                        UrunDAO urunDAO = new UrunDAO();
                                                                                        List<Urun> sonUrunler = urunDAO.sonEklenenUrunler();
                                                                                        for (Urun siradaki : sonUrunler) {
                                                                                    %>

                                                                                    <div class="col-md-3 col-xs-6">
                                                                                        <div class="product">
                                                                                            <div class="product-cover">
                                                                                                <div class="product-cover-hover"><span> <a href="urun.jsp?id=<%=siradaki.getId()%>"> <%= siradaki.getAd()%> </span></div>


                                                                                                <%

                                                                                                    out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + siradaki.getResimYolu() + " />");


                                                                                                %>
                                                                                            </div> 


                                                                                            <div class="product-details">  

                                                                                                <h1> <a href="urun.jsp?id=<%=siradaki.getId()%>"> <%= siradaki.getAd()%> </h1>

                                                                                                <p><%=siradaki.getAciklama()%></p>
                                                                                                <div class="product-price">

                                                                                                    <%= siradaki.getSatisFiyati()%>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <%
                                                                                        }
                                                                                    %>








                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            </div>
                                                            <!-- ======================================================================
                                                                                            END CONTENT
                                                            ======================================================================= -->

                                                            <!-- ======================================================================
                                                                                            START FOOTER
                                                            ======================================================================= -->
                                                            <div class="footer">
                                                                <div class="container">
                                                                    <div class="row">
                                                                        <div class="col-md-2 col-xs-6">
                                                                            <ul class="socials">
                                                                                <li><a href="#"><img src="images/elements/socials/facebook.png" alt="facebook"/>Facebook</a></li>
                                                                                <li><a href="#"><img src="images/elements/socials/twitter.png" alt="twitter"/>Twitter</a></li>
                                                                                <li><a href="#"><img src="images/elements/socials/youtube.png" alt="youtube"/>Youtube</a></li>
                                                                                <li><a href="#"><img src="images/elements/socials/googleplus.png" alt="google"/>Google+</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="col-md-2 col-xs-6">
                                                                            <ul>
                                                                                <li><a href="#">Şimdi Kaydol</a></li>
                                                                                <li><a href="#">Bültene abone olun</a></li>
                                                                                <li><a href="#">Sipariş</a></li>
                                                                                <li><a href="#">Teslim</a></li>
                                                                                <li><a href="#">İletişim</a></li>
                                                                                <li><a href="#">Faq</a></li>
                                                                                <li><a href="#">Sorular</a></li>
                                                                                <li><a href="#">İş ortaklarımız</a></li>
                                                                                <li><a href="#">Hakkımızda</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="col-md-2 col-xs-6">
                                                                            <ul>
                                                                                <li><a href="#">Ödemeler</a></li>
                                                                                <li><a href="#">Rehber</a></li>
                                                                                <li><a href="#">Sipariş izleme</a></li>
                                                                                <li><a href="#">Sipariş Geçmişi</a></li>
                                                                                <li><a href="#">İadeler</a></li>
                                                                                <li><a href="#">Şartlar ve koşullar</a></li>
                                                                                <li><a href="#">Güvenlik</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="col-md-2 col-xs-6">
                                                                            <ul class="menu-item">
                                                                                <li><a href="#">Anasayfa</a></li>
                                                                                <li><a href="#">Kategoriler</a></li>
                                                                                <li><a href="#">Alışveriş</a></li>
                                                                                <li><a href="#">Bolg</a></li>
                                                                                <li><a href="#">Hakkımızda</a></li>
                                                                                <li><a href="#">Hizmetler</a></li>
                                                                                <li><a href="#">Sepet</a></li>
                                                                                <li><a href="#">İletişim</a></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="subscription">
                                                                                <div class="subscription-title">Bülten abone ol</div>
                                                                                <form class="subscription" id="newsletter" method="post">
                                                                                    <input type="text" name="newsletter-name" placeholder="Name" class="subscription-line">
                                                                                        <input type="text" name="newsletter-email" placeholder="E-mail" class="subscription-line">
                                                                                            <input type="submit" value="send" class="button-5">
                                                                                                </form>
                                                                                                </div>
                                                                                                </div>
                                                                                                </div>
                                                                                                </div>
                                                                                                <div class="container">
                                                                                                    <div class="mini-footer">
                                                                                                        <div class="row">
                                                                                                            <div class="col-md-6">
                                                                                                                Copyright 2013 ZEON &nbsp;  &nbsp;  &nbsp; Designed by <a href="http://www.teslathemes.com">Teslathemes</a>
                                                                                                            </div>
                                                                                                            <div class="col-md-6">
                                                                                                                <div class="text-right">
                                                                                                                    <img src="images/elements/payment.png" alt="payment systems" />
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                </div>
                                                                                                <!-- ======================================================================
                                                                                                                                END FOOTER
                                                                                                ======================================================================= -->

                                                                                                <!-- ======================================================================
                                                                                                                                START SCRIPTS
                                                                                                ======================================================================= -->
                                                                                                <script src="js/modernizr.custom.63321.js" type="text/javascript"></script>
                                                                                                <script src="js/jquery-1.10.0.min.js" type="text/javascript"></script>
                                                                                                <script src="js/jquery-ui.min.js" type="text/javascript"></script>
                                                                                                <script src="js/bootstrap.js" type="text/javascript"></script>
                                                                                                <script src="js/placeholder.js" type="text/javascript"></script>
                                                                                                <script src="js/imagesloaded.pkgd.min.js" type="text/javascript"></script>
                                                                                                <script src="js/masonry.pkgd.min.js" type="text/javascript"></script>
                                                                                                <script src="js/jquery.swipebox.min.js" type="text/javascript"></script>
                                                                                                <script src="js/farbtastic/farbtastic.js" type="text/javascript"></script>
                                                                                                <script src="js/options.js" type="text/javascript"></script>
                                                                                                <script src="js/plugins.js" type="text/javascript"></script>
                                                                                                <!--[if lt IE 9]>
                                                                                                  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                                                                                                  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
                                                                                                <![endif]-->
                                                                                                <!-- ======================================================================
                                                                                                                                END SCRIPTS
                                                                                                ======================================================================= -->
                                                                                                </body>
                                                                                                </html>