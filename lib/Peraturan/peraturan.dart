import 'package:flutter/material.dart';

class Peraturan extends StatelessWidget {
  final List<String> items = [
    'BAYARAN PENDAFTARAN akan dikenakan kepada :\n\ta. Pelajar baru.\n\tb. Pelajar yang mendaftar semula setelah bercuti lebih dari 1 tahun.',
    'YURAN BUKU & BAHAN/ MATERIAL akan dikenakan sekali setiap tahun.',
    'YURAN BULANAN WAJIB dijelaskan se-+---belum 2hb setiap bulan.',
    'KAD BAYARAN: \nAkan diberikan kepada pelajar pada minggu ketiga atau keempat',
    'KAEDAH BAYARAN: \n\ta. Tunai melaui kad bayaran pelajar. \n\tb. Perbankan Internet.',
    'JADUAL akan dikeluarkan secara bulanan. Jadual bulanan adalah tetap. Notis akan diberi jIka berlaku sebarang perubahan.',
    'TIADA KELAS GANTI untuk pelajar yang tidak dapat hadir mengikut jadual yang ditetapkan',
    'TUTUP:\nPusat Tuisyen Iris Elit akan ditutup pada setiap cuti umum dan kelas akan di ganti jika terdapat sesi tuisyen yang jatuh pada hari tersebut.',
    'BULAN RAMADAN:\nJadual baru khas untuk bulan Ramadan akan dikeluarkan sebulan sebelum Ramadan.',
    'KESELAMATAN PELAJAR:\nBagi pelajar sekolah menengah yang membawa kenderaan sendiri seperti motosikal dankereta, mereka bertanggungjawab sepenuhnya atas keselamatan kenderaan dan diri sendiri.',
    'PERUBAHAN ALAMAT DAN NOMBOR TELEFON: \nIbubapa/penjaga hendaklah memaklumkan kepada pihak Pusat Tuisyen Iris Elit dari semasa ke semasa sekiranya terdapat sebarang perubahan alamat atau nombor telefon.',
    'SESI AKADEMIK akan berjalan dari Januari – Oktober KECUALI UPSR & PT3',
    'PELAJAR TIDAK DIBENARKAN MEMBAWA MAKANAN RINGAN DAN MINUMAN RINGAN KE KELAS TUISYEN.'
  ];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Peraturan'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.02,right: w*0.02),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: h*0.08,
                    height: h*0.08,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (index+1).isOdd ? Colors.amber : Colors. yellow,
                    ),
                    child: Center(
                      child: Text(
                        (index+1).toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: h*0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w*0.02,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.02),
                        color: (index+1).isOdd ? Colors.amber : Colors. yellow,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.02,right: w*0.02),
                        child: Text(items[index],
                          style: TextStyle(
                            fontSize:h*0.018,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                        ),
                      ),
                    )
                  )
          
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
