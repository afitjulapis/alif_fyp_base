import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pibg/Model/model_pelajar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

final providerMain = Provider<DataPelajar>((ref) => DataPelajar());

final dataPelajar = FutureProvider.autoDispose.family< dynamic,WidgetRef >((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.getDataPelajarAll(data);
});


final addDataPelajar = FutureProvider.autoDispose.family< dynamic,Tuple7<String,String,String,String,List,String,WidgetRef> >((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.addNewDataPelajar(data);
});

final searchName = StateProvider<String>((ref) {
  return '';
});

final payAvailable = StateProvider<bool>((ref) {
  return false;
});





class DataPelajar {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<dynamic> getDataPelajarAll(WidgetRef ref) async {
    print('getting');
    var getData = firestore.collection('pelajar');
    
    try{
      QuerySnapshot querySnapshot = await getData.get();
      var dataPelajars = querySnapshot.docs.map((doc) => doc.data()).toList();
      // var dataPelajarsDocID = querySnapshot.docs.map((doc) => doc.id).toList();
      return dataPelajars;
      
    }on FirebaseException catch (e){
      return e.message;
    }
  }

  Future<dynamic> addNewDataPelajar(tuple7) async{
    String ic =tuple7.item1;
    String name=tuple7.item2;
    String pakej=tuple7.item3;
    String phone=tuple7.item4;
    List subjek=tuple7.item5;
    String tahap=tuple7.item6;
    WidgetRef ref=tuple7.item7;

    try{
      final addDataPelajar = firestore.collection('pelajar').doc(ic);
      final modelPelajar= Pelajar(ic:ic, name: name, pakej: pakej, phone: phone, subjek: subjek, tahap: tahap);
      final stdData = modelPelajar.toJson();
      await addDataPelajar.set(stdData);
      print('usccess add');
      return 'success';
    }on FirebaseException catch (e){
      return e.message;
    }
  }

}


// class TraildataActions with ChangeNotifier {
  
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   // final FirebaseStorage storage = FirebaseStorage.instance;

//   var userTrails;
//   var userTrailsDocID;

//   var communtiyTrails;
//   var communtiyTrailsDocID;



//   Future<String> addUserTrail(trailName,diffclty,coordinateList,lengthTrail,fileimage,uid,email) async{
//     try{
//       var rng = Random();
//       var randomID ='';
//       if(fileimage!=null){
//         randomID=rng.nextInt(9999999).toString();
//       }

//       var splitEmail = email.split('@');
//       var name = splitEmail[0];
//       final docUser = firestore.collection('savedtrail').doc(uid).collection('usertrail').doc();
//       final trailmodel= Trail(
//         trailname: trailName,
//         trailmakerID: uid,
//         trailmakerName:name,
//         difficulty: diffclty,
//         trailLength: lengthTrail+' KM',
//         imageID:randomID,
//         coordinates: coordinateList
//       );
//       final traildata = trailmodel.toJson();
//       await docUser.set(traildata);

//       if(fileimage!=null){
//         File file = File(fileimage.path);
//         try{
//           await storage.ref('trails/'+randomID).putFile(file);
//           return 'true';
//         } on FirebaseException catch(e){
//           return e.message;
//         }
//       }else{
//         return 'true';
//       }
//     }on FirebaseException catch (e){
//       return e.message;
//     }
//   }

//   Future<String> addCommunityTrail(trailName,diffclty,List<String> coordinateList,lengthTrail,uid,name,imageID,collectionID) async{
//     try{
//       final docUser = firestore.collection('communitytrail').doc(collectionID);
//       final trailmodel= Trail(
//         trailname: trailName,
//         trailmakerID: uid,
//         trailmakerName:name,
//         difficulty: diffclty,
//         trailLength: lengthTrail,
//         imageID:imageID,
//         coordinates: coordinateList
//       );
//       final traildata = trailmodel.toJson();
//       await docUser.set(traildata);

