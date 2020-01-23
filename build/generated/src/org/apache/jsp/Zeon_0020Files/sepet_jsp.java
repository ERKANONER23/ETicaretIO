package org.apache.jsp.Zeon_0020Files;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DataBase.DataTransferObject.Musteri;
import DataBase.DataAccessObject.MusteriDAO;
import java.util.List;
import DataBase.DataTransferObject.Kargo;
import DataBase.DataAccessObject.KargoDAO;
import java.util.Iterator;
import DataBase.DataAccessObject.UrunDAO;
import DataBase.DataTransferObject.Urun;
import java.util.ArrayList;

public final class sepet_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


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


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("    <title>Zeon</title>\n");
      out.write("    <meta name=\"description\" content=\"Here goes description\" />\n");
      out.write("    <meta name=\"author\" content=\"author name\" />\n");
      out.write("    <link rel=\"shortcut icon\" href=\"images/favicon.ico\" type=\"image/x-icon\" />\n");
      out.write("    <!-- ======================================================================\n");
      out.write("                                Mobile Specific Meta\n");
      out.write("    ======================================================================= -->\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\" />\n");
      out.write("    <!-- ======================================================================\n");
      out.write("                                Style CSS + Google Fonts\n");
      out.write("    ======================================================================= \n");
      out.write("    <link href=\"http://fonts.googleapis.com/css?family=Open+Sans:300,400italic,700italic,400,600,700,800\" rel=\"stylesheet\" type=\"text/css\"> -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.css\" />    \n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\" />\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <!-- ======================================================================\n");
      out.write("                                    START SCRIPTS\n");
      out.write("    ======================================================================= -->\n");
      out.write("<div class=\"header\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"header-top-info\">\n");
      out.write("            <ul class=\"header-top-socials\">\n");
      out.write("                <li><a href=\"#\"><i class=\"icon-160\" title=\"161\"></i></a></li>\n");
      out.write("                <li><a href=\"#\"><i class=\"icon-138\" title=\"161\"></i></a></li>\n");
      out.write("                <li><a href=\"#\"><i class=\"icon-106\" title=\"161\"></i></a></li>\n");
      out.write("                <li><a href=\"#\"><i class=\"icon-169\" title=\"161\"></i></a></li>\n");
      out.write("                <li><a href=\"#\"><i class=\"icon-163\" title=\"161\"></i></a></li>\n");
      out.write("            </ul>\n");
      out.write("            Phone: +373 56 65 65\n");
      out.write("        </div>\n");
      out.write("        <div class=\"header-middle-info\">\n");
      out.write("\n");
      out.write("            <div class=\"col-md-8\">\n");
      out.write("                <ul class=\"header-middle-account\">\n");
      out.write("                    <li>\n");
      out.write("                        ");
                        String userMail = (String) session.getAttribute("userMail");
                            if (userMail != null) {
                                MusteriDAO musteriDAO = new MusteriDAO();
                                Musteri musteri = musteriDAO.musteriByEposta(userMail);
                                out.print(userMail);
                                out.print("<br>");
                                out.print(musteri.getAd());
                            } else {
                                out.print("giris yapin");
                            }
                        
      out.write("\n");
      out.write("                    </li>\n");
      out.write("                    <li><a href=\"checkout.html\"><i class=\"icon-259\" title=\"Checkout\"></i> Checkout</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"clear\"></div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"menu\">\n");
      out.write("            <div class=\"search-cart\">\n");
      out.write("                <form class=\"search\">\n");
      out.write("                    <input type=\"text\" class=\"search-line\" placeholder=\"Search\" name=\"serch\" />\n");
      out.write("                    <input type=\"submit\" value=\"\" class=\"search-button\" />\n");
      out.write("                </form>\n");
      out.write("                <div class=\"cart-all\">\n");
      out.write("                    <i class=\"icon-19\" title=\"19\"></i>$ (234)\n");
      out.write("                    <div class=\"inside-cart\">\n");
      out.write("                        <p>2 products in the shopping bag</p>\n");
      out.write("                        <ul>\n");
      out.write("                            <li>\n");
      out.write("                                <div class=\"inside-cart-image\"><img src=\"images/photos/image-9.jpg\" alt=\"product name\" /></div>\n");
      out.write("                                <button>x</button>\n");
      out.write("                                <a href=\"product.html\">Stripe boucle</a>\n");
      out.write("                                <p>Unit price 50$</p>\n");
      out.write("                                <p>Q-ty: 1</p>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <div class=\"inside-cart-image\"><img src=\"images/photos/image-8.jpg\" alt=\"product name\" /></div>\n");
      out.write("                                <button>x</button>\n");
      out.write("                                <a href=\"product.html\">Stripe boucle</a>\n");
      out.write("                                <p>Unit price 75$</p>\n");
      out.write("                                <p>Q-ty: 2</p>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"clear\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"repsonsive-menu\"><i class=\"icon-406\" title=\"406\"></i> Menu</div>\n");
      out.write("            <ul>\n");
      out.write("\n");
      out.write("                <li><a href=\"all-urunler.jsp\">Tum Urunler</a></li>\n");
      out.write("                <li><a href=\"all-products.html\">Shop</a></li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("            <div class=\"clear\"></div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- ======================================================================\n");
      out.write("                                END HEADER\n");
      out.write("======================================================================= -->  \n");
      out.write("\n");
      out.write("<!-- ======================================================================\n");
      out.write("                                START CONTENT\n");
      out.write("======================================================================= -->\n");
      out.write("<div class=\"content\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h2>Shopping cart</h2>\n");
      out.write("\n");
      out.write("        <div class=\"shopping-cart\">\n");
      out.write("            <div class=\"shopping-cart-products\">\n");
      out.write("                <ul class=\"shopping-product-detail\">\n");
      out.write("                    <li class=\"shopping-1\">Urun Resimi</li>\n");
      out.write("                    <li class=\"shopping-2\">Urun Adi</li>\n");
      out.write("                    <li class=\"shopping-3\">Aciklama</li>\n");
      out.write("                    <li class=\"shopping-5\">Fiyati</li>\n");
      out.write("\n");
      out.write("                </ul> \n");
      out.write("                ");
                    Iterator<Urun> iterator = urunList.iterator();
                    while (iterator.hasNext()) {
                        Urun urun = iterator.next();
                
      out.write("\n");
      out.write("\n");
      out.write("                <!-- REPEAT BY PRODUCT -->\n");
      out.write("                <ul class=\"shopping-product-detail\">\n");
      out.write("                    <li class=\"shopping-1\">\n");
      out.write("                        ");

                            out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + urun.getResimYolu() + " />");

                        
      out.write("                    \n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"shopping-2\">\n");
      out.write("                        <a href=\"#\">");
      out.print(urun.getAd());
      out.write("</a>\n");
      out.write("\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"shopping-3\">\n");
      out.write("                        <p>");
      out.print( urun.getAciklama());
      out.write("</p>\n");
      out.write("\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li class=\"shopping-5\">\n");
      out.write("                        ");
      out.print( urun.getSatisFiyati());
      out.write(" TL\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("                <!-- REPEAT BY PRODUCT -->\n");
      out.write("\n");
      out.write("\n");
      out.write("                ");
                                        }
                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-6\">\n");
      out.write("                    <a href=\"urunler.jsp\" class=\"button-7\">Alışverise Devam Et</a>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                    <div class=\"checkout-total\">\n");
      out.write("\n");
      out.write("                        <form action=\"siparistamamlama.jsp\">\n");
      out.write("\n");
      out.write("                            ");

                                KargoDAO kargoDAO = new KargoDAO();
                                List<Kargo> kargoList = kargoDAO.kargoFullList();
                                out.print("<select name=\"kargo\">");
                                for (Kargo kargo : kargoList) {

                                    out.print("<option value=\"" + kargo.getId() + "\">");
                                    out.print(kargo.getSirketAdi());
                                    out.print("</option>");

                                }
                                out.print("</select>");
                            
      out.write("\n");
      out.write("\n");
      out.write("                            <button type=\"submit\" class=\"button-6\" >siparisi tamamlama</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>  \n");
      out.write("        </div>             \n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- ======================================================================\n");
      out.write("                                END CONTENT\n");
      out.write("======================================================================= -->\n");
      out.write("\n");
      out.write("<!-- ======================================================================\n");
      out.write("                                START FOOTER\n");
      out.write("======================================================================= -->\n");
      out.write("<div class=\"footer\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-2 col-xs-6\">\n");
      out.write("                <ul class=\"socials\">\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/elements/socials/facebook.png\" alt=\"facebook\"/>Facebook</a></li>\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/elements/socials/twitter.png\" alt=\"twitter\"/>Twitter</a></li>\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/elements/socials/youtube.png\" alt=\"youtube\"/>Youtube</a></li>\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/elements/socials/googleplus.png\" alt=\"google\"/>Google+</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-2 col-xs-6\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"#\">Register now</a></li>\n");
      out.write("                    <li><a href=\"#\">Subscribe for newsletter</a></li>\n");
      out.write("                    <li><a href=\"#\">Checkout</a></li>\n");
      out.write("                    <li><a href=\"#\">Delivery</a></li>\n");
      out.write("                    <li><a href=\"#\">Contact us</a></li>\n");
      out.write("                    <li><a href=\"#\">Faq</a></li>\n");
      out.write("                    <li><a href=\"#\">Ask us</a></li>\n");
      out.write("                    <li><a href=\"#\">Our partners</a></li>\n");
      out.write("                    <li><a href=\"#\">About us</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-2 col-xs-6\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"#\">Payments</a></li>\n");
      out.write("                    <li><a href=\"#\">Size guide</a></li>\n");
      out.write("                    <li><a href=\"#\">Order tracking</a></li>\n");
      out.write("                    <li><a href=\"#\">Order history</a></li>\n");
      out.write("                    <li><a href=\"#\">Returns</a></li>\n");
      out.write("                    <li><a href=\"#\">Terms & conditions</a></li>\n");
      out.write("                    <li><a href=\"#\">Security & privacy</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-2 col-xs-6\">\n");
      out.write("                <ul class=\"menu-item\">\n");
      out.write("                    <li><a href=\"#\">Home</a></li>\n");
      out.write("                    <li><a href=\"#\">Categories</a></li>\n");
      out.write("                    <li><a href=\"#\">Shop</a></li>\n");
      out.write("                    <li><a href=\"#\">Bolg</a></li>\n");
      out.write("                    <li><a href=\"#\">About us</a></li>\n");
      out.write("                    <li><a href=\"#\">Services</a></li>\n");
      out.write("                    <li><a href=\"#\">Bag</a></li>\n");
      out.write("                    <li><a href=\"#\">Contact</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"subscription\">\n");
      out.write("                    <div class=\"subscription-title\">Newsletter subscribe</div>\n");
      out.write("                    <form class=\"subscription\" id=\"newsletter\" method=\"post\">\n");
      out.write("                        <input type=\"text\" name=\"newsletter-name\" placeholder=\"Name\" class=\"subscription-line\">\n");
      out.write("                            <input type=\"text\" name=\"newsletter-email\" placeholder=\"E-mail\" class=\"subscription-line\">\n");
      out.write("                                <input type=\"submit\" value=\"send\" class=\"button-5\">\n");
      out.write("                                    </form>\n");
      out.write("                                    </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"container\">\n");
      out.write("                                        <div class=\"mini-footer\">\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col-md-6\">\n");
      out.write("                                                    Copyright 2013 ZEON &nbsp;  &nbsp;  &nbsp; Designed by <a href=\"http://www.teslathemes.com\">Teslathemes</a>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-md-6\">\n");
      out.write("                                                    <div class=\"text-right\">\n");
      out.write("                                                        <img src=\"images/elements/payment.png\" alt=\"payment systems\" />\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- ======================================================================\n");
      out.write("                                                                    END FOOTER\n");
      out.write("                                    ======================================================================= -->\n");
      out.write("\n");
      out.write("                                    <!-- ======================================================================\n");
      out.write("                                                                    START SCRIPTS\n");
      out.write("                                    ======================================================================= -->\n");
      out.write("                                    <script src=\"js/modernizr.custom.63321.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/jquery-1.10.0.min.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/jquery-ui.min.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/placeholder.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/imagesloaded.pkgd.min.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/masonry.pkgd.min.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/jquery.swipebox.min.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/farbtastic/farbtastic.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/options.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <script src=\"js/plugins.js\" type=\"text/javascript\"></script>\n");
      out.write("                                    <!--[if lt IE 9]>\n");
      out.write("                                      <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\n");
      out.write("                                      <script src=\"https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js\"></script>\n");
      out.write("                                    <![endif]-->\n");
      out.write("                                    <!-- ======================================================================\n");
      out.write("                                                                    END SCRIPTS\n");
      out.write("                                    ======================================================================= -->\n");
      out.write("                                    </body>\n");
      out.write("\n");
      out.write("                                    </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
