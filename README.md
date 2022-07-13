### odev-3
1. Veritabanı oluştur(tablolar konusunda tamamen serbestsin)
2. Oluşturduğun veritabanına uygun verileri ekle
3. Geriye en az 1 tablo döndüren ve 1 değer döndüren fonksiyon oluştur
4. En az 1 tane stored procedure oluştur
5. Script çıkar
6. Ödev için açılacak repository içerisine 15 temmuz saat 23.00'a kadar yükle

# Son Teslim Tarihi: 15/07/2022 23:00

# Proje Açıklaması

Filmler ve bilgilerini içeren database örneğidir. Bu kapsamda filmin kategorileri, yönetmenleri ve oyuncular tabloları oluşturulup aralarında bağlantılar kurulmuştur.

# Fonksiyonların Kullanımı

Select dbo.Fnc_AvgYear() as AvgYear;

Select * from dbo.Fnc_GetFilmInfoByActorId(1);

# Stored Procedure Kullanımı

EXEC dbo.AddActor 'Meltem', 'Candan';