//       return 'true';
//     }on FirebaseException catch (e){
//       return e.message;
//     }
//   }

//   Future<String> getUserTrails(uid) async{
//     print('getting');
//     var getTrails = firestore.collection('savedtrail').doc(uid).collection('usertrail');
    
//     try{
//       QuerySnapshot querySnapshot = await getTrails.get();
//       userTrails = querySnapshot.docs.map((doc) => doc.data()).toList();
//       userTrailsDocID = querySnapshot.docs.map((doc) => doc.id).toList();

      
//       // print(userTrails);
      
//     }on FirebaseException catch (e){
//       return e.message;
//     }
//   }

//   Future<String> getCommTrails() async{
//     print('getting');
//     var getTrails = firestore.collection('communitytrail');
    
//     try{
//       QuerySnapshot querySnapshot = await getTrails.get();
//       communtiyTrails = querySnapshot.docs.map((doc) => doc.data()).toList();
//       communtiyTrailsDocID = querySnapshot.docs.map((doc) => doc.id).toList();

      
//       // print(communtiyTrails);
      
//     }on FirebaseException catch (e){
//       return e.message;
//     }
//   }

//   Future<String> getImageUrl(imageName) async{
//     print('getting');
//     var getImageUrl = storage.ref('trails/'+imageName).getDownloadURL();
    
//     try{
//       return await getImageUrl;
      
//     }on FirebaseException catch (e){
//       return e.message;
//     }
//   }

//   Future<List> get1CDocIDList(collection) async{
//     print('getting');
//     var getDocIds = firestore.collection(collection);
//     var docSnap = await getDocIds.get();
//     try{
//       var docList  = docSnap.docs.map((doc) => doc.id).toList();
//       print(docList);
//       return docList;

      
//     }on FirebaseException catch (e){
//       return null;
//     }
//   }

//   Future<String> deleteTrailCommunity(docID) async{
//     print('getting');
//     var deleteTrail = firestore.collection('communitytrail').doc(docID).delete();
//     // var docSnap = await getDocIds.get();
//     try{
//       var result='';
//       await deleteTrail.whenComplete((){
//         result = 'true';
//       });
//       return result;

      
//     }on FirebaseException catch (e){
//       print(e.message);
//       return e.message;
//     }
//   }

//   Future<String> deleteMyTrail(uid,docID) async{
//     var deleteTrail = firestore.collection('savedtrail').doc(uid).collection('usertrail').doc(docID).delete();
//     // var docSnap = await getDocIds.get();
//     try{
//       var result='';
//       await deleteTrail.whenComplete((){
//         result = 'true';
//       });
//       return result;

      
//     }on FirebaseException catch (e){
//       print(e.message);
//       return e.message;
//     }
//   }
// }

// class Trail {
//   final String trailname;
//   final String trailmakerID;
//   final String trailmakerName;
//   final String difficulty;
//   final String trailLength;
//   final String imageID;
//   final List<String> coordinates;

//   Trail({
//     this.trailname,
//     this.trailmakerID,
//     this.trailmakerName,
//     this.difficulty,
//     this.trailLength,
//     this.imageID,
//     this.coordinates,

//   });

//   Map<String,dynamic> toJson()=>{
//     'trailname':trailname,
//     'trailmakerID':trailmakerID,
//     'trailmakerName':trailmakerName,
//     'difficulty':difficulty,
//     'trailLength':trailLength,
//     'imageID':imageID,
//     'coordinates':coordinates,


//   };

//   static Trail fromJson(Map<String,dynamic> json)=>Trail(
//     trailname:json['trailname'],
//     trailmakerID:json['trailmakerID'],
//     trailmakerName:json['trailmakerName'],
//     difficulty:json['difficulty'],
//     trailLength:json['trailLength'],
//     imageID:json['imageID'],
//     coordinates:json['coordinates'],
//   );


// }