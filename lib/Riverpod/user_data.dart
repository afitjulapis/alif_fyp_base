import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pibg/Model/model_pelajar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:firebase_auth/firebase_auth.dart';

// COLORS ////////////////////////////////////////////////////////////
// 00ABB3
final turqose = StateProvider<Color>((ref) {
  return Color(0xff00ABB3);
});


///////////////////////////////////////////////////////////////////


final providerMain = Provider<DataPelajar>((ref) => DataPelajar());

final dataPelajar = FutureProvider.autoDispose.family< dynamic,WidgetRef >((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.getDataPelajarAll(data);
});


final addDataPelajar = FutureProvider.autoDispose.family< dynamic,Tuple7<String,String,String,String,List,String,WidgetRef> >((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.addNewDataPelajar(data);
});

final registerPelajar = FutureProvider.autoDispose.family< dynamic,Tuple3<String,String,WidgetRef> >((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.createNewUser(data);
});

final getTahap = FutureProvider.autoDispose.family<dynamic,WidgetRef>((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.getTahapPelajar(data);
});

final getThpdetails = FutureProvider.autoDispose.family<dynamic,String>((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.getTahapDetails(data);
});

final addNewPay = FutureProvider.autoDispose.family<dynamic,Tuple2<List,WidgetRef>>((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.addPayRec(data);
});

final addPendingPay = FutureProvider.autoDispose.family<dynamic,Tuple2<List,WidgetRef>>((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.addPendingRec(data);
});

final getPayrec_ID = FutureProvider.autoDispose.family<dynamic,WidgetRef>((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.getRecPayID(data);
});

final getPendPay = FutureProvider.autoDispose.family<dynamic,WidgetRef>((ref,data) {
  final watcher = ref.watch(providerMain);
  return watcher.getPendingPay(data);
});

final searchName = StateProvider<String>((ref) {
  return '';
});
final currerntUID = StateProvider<String>((ref) {
  return '';
});
final userUID = StateProvider<String>((ref) {
  return '';
});

final payAvailable = StateProvider<bool>((ref) {
  return false;
});


final dataPelajarGlobal = StateProvider<List>((ref) {
  return [];
});

final dataPelajarSearch = StateProvider<List>((ref) {
  return [];
});

final currentPendID = StateProvider<List>((ref) {
  return [];
});




final FirebaseFirestore firestore2 = FirebaseFirestore.instance;


Future<dynamic> getOnepelajar(WidgetRef ref) async {
  print('getting');
  var getData = firestore2.collection('pelajar').doc(ref.read(userUID)).get();
  
  try{
    DocumentSnapshot  snapshot = await getData;
    if (snapshot.exists) {
      // Document exists, do something with it
      Object? data = snapshot.data();
      return data;
      print(data);
    } else {
      // Document does not exist
      print('Document does not exist');
      return 'error';
    }
    // var dataPelajarsDocID = querySnapshot.docs.map((doc) => doc.id).toList();
    
  }on FirebaseException catch (e){
    return e.message;
  }
}

Future<dynamic> getRecIDList(uid) async {
  print('getting');
  var getData = firestore2.collection('rekodBayaran').doc(uid).collection('payment');
  
  try{
    QuerySnapshot querySnapshot = await getData.get();
    // var dataPayID = querySnapshot.docs.map((doc) => doc.data()).toList();
    var dataIDLIST = querySnapshot.docs.map((doc) => doc.id).toList();
    print('dataIDLIST');
    print(dataIDLIST);
    // var dataPayIDDocID = querySnapshot.docs.map((doc) => doc.id).toList();
    return dataIDLIST;
    
  }on FirebaseException catch (e){
    return e.message;
  }
}

Future<dynamic> getRecPayLone(uid) async {
  print('getting');
  var getData = firestore2.collection('rekodBayaran').doc(uid).collection('payment');
  
  try{
    QuerySnapshot querySnapshot = await getData.get();
    var dataPayID = querySnapshot.docs.map((doc) => doc.data()).toList();
    print('dataPayID');
    print(dataPayID);
    // var dataPayIDDocID = querySnapshot.docs.map((doc) => doc.id).toList();
    return dataPayID;
    
  }on FirebaseException catch (e){
    return e.message;
  }
}

Future<void> updateDataPay(uid,docID,status) async {
  final firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('rekodBayaran').doc(uid).collection('payment').doc(docID);
  // Replace `fieldToUpdate` with the name of the field you want to update
  await collection.update({'status': status});
}

Future<void> deleteData(docID) async {
  final firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('pendingPay').doc(docID);
  await collection.delete();
}

class DataPelajar {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> createNewUser(tuple) async {
    String email = tuple.item1;
    String password= tuple.item2;
    WidgetRef ref = tuple.item3;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;
      print('New user created with uid: $uid');
      return uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return e.message;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return e.message;
      }
      
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<dynamic> getDataPelajarAll(WidgetRef ref) async {
    print('getting');
    var getData = firestore.collection('pelajar');
    
    try{
      QuerySnapshot querySnapshot = await getData.get();
      var dataPelajars = querySnapshot.docs.map((doc) => doc.data()).toList();
      // var dataPelajarsDocID = querySnapshot.docs.map((doc) => doc.id).toList();
      ref.invalidate(dataPelajarGlobal);
      ref.read(dataPelajarGlobal.notifier).state = dataPelajars;
      print(ref.read(dataPelajarGlobal));
      return dataPelajars;
      
    }on FirebaseException catch (e){
      return e.message;
    }
  }

