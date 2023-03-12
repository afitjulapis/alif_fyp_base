

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