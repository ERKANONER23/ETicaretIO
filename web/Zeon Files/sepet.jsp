<%-- 
    Document   : sepet
    Created on : 19.Oca.2020, 23:45:16
    Author     : (DESSAS)
--%>

<%@page import="DataBase.DataTransferObject.Musteri"%>
<%@page import="DataBase.DataAccessObject.MusteriDAO"%>
<%@page import="java.util.List"%>
<%@page import="DataBase.DataTransferObject.Kargo"%>
<%@page import="DataBase.DataAccessObject.KargoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="DataBase.DataAccessObject.UrunDAO"%>
<%@page import="DataBase.DataTransferObject.Urun"%>
<%@page import="java.util.ArrayList"%>
<%

    Cookie cookie[] = request.getCookies();

    ArrayList<Urun> urunList = new ArrayList<>();

    for (Cookie cookie1 : cookie) {
        if (cookie1.getName().indexOf("alinanurunids") >= 0) {

            String alinanurunid = cookie1.getValue();
            int urunid = Integer.valueOf(alinanurunid);
            Urun urun = new UrunDAO().urunByID(urunid);
            urunList.add(urun);
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
        <div class="header-top-info">
            <ul class="header-top-socials">
                <li><a href="#"><i class="icon-160" title="161"></i></a></li>
                <li><a href="#"><i class="icon-138" title="161"></i></a></li>
                <li><a href="#"><i class="icon-106" title="161"></i></a></li>
                <li><a href="#"><i class="icon-169" title="161"></i></a></li>
                <li><a href="#"><i class="icon-163" title="161"></i></a></li>
            </ul>
            Phone: +373 56 65 65
        </div>
        <div class="header-middle-info">

            <div class="col-md-8">
                <ul class="header-middle-account">
                    <li>
                        <%                        String userMail = (String) session.getAttribute("userMail");
                            if (userMail != null) {
                                MusteriDAO musteriDAO = new MusteriDAO();
                                Musteri musteri = musteriDAO.musteriByEposta(userMail);
                                out.print(userMail);
                                out.print("<br>");
                                out.print(musteri.getAd());
                            } else {
                                out.print("giris yapin");
                            }
                        %>
                    </li>
                    <li><a href="checkout.html"><i class="icon-259" title="Checkout"></i> Checkout</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="menu">
            <div class="search-cart">
                <form class="search">
                    <input type="text" class="search-line" placeholder="Search" name="serch" />
                    <input type="submit" value="" class="search-button" />
                </form>
                <div class="cart-all">
                    <i class="icon-19" title="19"></i>$ (234)
                    <div class="inside-cart">
                        <p>2 products in the shopping bag</p>
                        <ul>
                            <li>
                                <div class="inside-cart-image"><img src="images/photos/image-9.jpg" alt="product name" /></div>
                                <button>x</button>
                                <a href="product.html">Stripe boucle</a>
                                <p>Unit price 50$</p>
                                <p>Q-ty: 1</p>
                            </li>
                            <li>
                                <div class="inside-cart-image"><img src="images/photos/image-8.jpg" alt="product name" /></div>
                                <button>x</button>
                                <a href="product.html">Stripe boucle</a>
                                <p>Unit price 75$</p>
                                <p>Q-ty: 2</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="repsonsive-menu"><i class="icon-406" title="406"></i> Menu</div>
            <ul>

                <li><a href="all-urunler.jsp">Tum Urunler</a></li>
                <li><a href="all-products.html">Shop</a></li>



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
        <h2>Shopping cart</h2>

        <div class="shopping-cart">
            <div class="shopping-cart-products">
                <ul class="shopping-product-detail">
                    <li class="shopping-1">Urun Resimi</li>
                    <li class="shopping-2">Urun Adi</li>
                    <li class="shopping-3">Aciklama</li>
                    <li class="shopping-5">Fiyati</li>

                </ul> 
                <%                    Iterator<Urun> iterator = urunList.iterator();
                    while (iterator.hasNext()) {
                        Urun urun = iterator.next();
                %>

                <!-- REPEAT BY PRODUCT -->
                <ul class="shopping-product-detail">
                    <li class="shopping-1">
                        <%
                            out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + urun.getResimYolu() + " />");

                        %>                    
                    </li>
                    <li class="shopping-2">
                        <a href="#"><%=urun.getAd()%></a>

                    </li>
                    <li class="shopping-3">
                        <p><%= urun.getAciklama()%></p>

                    </li>

                    <li class="shopping-5">
                        <%= urun.getSatisFiyati()%> TL
                    </li>

                </ul>
                <!-- REPEAT BY PRODUCT -->


                <%                                        }
                %>


            </div>

            <div class="row">
                <div class="col-md-6">
                    <a href="urunler.jsp" class="button-7">Alışverise Devam Et</a>
                </div>

                <div class="col-md-4">
                    <div class="checkout-total">

                        <form action="siparistamamlama.jsp">

                            <%
                                KargoDAO kargoDAO = new KargoDAO();
                                List<Kargo> kargoList = kargoDAO.kargoFullList();
                                out.print("<select name=\"kargo\">");
                                for (Kargo kargo : kargoList) {

                                    out.print("<option value=\"" + kargo.getId() + "\">");
                                    out.print(kargo.getSirketAdi());
                                    out.print("</option>");

                                }
                                out.print("</select>");
                            %>

                            <button type="submit" class="button-6" >siparisi tamamlama</button>
                        </form>
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
                    <li><a href="#">Register now</a></li>
                    <li><a href="#">Subscribe for newsletter</a></li>
                    <li><a href="#">Checkout</a></li>
                    <li><a href="#">Delivery</a></li>
                    <li><a href="#">Contact us</a></li>
                    <li><a href="#">Faq</a></li>
                    <li><a href="#">Ask us</a></li>
                    <li><a href="#">Our partners</a></li>
                    <li><a href="#">About us</a></li>
                </ul>
            </div>
            <div class="col-md-2 col-xs-6">
                <ul>
                    <li><a href="#">Payments</a></li>
                    <li><a href="#">Size guide</a></li>
                    <li><a href="#">Order tracking</a></li>
                    <li><a href="#">Order history</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="#">Terms & conditions</a></li>
                    <li><a href="#">Security & privacy</a></li>
                </ul>
            </div>
            <div class="col-md-2 col-xs-6">
                <ul class="menu-item">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Categories</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Bolg</a></li>
                    <li><a href="#">About us</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Bag</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <div class="subscription">
                    <div class="subscription-title">Newsletter subscribe</div>
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