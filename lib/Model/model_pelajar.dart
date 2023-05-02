

import 'package:firebase_auth/firebase_auth.dart';

class Pelajar {
  final String ic ;
  final String name ;
  final String pakej ;
  final String phone ;
  final List subjek ;
  final String tahap ;

  Pelajar({
    required this.ic,
    required this.name,
    required this.pakej,
    required this.phone,
    required this.subjek,
    required this.tahap,
  });

  Map<String,dynamic> toJson()=>{
    'ic':ic,
    'name':name,
    'pakej':pakej,
    'phone':phone,
    'subjek':subjek,
    'tahap':tahap,


  };


  static Pelajar fromJson(Map <String,dynamic> json)=>Pelajar(ic:json['ic'] ,name: json['name'], pakej: json['pakej'], phone: json['phone'], subjek: json['subjek'], tahap: json['tahap']);


}


class PayRec {
  final int bilBayar ;
  final List bulanDibayar ;
  final String fileID ;
  final int hargaSeunit ;
  final int hargaTotal ;
  final String pakej ;
  final String tahap ;
  final String tahunDibayar ;
  final String title ;
  final String fileType ;
  final String status ;


  PayRec({
    required this.bilBayar,
    required this.bulanDibayar,
    required this.fileID,
    required this.hargaSeunit,
    required this.hargaTotal,
    required this.pakej,
    required this.tahap,
    required this.tahunDibayar,
    required this.title,
    required this.fileType,
    required this.status,

  });

  Map<String,dynamic> toJson()=>{
    'bilBayar':bilBayar,
    'bulanDibayar':bulanDibayar,
    'fileID':fileID,
    'hargaSeunit':hargaSeunit,
    'hargaTotal':hargaTotal,
    'pakej':pakej,
    'tahap':tahap,
    'tahunDibayar':tahunDibayar,
    'title':title,
    'fileType':fileType,
    'status':status,




  };

}

class PendingRec {
  final int bilBayar ;
  final List bulanDibayar ;
  final String fileID ;
  final int hargaSeunit ;
  final int hargaTotal ;
  final String pakej ;
  final String tahap ;
  final String tahunDibayar ;
  final String title ;
  final String fileType ;
  final String userID ;
  final String userName ;



  PendingRec({
    required this.bilBayar,
    required this.bulanDibayar,
    required this.fileID,
    required this.hargaSeunit,
    required this.hargaTotal,
    required this.pakej,
    required this.tahap,
    required this.tahunDibayar,
    required this.title,
    required this.fileType,
    required this.userID,
    required this.userName,

  });

  Map<String,dynamic> toJson()=>{
    'bilBayar':bilBayar,
    'bulanDibayar':bulanDibayar,
    'fileID':fileID,
    'hargaSeunit':hargaSeunit,
    'hargaTotal':hargaTotal,
    'pakej':pakej,
    'tahap':tahap,
    'tahunDibayar':tahunDibayar,
    'title':title,
    'fileType':fileType,
    'userID':userID,
    'userName':userName,
  };

}



