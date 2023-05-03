import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pibg/Model/model_pelajar.dart';
import 'package:e_pibg/Riverpod/user_data.dart';
import 'package:e_pibg/pelajar/detailPelajar.dart';
import 'package:e_pibg/pembayaran/admin/semakBayaran.dart';
import 'package:e_pibg/pembayaran/admin/semakBayaran_img.dart';
import 'package:e_pibg/pembayaran/admin/semakBayaran_pdf.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tuple/tuple.dart';

class PengesahanRekodBayaran extends ConsumerStatefulWidget {
  @override
  ConsumerState<PengesahanRekodBayaran> createState() => _PengesahanRekodBayaranState();
}

// 2. extend [ConsumerState]
class _PengesahanRekodBayaranState extends ConsumerState<PengesahanRekodBayaran> {
  var search='';

  Future<String> getDownloadURL(filename) async {
    print(filename);
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('rekodBayaran/'+filename);
    final url = await ref.getDownloadURL();
    print(url);
    return url;
    // return 'https://www.youtube.com/';
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return  Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title:Container(
          child: Text('Pengesahan Bayaran',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
        ), 
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(FontAwesome5.arrow_left)
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                return ref.watch(getPendPay(ref)).when(
                    data: (data){
                      if(data.length>0){
                        return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.0,right: w*0.0),
                                child: InkWell(
                                  onTap: (){
                                    // Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPelajar(ref.read(dataPelajarGlobal)[index]))); // mcm hyperlink
                                  },
                                  child: Container(
                                    width: w,
                                    color: Colors.yellow,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
                                      child: Row(
                                        children: [
                                          
                                          Container(
                                            width: h*0.05,
                                            height: h*0.05,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(h),
                                            ),
                                            child: Icon(Icons.receipt,color: Colors.yellow,)
                                          ),
                                          SizedBox(width: w*0.04,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: w*0.7,
                                                child: Text(data[index]['userName'],style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                              ),
                                              SizedBox(height: h*0.01,),
                                              Container(
                                                width: w*0.7,
                                                child: Text(data[index]['title'],style: TextStyle(fontSize:h*0.018,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                              ),
                                              Container(
                                                width: w*0.7,
                                                child: Text('Pakej '+data[index]['pakej'],style: TextStyle(fontSize:h*0.018,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                              ),
                                              Container(
                                                width: w*0.7,
                                                child: Text('RM '+data[index]['hargaTotal'].toString() + ' (' + data[index]['bilBayar'].toString()+' bulan)',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                              ),
                                              SizedBox(height: h*0.01,),
                                              InkWell(
                                                onTap: (){
                                                  if(data[index]['fileType']=='.pdf'){
                                                    var dataCheck = data;
                                                    
                                                    getRecIDList(data[index]['userID']).then((list){
                                                      
                                                      getRecPayLone(data[index]['userID']).then((dataPay){

                                                        for (var i = 0; i < dataPay.length; i++) {
                                                          print('\n\nchecking');
                                                          print(dataPay[i]['fileID']);
                                                          print('vs');
                                                          print(dataCheck[index]['fileID']);
                                                          if(dataPay[i]['fileID']==dataCheck[index]['fileID']){
                                                            print(list[i]);
                                                            getDownloadURL(data[index]['fileID']+data[index]['fileType']).then((link){
                                                              Navigator.push(context,MaterialPageRoute(builder: (context) => SemakPDF(fileURL: link,userID: data[index]['userID'],docID: list[i],pendDoc: ref.read(currentPendID)[index],))); // mcm hyperlink
                                                            });
                                                          }else{
                                                            print('not found');
                                                          }
                                                        }

                                                      });
                                                    });
                                                    
                                                  }else{
                                                    var dataCheck = data;
                                                    
                                                    getRecIDList(data[index]['userID']).then((list){
                                                      
                                                      getRecPayLone(data[index]['userID']).then((dataPay){

                                                        for (var i = 0; i < dataPay.length; i++) {
                                                          print('\n\nchecking');
                                                          print(dataPay[i]['fileID']);
                                                          print('vs');
                                                          print(dataCheck[index]['fileID']);
                                                          if(dataPay[i]['fileID']==dataCheck[index]['fileID']){
                                                            print(list[i]);
                                                            getDownloadURL(data[index]['fileID']+data[index]['fileType']).then((link){
                                                              Navigator.push(context,MaterialPageRoute(builder: (context) => SemakIMG(fileURL: link,userID: data[index]['userID'],docID: list[i],pendDoc: ref.read(currentPendID)[index],))); // mcm hyperlink
                                                            });
                                                          }else{
                                                            print('not found');
                                                          }
                                                        }

                                                      });
                                                    });
                                                    
                                                  }
                                                  
                                                },
                                                child: Container(
                                                  // width: w*0.3,
                                                  // height: h*0.05,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.circular(h*0.01),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
                                                    child: Text('Semak Bayaran',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ), 
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                          }
                        );
                      
                      }else{
                        return Center(
                          child: Text('Tiada bayaran buat masa ini',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                        );
                      }
                      
                    }, 
                    error: (e,st){
                      return Text(e.toString());
                    }, 
                    loading: (){
                      return Center(child: CircularProgressIndicator(color: Colors.yellow,));
                      
                    }
                  );
              },),
            )
            // Expanded(
            //   child: ListView.builder(
            //     padding: const EdgeInsets.all(8),
            //     itemCount: 5,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Padding(
            //         padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.0,right: w*0.0),
            //         child: InkWell(
            //           onTap: (){
            //             Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPelajar())); // mcm hyperlink
            //           },
            //           child: Container(
            //             color: Colors.amber,
            //             child: Padding(
            //               padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
            //               child: Row(
            //                 children: [
                              
            //                   Container(
            //                     width: h*0.05,
            //                     height: h*0.05,
            //                     decoration: BoxDecoration(
            //                       color: Colors.white,
            //                       borderRadius: BorderRadius.circular(h),
            //                       border: Border.all(color: Colors.blue,width:2)
            //                     ),
            //                     child: Center(child: Text('Log Masuk',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,))
            //                   ),
            //                   SizedBox(width: w*0.02,),
            //                   Text('Pelajar ' +index.toString()),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     }
            //   ),
            // )
          ],
        ),
      ),
    );
  }
  // Stream<List<Pelajar>> readPelajar()=>FirebaseFirestore.instance.collection('pelajar').snapshots().map((snapshot) => snapshot.docs.map((e) => Pelajar.fromJson(e.data())).toList());
}