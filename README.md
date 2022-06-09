Erkan Öner - Mustafa Söğüt

# ETicaretIO
Jsp Ile Yapilan Basit Eticaret Uygulamasi

Proje Netbeans kullanılarak geliştirilmiştir

src\java\DataBase\DataTransferObject altında veriabanındaki tablolara karşılık gelen bean sınıfları var

src\java\DataBase\DataAccessObject altında DataTransferObject paketi altındaki sınıfların veritabanı ile JDBC işlemlerini yapan DataAccessObject sınıfları bulunmaktadır
DataTransferObject sınıflarında kendilerine ait tabloların veritabanlarında İnsert Delete vs işlemlerini yapan metodları bulunmaktadır

src\java\DataBase altındaki DatabaseConnection.java altında veritabanı ile connection nesnesi oluşturan ve sonlandıran metodları buluduran static bir sınıf bbulunmaktadır


web\Zeon Files altında internette bulduğum Zeon Files teması ile kullanıcı arayüzü oluşturuluştur

web\template_content yine internette bulunulan hazır tema altında ise yönetim paneli oluşturulmuştur
Burada ürün ekleme kategori ekleme gibi işlemler yapılabilmektedir

projede sepete eklenen ürünler cookie nesnesi ile tutulmuştur

oturum bilgisi ise session nesnesinde tutulmuştur

projede veritabanı olarak mysql kullanılmıştır

eticaretveritabani.sql veritabanının dışa aktarılmış dosyasıdır
