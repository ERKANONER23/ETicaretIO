package org.apache.jsp.Zeon_0020Files;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import DataBase.DataTransferObject.Kategori;
import DataBase.DataAccessObject.KartegoriDAO;
import DataBase.DataTransferObject.Urun;
import java.util.List;
import DataBase.DataAccessObject.UrunDAO;
import java.util.Iterator;

public final class urunler_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    UrunDAO urunDAO = new UrunDAO();

    String kategoriID = request.getParameter("kategoriid");
    Iterator<Urun> iterator = null;
    if (kategoriID == null) {

        List<Urun> urunList = urunDAO.urunFullList();

        iterator = urunList.iterator();

    } else {
        int id = Integer.valueOf(kategoriID);
        List<Urun> urunList = urunDAO.urunByKategoriID(id);

        iterator = urunList.iterator();
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
      out.write("<body class=\"home-blog-show\">\n");
      out.write("    <!-- ======================================================================\n");
      out.write("                                    START SCRIPTS\n");
      out.write("    ======================================================================= -->\n");
      out.write("<div class=\"header\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("\n");
      out.write("        <div class=\"header-middle-info\">\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-8\">\n");
      out.write("                <ul class=\"header-middle-account\">\n");
      out.write("\n");
      out.write("                    ");
                        String userMail = (String) session.getAttribute("userMail");
                        if (userMail == null) {
                            out.print("<li><a href=\"kayitol.jsp\"><i class=\"icon-351\" title=\"Login\"></i> Giriş Yap</a></li>");
                        } else {
                            out.print("<li>");
                            out.print(userMail);
                            out.print("</li>");
                        }

                    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <li><a href=\"sepet.jsp\"><i class=\"icon-259\" title=\"Checkout\"></i> Sepet</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"clear\"></div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"menu\">\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");
                
                Cookie cookie[] = request.getCookies();

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

            
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"search-cart\">\n");
      out.write("                <form class=\"search\">\n");
      out.write("                    <input type=\"text\" class=\"search-line\" placeholder=\"Arama\" name=\"serch\" />\n");
      out.write("                    <input type=\"submit\" value=\"\" class=\"search-button\" />\n");
      out.write("                </form>\n");
      out.write("                <div class=\"cart-all\">\n");
      out.write("                    <i class=\"icon-19\" title=\"19\"></i>Sepetteki Urunler Toplami ");
      out.print(toplam);
      out.write("\n");
      out.write("                    <div class=\"inside-cart\">\n");
      out.write("                        <p>Alışveriş Sepetinde ");
      out.print(urunList.size());
      out.write(" ürün bulunmaktadir</p>\n");
      out.write("                        <ul>\n");
      out.write("                            ");

                                for (Urun urun : urunList) {
                                    out.print("   <li>");
                            
      out.write("\n");
      out.write("                            <a href=\"urun.jsp?id=");
      out.print(urun.getId());
      out.write("\"> ");
      out.print( urun.getAd());
      out.write(" \n");
      out.write("\n");
      out.write("                                ");

                                    out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + urun.getResimYolu() + " />");
                                    out.print("adet fiyati : " + urun.getSatisFiyati() + "<br>");
                                
      out.write("\n");
      out.write("\n");
      out.write("                                ");

                                        out.print("   </li>");
                                    }

                                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"clear\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"repsonsive-menu\"><i class=\"icon-406\" title=\"406\"></i> Menu</div>\n");
      out.write("            <ul>\n");
      out.write("                <li class=\"menu-item-has-children\"><a href=\"index.jsp\">Anasayfa</a>\n");
      out.write("\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                <li class=\"active\"><a href=\"urunler.jsp\">Tum Urunler</a></li>\n");
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
      out.write("\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-3\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-12 col-xs-6\">\n");
      out.write("                        <div class=\"products-dropdown open-dropdown\">\n");
      out.write("                            <span><i class=\"icon-515\" title=\"515\"></i>Kategoriler</span>\n");
      out.write("\n");
      out.write("                            <ul>\n");
      out.write("\n");
      out.write("                                <li><a href=\"urunler.jsp\">Tum Urunler </a></li>\n");
      out.write("                                    ");
                                    KartegoriDAO kartegoriDAO = new KartegoriDAO();
                                        List<Kategori> kategoriList = kartegoriDAO.kategoriFullList();
                                        Iterator<Kategori> kategoriler = kategoriList.iterator();
                                        while (kategoriler.hasNext()) {
                                            Kategori kategori = kategoriler.next();
                                            out.print(" <li><a href=urunler.jsp?kategoriid=" + kategori.getId() + ">" + kategori.getAd() + " </a></li>");
                                        }

                                    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"clear\"></div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-md-9\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    ");
                        while (iterator.hasNext()) {
                            Urun urun = iterator.next();
                    
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"col-md-4 col-xs-6\">\n");
      out.write("                        <div class=\"product\">\n");
      out.write("                            <div class=\"product-cover\" >\n");
      out.write("                                <div class=\"product-cover-hover\"><span><a href=\"urun.jsp?id=");
      out.print(urun.getId());
      out.write("\">Goster</a></span></div>\n");
      out.write("\n");
      out.write("                                ");

                                    out.print("<img src=..\\..\\ETicaretIO\\template_content\\" + urun.getResimYolu() + " />");

                                
      out.write("\n");
      out.write("\n");
      out.write("                            </div>    \n");
      out.write("                            <div class=\"product-details\">    \n");
      out.write("                                <h1><a href=\"urun.jsp?id=");
      out.print(urun.getId());
      out.write("\"> ");
      out.print( urun.getAd());
      out.write(" </a></h1>\n");
      out.write("\n");
      out.write("                                <div class=\"product-price\">\n");
      out.write("\n");
      out.write("                                    <i class=\"icon-257\" title=\"Sepete Ekle\"></i>\n");
      out.write("\n");
      out.write("                                    ");
      out.print(urun.getSatisFiyati());
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
      out.write("                    <li><a href=\"#\">Şimdi Kaydol</a></li>\n");
      out.write("                    <li><a href=\"#\">Bültene abone olun</a></li>\n");
      out.write("                    <li><a href=\"#\">Sipariş</a></li>\n");
      out.write("                    <li><a href=\"#\">Teslim</a></li>\n");
      out.write("                    <li><a href=\"#\">İletişim</a></li>\n");
      out.write("                    <li><a href=\"#\">Faq</a></li>\n");
      out.write("                    <li><a href=\"#\">Sorular</a></li>\n");
      out.write("                    <li><a href=\"#\">İş ortaklarımız</a></li>\n");
      out.write("                    <li><a href=\"#\">Hakkımızda</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-2 col-xs-6\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"#\">Ödemeler</a></li>\n");
      out.write("                    <li><a href=\"#\">Rehber</a></li>\n");
      out.write("                    <li><a href=\"#\">Sipariş izleme</a></li>\n");
      out.write("                    <li><a href=\"#\">Sipariş Geçmişi</a></li>\n");
      out.write("                    <li><a href=\"#\">İadeler</a></li>\n");
      out.write("                    <li><a href=\"#\">Şartlar ve koşullar</a></li>\n");
      out.write("                    <li><a href=\"#\">Güvenlik</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-2 col-xs-6\">\n");
      out.write("                <ul class=\"menu-item\">\n");
      out.write("                    <li><a href=\"#\">Anasayfa</a></li>\n");
      out.write("                    <li><a href=\"#\">Kategoriler</a></li>\n");
      out.write("                    <li><a href=\"#\">Alışveriş</a></li>\n");
      out.write("                    <li><a href=\"#\">Bolg</a></li>\n");
      out.write("                    <li><a href=\"#\">Hakkımızda</a></li>\n");
      out.write("                    <li><a href=\"#\">Hizmetler</a></li>\n");
      out.write("                    <li><a href=\"#\">Sepet</a></li>\n");
      out.write("                    <li><a href=\"#\">İletişim</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"subscription\">\n");
      out.write("                    <div class=\"subscription-title\">Bülten abone ol</div>\n");
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
