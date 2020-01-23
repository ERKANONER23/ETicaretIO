
<%@page import="DataBase.DataAccessObject.SatisDAO"%>
<%@page import="DataBase.DataAccessObject.SatisUrunDAO"%>
<%@page import="DataBase.DataTransferObject.SatisUrun"%>
<%@page import="java.util.Date"%>
<%@page import="DataBase.DataTransferObject.Satis"%>
<%@page import="DataBase.DataAccessObject.MusteriDAO"%>
<%@page import="DataBase.DataTransferObject.Musteri"%>
<%@page import="DataBase.DataAccessObject.UrunDAO"%>
<%@page import="DataBase.DataTransferObject.Urun"%>
<%@page import="java.util.ArrayList"%>


<%

    String userMail = (String) session.getAttribute("userMail");
    ArrayList<Urun> urunList = new ArrayList<>();
    String kargoIDno = request.getParameter("kargo");

    if (userMail != null) {
        Cookie cookie[] = request.getCookies();

        for (Cookie cookie1 : cookie) {
            if (cookie1.getName().indexOf("alinanurunids") >= 0) {

                String alinanurunid = cookie1.getValue();
                int urunid = Integer.valueOf(alinanurunid);
                Urun urun = new UrunDAO().urunByID(urunid);
                urunList.add(urun);

            }
        }

    } else {
        session.setAttribute("don", "siparistamamlama.jsp");
        response.sendRedirect("kayitol.jsp");
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

                    <%                        if (userMail == null) {
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

                //ArrayList<Urun> urunList = new ArrayList<>();
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

        <div class="row">

            <div class="col-md-12">
                <div class="order-title">
                    Satin Alinan Ürünler</div>
                <div class="row">
                    <div class="col-md-9">
                        <ul class="checkout-info">
                            <li class="checkout-info-1">Ürün</li>
                            <li class="checkout-info-2">Fiyat</li>
                        </ul>

                        <div class="checkout-info-box">

                            <%                                
                                MusteriDAO musteriDAO = new MusteriDAO();

                                Musteri musteri = musteriDAO.musteriByEposta((String) session.getAttribute("userMail"));
                                if (musteri == null) {
                                    out.print("musteri null");
                                } else {
                                    String gun = new Date().toString();

                                    for (Urun urun : urunList) {

                                        toplam += urun.getSatisFiyati();
                                    }
                                    int idno = Integer.valueOf(kargoIDno);
                                    Satis satis = new Satis(0, musteri.getId(), gun, toplam, "", idno);
                                    SatisDAO satisDAO = new SatisDAO();
                                    satisDAO.insert(satis);

                                    for (Urun urun : urunList) {
                                        out.print("   <ul class=\"checkout-product o-last\">");
                                        out.print("<li class=\"checkout-product-1\">");
                                        out.print(urun.getAd());

                                        out.print("</li>");
                                        out.print("  <li class=\"checkout-product-2\">");
                                        out.print(urun.getSatisFiyati());
                                        out.print("</li>");
                                        out.print(" </ul>");
                                        out.print("<br>");

                                        SatisUrunDAO satisUrunDAO = new SatisUrunDAO();
                                        int satisID = satisDAO.sayisIDBySatisTarihi(satis.getSatistarihi());
                                        SatisUrun satisUrun = new SatisUrun(0, satisID, urun.getId());
                                        satisUrunDAO.insert(satisUrun);

                                    }

                                }

                            %>

                            <ul class="checkout-product">
                                <li class="checkout-product-1">Toplam</li>
                                <li class="checkout-product-2"><%= toplam%></li>
                            </ul>

                            <!-- CART DETAILS -->
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
                                <input type="submit" value="Gonder" class="button-5">
                                    </form>
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