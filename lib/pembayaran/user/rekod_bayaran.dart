import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pibg/Model/model_pelajar.dart';
import 'package:e_pibg/Riverpod/user_data.dart';
import 'package:e_pibg/pelajar/detailPelajar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tuple/tuple.dart';

class RekodBayaran extends ConsumerStatefulWidget {
  @override
  ConsumerState<RekodBayaran> createState() => _RekodBayaranState();
}

// 2. extend [ConsumerState]
class _RekodBayaranState extends ConsumerState<RekodBayaran> {
  var search='';
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return  Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title:Container(
          child: Text('Rekod Bayaran',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                return ref.watch(getPayrec_ID(ref)).when(
                    data: (data){
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
                                          SizedBox(width: w*0.02,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(data[index]['title'],style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                              ),
                                              Container(
                                                child: Text(data[index]['status'],style: TextStyle(fontSize:h*0.016,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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