  Future<dynamic> getTahapPelajar(WidgetRef ref) async {
    print('getting');
    var getData = firestore.collection('subjek');
    
    try{
      QuerySnapshot querySnapshot = await getData.get();
      var dataPelajars = querySnapshot.docs.map((doc) => doc.id).toList();
      // var dataPelajarsDocID = querySnapshot.docs.map((doc) => doc.id).toList();
      return dataPelajars;
      
    }on FirebaseException catch (e){
      return e.message;
    }
  }



  Future<dynamic> getTahapDetails(tahap) async {
    print('getting');
    var getData = firestore2.collection('subjek').doc(tahap).get();
    
    try{
      DocumentSnapshot  snapshot = await getData;
      if (snapshot.exists) {
        // Document exists, do something with it
        Object? data = snapshot.data();
        print(data.toString());
        return data;
        print(data);
      } else {
        // Document does not exist
        print('Document does not exist');
        return 'error';
      }
      // var dataPelajarsDocID = querySnapshot.docs.map((doc) => doc.id).toList();
      
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
      final addDataPelajar = firestore.collection('pelajar').doc(ref.read(currerntUID));
      final modelPelajar= Pelajar(ic:ic, name: name, pakej: pakej, phone: phone, subjek: subjek, tahap: tahap);
      final stdData = modelPelajar.toJson();
      await addDataPelajar.set(stdData);
      print('usccess add ');
      ref.invalidate(currerntUID);
      return 'success';
    }on FirebaseException catch (e){
      return e.message;
    }
  }

  Future<dynamic> addPendingRec(tuple2) async{
    var listData = tuple2.item1;
    WidgetRef ref = tuple2.item2;
    print(listData);
    var bilBayar = listData[0];
    var bulanDibayar = listData[1];
    var fileID = listData[2];
    var hargaSeunit = listData[3];
    var hargaTotal = listData[4];
    var pakej = listData[5];
    var tahap = listData[6];
    var tahunDibayar = listData[7];
    var title = listData[8];
    var fileType = listData[9];
    var userID = listData[10];
    var userName = listData[11];



    try{
      final addPayrecc = firestore.collection('pendingPay').doc();
      final modelRec= PendingRec(bilBayar: bilBayar, bulanDibayar: bulanDibayar, fileID: fileID, hargaSeunit: hargaSeunit, hargaTotal: hargaTotal, pakej: pakej, tahap: tahap, tahunDibayar: tahunDibayar, title: title, fileType: fileType, userID: userID, userName: userName);
      final payrecData = modelRec.toJson();
      await addPayrecc.set(payrecData);
      print('usccess add pending');
      return 'success';
    }on FirebaseException catch (e){
      return e.message;
    }
  }

  Future<dynamic> addPayRec(tuple2) async{
    var listData = tuple2.item1;
    WidgetRef ref = tuple2.item2;

    var bilBayar = listData[0];
    var bulanDibayar = listData[1];
    var fileID = listData[2];
    var hargaSeunit = listData[3];
    var hargaTotal = listData[4];
    var pakej = listData[5];
    var tahap = listData[6];
    var tahunDibayar = listData[7];
    var title = listData[8];
    var fileType = listData[9];




    try{
      final addPayrecc = firestore.collection('rekodBayaran').doc(ref.read(userUID)).collection('payment').doc();
      final modelRec= PayRec(bilBayar: bilBayar, bulanDibayar: bulanDibayar, fileID: fileID, hargaSeunit: hargaSeunit, hargaTotal: hargaTotal, pakej: pakej, tahap: tahap, tahunDibayar: tahunDibayar, title: title,fileType:fileType,status:'PENDING');
      final payrecData = modelRec.toJson();
      await addPayrecc.set(payrecData);
      print('success add pay');
      return 'success';
    }on FirebaseException catch (e){
      return e.message;
    }
  }

  Future<dynamic> getRecPayID(WidgetRef ref) async {
    print('getting');
    var getData = firestore.collection('rekodBayaran').doc(ref.read(userUID)).collection('payment');
    
    try{
      QuerySnapshot querySnapshot = await getData.get();
      var dataPayID = querySnapshot.docs.map((doc) => doc.data()).toList();
      print('dataPayID');
      print(dataPayID);
      // var dataPayIDDocID = querySnapshot.docs.map((doc) => doc.id).toList();
      return dataPayID;
      
    }on FirebaseException catch (e){
      return e.message;
    }
  }

  Future<dynamic> getPendingPay(WidgetRef ref) async {
    print('getting');
    var getData = firestore.collection('pendingPay');
    
    try{
      QuerySnapshot querySnapshot = await getData.get();
      var dataPayID = querySnapshot.docs.map((doc) => doc.data()).toList();
      print('dataPayID');
      print(dataPayID);
      var dataPayIDDocID = querySnapshot.docs.map((doc) => doc.id).toList();
      ref.read(currentPendID.notifier).state=dataPayIDDocID;
      return dataPayID;
      
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