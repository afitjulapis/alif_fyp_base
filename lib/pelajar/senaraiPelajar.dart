import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pibg/Model/model_pelajar.dart';
import 'package:e_pibg/Riverpod/user_data.dart';
import 'package:e_pibg/pelajar/detailPelajar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tuple/tuple.dart';

class SenaraiPelajar extends ConsumerStatefulWidget {
  @override
  ConsumerState<SenaraiPelajar> createState() => _SenaraiPelajarState();
}

// 2. extend [ConsumerState]
class _SenaraiPelajarState extends ConsumerState<SenaraiPelajar> {
  var search='';

  void deleteData(stdID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pengesahan"),
          content: Text('Padam maklumat pelajar ini?' ),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: Text('Padam Pelajar'),
              onPressed: () {
                FirebaseFirestore.instance.collection('pelajar').doc(stdID).delete().then((value) {
                  ref.invalidate(dataPelajar);
                  setState(() {
                    search='';
                  });
                  ref.invalidate(searchName);
                  Navigator.pop(context);
                  

                }).catchError((error) {
                  print('Failed to delete document: $error');
                });
              },
            ),
          ],
        );
      },
    );
    
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: ref.read(turqose),
        title:Container(
          child: Text('SENARAI PELAJAR',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
            Padding(
              padding: EdgeInsets.only(top: h*0.02,bottom: h*0.0 ,left: w*0.02,right: w*0.02),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: h*0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(h),
                        border: Border.all(color: Colors.blue,width:2)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: w*0.02,),
                              Icon(FontAwesome5.search,color: Colors.grey, size: h*0.02,),
                              Padding(
                                padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    // border: Border.all(color: ref.watch(truegray),width:2)
                                  ),
                                  height: h*0.04,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: w*0.7,
                                        child: Center(
                                          child: TextField(
                                            obscureText: false,
                                            textAlign: TextAlign.start,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            onChanged: (String txt) {
                                              setState(() {
                                                if(txt.isEmpty){
                                                  ref.read(searchName.notifier).state='';
                                                }else{
                                                  ref.read(searchName.notifier).state=txt;
                                                  ref.invalidate(dataPelajarSearch);
                                                  ref.invalidate(IDPelajarSearch);

                                                  for (var i = 0; i < ref.read(dataPelajarGlobal).length; i++) {
                                                    var data =ref.read(dataPelajarGlobal)[i];
                                                    var id_data =ref.read(IDPelajarGlobal)[i];

                                                    
                                                    if(data['name'].toString().toLowerCase().contains(txt.toString().toLowerCase())){
                                                      ref.read(dataPelajarSearch.notifier).state.add(data);
                                                      ref.read(IDPelajarSearch.notifier).state.add(id_data);

                                                    }
                                                  }

                                                }
                                              });
                                            },
                                            style: TextStyle(
                                              fontSize: h*0.02,
                                              color: Colors.black
                                            ),
                                            decoration:  InputDecoration(
                                              border: InputBorder.none,
                                              hintText:  '',
                                              hintStyle: TextStyle(color:Colors.grey,fontSize: h*0.015),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                return ref.watch(dataPelajar(ref)).when(
                    data: (data){
                      if(ref.watch(searchName).isEmpty){
                        print(ref.read(dataPelajarGlobal).length);
                        print('YO!');
                        return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: ref.watch(dataPelajarGlobal).length,
                          itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.0,right: w*0.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPelajar(ref.read(dataPelajarGlobal)[index],ref.read(IDPelajarGlobal)[index]))); // mcm hyperlink
                                      },
                                      child: Container(
                                        color: ref.read(turqose),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
                                          child: Row(
                                            children: [
                                              
                                              Container(
                                                width: h*0.05,
                                                height: h*0.05,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(h),
                                                  border: Border.all(color: Colors.blue,width:2)
                                                ),
                                                child: Center(child: Icon(Icons.person))
                                              ),
                                              SizedBox(width: w*0.02,),
                                              Container(
                                                width: w*0.6,
                                                child: Text(ref.read(dataPelajarGlobal)[index]['name'])),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        deleteData(ref.read(IDPelajarGlobal)[index]);
                                      },
                                      child: Container(
                                        color: ref.read(turqose),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.02,right: w*0.02),
                                          child: Row(
                                            children: [
                                              
                                              Container(
                                                width: h*0.05,
                                                height: h*0.05,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(h),
                                                  border: Border.all(color: Colors.white,width:2)
                                                ),
                                                child: Center(child: Icon(Icons.delete))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          }
                        );
                      }else{
                        return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: ref.read(dataPelajarSearch).length,
                          itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.0,right: w*0.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPelajar(ref.read(dataPelajarSearch)[index],ref.read(IDPelajarGlobal)[index]))); // mcm hyperlink
                                      },
                                      child: Container(
                                        color: ref.read(turqose),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
                                          child: Row(
                                            children: [
                                              
                                              Container(
                                                width: h*0.05,
                                                height: h*0.05,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(h),
                                                  border: Border.all(color: Colors.blue,width:2)
                                                ),
                                                child: Center(child: Text('Log Masuk',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,))
                                              ),
                                              SizedBox(width: w*0.02,),
                                              Container(
                                                width: w*0.6,
                                                child: Text(ref.read(dataPelajarSearch)[index]['name'])),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        deleteData(ref.read(IDPelajarSearch)[index]);
                                      },
                                      child: Container(
                                        color: ref.read(turqose),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.02,right: w*0.02),
                                          child: Row(
                                            children: [
                                              
                                              Container(
                                                width: h*0.05,
                                                height: h*0.05,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(h),
                                                  border: Border.all(color: Colors.white,width:2)
                                                ),
                                                child: Center(child: Icon(Icons.delete))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          }
                        );
                      }
                      
                    }, 
                    error: (e,st){
                      return Text(e.toString());
                    }, 
                    loading: (){
                      return Text('loading');
                      
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