<%-- 
    Document   : kayıtol
    Created on : 19.Oca.2020, 14:36:16
    Author     : (DESSAS)
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataBase.DataAccessObject.UrunDAO"%>
<%@page import="DataBase.DataTransferObject.Urun"%>
<%@page import="DataBase.DataAccessObject.MusteriDAO"%>
<%@page import="DataBase.DataTransferObject.Musteri"%>
<%
    String ad = request.getParameter("ad");
    String loginEposta = request.getParameter("login-eposta");
    String mesaj = "bilgileri giriniz";

    if (loginEposta != null) {
        String loginPassword = request.getParameter("login-password");
        MusteriDAO musteriDAO = new MusteriDAO();
        boolean sonuc = musteriDAO.musteriLogin(loginEposta, loginPassword);

        if (sonuc) {
            Musteri musteri = musteriDAO.musteriByEposta(loginEposta);

            session.setAttribute("userMail", loginEposta);
            String don = (String) session.getValue("don");
            if (don != null) {
                response.sendRedirect(don);
            }

            if (musteri.getId() == 1) {
                response.sendRedirect("../../ETicaretIO/template_content/index.jsp");
            } else {
                response.sendRedirect("urunler.jsp");
            }
        } else {
            mesaj = "bilgileri kontrol ediniz";
        }

    }

    if (ad != null) {
        String sifre = request.getParameter("password");
        String sifreTekrar = request.getParameter("password1");
        if (sifre.equals(sifreTekrar)) {
            String soyad = request.getParameter("soyad");
            String email = request.getParameter("email");
            String adres = request.getParameter("adres");
            String telefon = request.getParameter("telefon");

            Musteri musteri = new Musteri(0, ad, soyad, email, telefon, adres, sifre);
            MusteriDAO musteriDAO = new MusteriDAO();
            musteriDAO.insert(musteri);
            mesaj = "Bilgiler kaydedildi giris yapiniz";
            response.sendRedirect("kayitol.jsp");

        } else {
            mesaj = "sifre ve sifre tekrar birbiriyle uyusmuyor";
        }
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
<body>
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

                    <li>
                        <form action="index.jsp">
                            <input type="submit" name="exit" value="Çıkış Yap"></input>
                        </form>
                    </li>

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
                        Urun urun = new UrunDAO().urunByID(urunid);
                        urunList.add(urun);
                        toplam += urun.getSatisFiyati();
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
                        <p>Alışveriş Sepetinde <%=urunList.size()%> ürün bulunmaktadir</p>
                        <ul>
                            <%
                                for (Urun urun : urunList) {
                                    out.print("   <li>");
                            %>
                            <a href="urun.jsp?id=<%=urun.getId()%>"> <%= urun.getAd()%> 

                                <%
                                    out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + urun.getResimYolu() + " />");
                                    out.print("adet fiyati : " + urun.getSatisFiyati() + "<br>");
                                %>

                                <%
                                        out.print("   </li>");
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
    <div class="container">
        <div class="site-title"><div class="site-inside"><span>Çıkış</span></div></div> 
        <div class="row">
            <div class="col-md-6">
                <div class="forms-separation">
                    <div class="login-form-box">
                        <%=mesaj%>
                        <form class="login-form" action="kayitol.jsp">
                            <h3>login now</h3>
                            <p>E-mail</p>
                            <input type="text" name="login-eposta" class="login-line">
                                <p>Password</p>
                                <input type="password" name="login-password" class="login-line">
                                    <input type="submit" value="Login" class="button-6">

                                        </form>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="col-md-6">
                                            <form class="register-form" action="kayitol.jsp">
                                                <h3>Kayit ol <br><%= mesaj%> </h3>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <p>Adınız <span class="neccesary">*</span></p>
                                                        <input type="text" name="ad" class="input-line">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>Soyadınız<span class="neccesary">*</span></p>
                                                        <input type="text" name="soyad" class="input-line">
                                                    </div>
                                                </div>
                                                <p>E-mail e<span class="neccesary">*</span></p>
                                                <input type="text" name="email" class="input-line">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <p>Sıfre <span class="neccesary">*</span></p>
                                                            <input type="password" name="password" class="input-line">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p>Sıfre Tekrar<span class="neccesary">*</span></p>
                                                            <input type="password" name="password1" class="input-line">
                                                        </div>
                                                    </div>
                                                    <p>Address <span class="neccesary">*</span></p>
                                                    <input type="text" name="adres" class="input-line">
                                                        <p>Telegon <span class="neccesary">*</span></p>
                                                        <input type="text" name="telefon" class="input-line">

                                                            <input type="submit"/>

                                                            </form>
                                                            </div>
                                                            <div class="clear"></div>
                                                            <div class="col-md-12">
                                                                <div class="order-title">Siparişleriniz</div>
                                                                <div class="row">
                                                                    <div class="col-md-9">
                                                                        <ul class="checkout-info">
                                                                            <li class="checkout-info-1">Ürün</li>
                                                                            <li class="checkout-info-2">Toplam</li>
                                                                        </ul>

                                                                        <div class="checkout-info-box">
                                                                            <!-- REPEAT PRODUCT -->
                                                                            <ul class="checkout-product">
                                                                                <li class="checkout-product-1">Bisiklet</li>
                                                                                <li class="checkout-product-2">TL 350</li>
                                                                            </ul>
                                                                            <!-- REPEAT PRODUCT -->
                                                                            <ul class="checkout-product">
                                                                                <li class="checkout-product-1">Oyun Konsolu</li>
                                                                                <li class="checkout-product-2">TL 200</li>
                                                                            </ul>

                                                                            <ul class="checkout-product">
                                                                                <li class="checkout-product-1">Oyun DWD</li>
                                                                                <li class="checkout-product-2">TL 3650</li>
                                                                            </ul>


                                                                            <!-- CART DETAILS -->
                                                                            <ul class="checkout-product o-last">
                                                                                <li class="checkout-product-1">Sepet Ara Toplamı</li>
                                                                                <li class="checkout-product-2">TL 4200</li>
                                                                            </ul>
                                                                            <ul class="checkout-product o-last">
                                                                                <li class="checkout-product-1">Kargo</li>
                                                                                <li class="checkout-product-2">Ücretsiz Kargo</li>
                                                                            </ul>
                                                                            <ul class="checkout-product last">
                                                                                <li class="checkout-product-1">Diğer Toplam</li>
                                                                                <li class="checkout-product-2">TL 4200</li>
                                                                            </ul>
                                                                            <!-- CART DETAILS -->
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <ul class="payment-method">
                                                                            <li><label><input type="radio" id="payment_method_bacs" class="input-radio" name="payment_method" value="bacs" checked="checked"> Banka Havalesi</label></li>
                                                                            <li><label><input type="radio" id="payment_method_cheque" class="input-radio" name="payment_method" value="cheque"> Kapıda Ödeme</label></li>
                                                                            <li><label><input type="radio" id="payment_method_paypal" class="input-radio" name="payment_method" value="paypal"> Kredi Kartları</label></li>
                                                                        </ul>
                                                                        <a href="#" class="button-6">Sipariş Vermek</a>
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