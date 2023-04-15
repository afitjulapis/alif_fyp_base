import 'package:e_pibg/Riverpod/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:tuple/tuple.dart';

import '../Riverpod/user_data.dart';
import '../pelajar/senaraiPelajar.dart';

class TambahPelajar extends ConsumerStatefulWidget {
  @override
  ConsumerState<TambahPelajar> createState() => _TambahPelajarState();
}

// 2. extend [ConsumerState]
class _TambahPelajarState extends ConsumerState<TambahPelajar> {
  // const TambahPelajar({super.key});
  var ic ='';
  var name ='';
  var emel ='';
  var pakej ='1 Subjek';
  var phone ='';
  var subjek =[];
  var tahap ='Darjah 1 - Darjah 3';


  var availableSubjeks =[];
  var maxSub = 0;
  bool isss = false;
  bool tahapReady = false;
  bool pakejReady = false;


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        label: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0,left: w*0.04,right: w*0.04),
              child: Container(
                // width: w*0.6,
                child: Row(
                  children: [
                    Icon(Icons.check ,color: Colors.white,),
                    SizedBox(width: w*0.02,),
                    Text('TAMBAH',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                    
                  ],
                )
              ),
            ),
          ],
        ),
        onPressed: (){
          if(subjek.length > maxSub){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Bilangan Subjek Melebihi"),
                  content: Text('Hanya ' +maxSub.toString()+' subjek sahaja untuk Pakej ' +pakej+ '.' ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }else{
           createNewUser(emel, ic).then((value){
              ref.read(currerntUID.notifier).state = value!;
              ref.read(addDataPelajar(Tuple7(ic, name, pakej, phone, subjek, tahap, ref)));
              ref.invalidate(dataPelajar);
              Navigator.pop(context);
            }); 
          }
          
          
        },
      ),
      appBar: AppBar(
        title:Container(
          child: Text('TAMBAH PELAJAR',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
        ), 
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(FontAwesome5.arrow_left)
        ),
      ),

      body:ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
            child: Container(
              // width: w*0.6,
              child: Row(
                children: [
                  Text('IC Pelajar : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: ref.watch(truegray),width:2)
              ),
              height: h*0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: w*0.04,),
                  SizedBox(
                    height: h*0.06,
                    width: w*0.5,
                    child: Center(
                      child: TextField(
                        obscureText: false,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        onChanged: (String txt) {
                          if(txt.isEmpty){
                            ic='';
                          }else{
                            ic=txt;
                          }
                        },
                        style: TextStyle(
                          fontSize: h*0.02,
                          color: Colors.white
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
          Padding(
            padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
            child: Container(
              // width: w*0.6,
              child: Row(
                children: [
                  Text('Nama Pelajar : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: ref.watch(truegray),width:2)
              ),
              height: h*0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: w*0.04,),
                  SizedBox(
                    height: h*0.06,
                    width: w*0.5,
                    child: Center(
                      child: TextField(
                        obscureText: false,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        onChanged: (String txt) {
                          if(txt.isEmpty){
                            name='';
                          }else{
                            name=txt;
                          }
                        },
                        style: TextStyle(
                          fontSize: h*0.02,
                          color: Colors.white
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
          // Padding(
          //   padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
          //   child: Container(
          //     // width: w*0.6,
          //     child: Row(
          //       children: [
          //         Text('Pakej : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
          //       ],
          //     )
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey,
          //       borderRadius: BorderRadius.circular(10),
          //       // border: Border.all(color: ref.watch(truegray),width:2)
          //     ),
          //     height: h*0.06,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         SizedBox(width: w*0.04,),
          //         SizedBox(
          //           height: h*0.06,
          //           width: w*0.5,
          //           child: Center(
          //             child: TextField(
          //               obscureText: false,
          //               textAlign: TextAlign.start,
          //               keyboardType: TextInputType.text,
          //               maxLines: 1,
          //               onChanged: (String txt) {
          //                 if(txt.isEmpty){
          //                   pakej='';
          //                 }else{
          //                   pakej=txt;
          //                 }
          //               },
          //               style: TextStyle(
          //                 fontSize: h*0.02,
          //                 color: Colors.white
          //               ),
          //               decoration:  InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText:  '',
          //                 hintStyle: TextStyle(color:Colors.grey,fontSize: h*0.015),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
            child: Container(
              // width: w*0.6,
              child: Row(
                children: [
                  Text('No. Tel. Penjaga : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: ref.watch(truegray),width:2)
              ),
              height: h*0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: w*0.04,),
                  SizedBox(
                    height: h*0.06,
                    width: w*0.5,
                    child: Center(
                      child: TextField(
                        obscureText: false,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        onChanged: (String txt) {
                          if(txt.isEmpty){
                            phone='';
                          }else{
                            phone=txt;
                          }
                        },
                        style: TextStyle(
                          fontSize: h*0.02,
                          color: Colors.white
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
          Padding(
            padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
            child: Container(
              // width: w*0.6,
              child: Row(
                children: [
                  Text('Emel Penjaga : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: ref.watch(truegray),width:2)
              ),
              height: h*0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: w*0.04,),
                  SizedBox(
                    height: h*0.06,
                    width: w*0.5,
                    child: Center(
                      child: TextField(
                        obscureText: false,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        onChanged: (String txt) {
                          if(txt.isEmpty){
                            emel='';
                          }else{
                            emel=txt;
                          }
                        },
                        style: TextStyle(
                          fontSize: h*0.02,
                          color: Colors.white
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
          Padding(
            padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
            child: Container(
              // width: w*0.6,
              child: Row(
                children: [
                  Text('Tahap : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Consumer(builder: (context, ref, child) {
              return ref.watch(getTahap(ref)).when(
                data: (dataa){
          
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: ref.watch(truegray),width:2)
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey,
                      value: tahap,
                      onChanged: (String? newValue) {
                        setState(() {
                          tahap = newValue!;
                          tahapReady = true;
                          pakejReady = false;
                          maxSub =0;
                          availableSubjeks = [];
                          subjek = [];

                        });
                      },
                      items: dataa.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          
                          value: value,
                          child: Text(value,style: TextStyle(
                            fontSize: h*0.02,
                            color: Colors.white
                          ),
                        ));
                      }).toList(),
                    ),
                  );
                }, 
                error: (er,st){
                  return Text('Error : '+ er.toString() );
                }, 
                loading: (){
                  return Text('Loading ..');
                }
              );
            },),
          ),
          tahapReady ?
          Padding(
            padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
            child: Container(
              // width: w*0.6,
              child: Row(
                children: [
                  Text('Pakej : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
                ],
              )
            ),
          ):SizedBox(),
          tahapReady ?
          Padding(
            padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Consumer(builder: (context, ref, child) {
              return ref.watch(getThpdetails(tahap)).when(
                data: (dataa){
                  // return Text('data ..');
                  List<String> keysList = dataa['pakej'].keys.toList();
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: ref.watch(truegray),width:2)
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey,
                      value: pakej,
                      onChanged: (String? newValue) {
                        setState(() {
                          pakej = newValue!;
                          availableSubjeks = dataa['subjek'];
                          maxSub = dataa['pakej'][pakej]['bilSubjek'];
                          pakejReady = true;
                        });
                      },
                      items: keysList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          
                          value: value,
                          child: Text(value,style: TextStyle(
                            fontSize: h*0.02,
                            color: Colors.white
                          ),
                        ));
                      }).toList(),
                    ),
                  );
                }, 
                error: (er,st){
                  return Text('Error : '+ er.toString() );
                }, 
                loading: (){
                  return Text('Loading ..');
                }
              );
            },),
          ): SizedBox(),
          // Padding(
          //   padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey,
          //       borderRadius: BorderRadius.circular(10),
          //       // border: Border.all(color: ref.watch(truegray),width:2)
          //     ),
          //     height: h*0.06,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         SizedBox(width: w*0.04,),
          //         SizedBox(
          //           height: h*0.06,
          //           width: w*0.5,
          //           child: Center(
          //             child: TextField(
          //               obscureText: false,
          //               textAlign: TextAlign.start,
          //               keyboardType: TextInputType.text,
          //               maxLines: 1,
          //               onChanged: (String txt) {
          //                 if(txt.isEmpty){
          //                   tahap='';
          //                 }else{
          //                   tahap=txt;
          //                 }
          //               },
          //               style: TextStyle(
          //                 fontSize: h*0.02,
          //                 color: Colors.white
          //               ),
          //               decoration:  InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText:  '',
          //                 hintStyle: TextStyle(color:Colors.grey,fontSize: h*0.015),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          pakejReady?
          Padding(
            padding: EdgeInsets.only(top: h*0.02,bottom: h*0.01,left: w*0.04,right: w*0.04),
            child: Container(
              // width: w*0.6,
              child: Row(
                children: [
                  Text('Subjek : ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  
                ],
              )
            ),
          ):Container(),
          pakejReady?
          SizedBox(
            height: (h*0.1)*availableSubjeks.length,
            child: ListView.builder(
              itemCount: availableSubjeks.length, // change this to the number of widgets you want to display
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  title: Text(availableSubjeks[index],style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                  value: subjek.contains(availableSubjeks[index])? true :false,
                  onChanged: (newValue) {
                    setState(() {
                      if(subjek.contains(availableSubjeks[index])){
                        subjek.remove(availableSubjeks[index]);
                      }else{
                        subjek.add(availableSubjeks[index]);
                      }
                    });
                  },
                  
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                );
              },
            ),
          ):Container(),
          
          // CheckboxListTile(
          //   title: Text('BAHASA INGGERIS ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
          //   value: subjek.contains('BAHASA INGGERIS')? true :false,
          //   onChanged: (newValue) {
          //     setState(() {
          //       if(subjek.contains('BAHASA INGGERIS')){
          //         subjek.remove('BAHASA INGGERIS');
          //       }else{
          //         subjek.add('BAHASA INGGERIS');
          //       }
          //     });
          //   },
          //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          // ),
          // CheckboxListTile(
          //   title: Text('SCIENCE ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
          //   value: subjek.contains('SCIENCE')? true :false,
          //   onChanged: (newValue) {
          //     setState(() {
          //       if(subjek.contains('SCIENCE')){
          //         subjek.remove('SCIENCE');
          //       }else{
          //         subjek.add('SCIENCE');
          //       }
          //     });
          //   },
          //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          // ),
          // CheckboxListTile(
          //   title: Text('MATEMATIK ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
          //   value: subjek.contains('MATEMATIK')? true :false,
          //   onChanged: (newValue) {
          //     setState(() {
          //       if(subjek.contains('MATEMATIK')){
          //         subjek.remove('MATEMATIK');
          //       }else{
          //         subjek.add('MATEMATIK');
          //       }
          //     });
          //   },
          //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          // ),
          // CheckboxListTile(
          //   title: Text('SEJARAH ',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
          //   value: subjek.contains('SEJARAH')? true :false,
          //   onChanged: (newValue) {
          //     setState(() {
          //       if(subjek.contains('SEJARAH')){
          //         subjek.remove('SEJARAH');
          //       }else{
          //         subjek.add('SEJARAH');
          //       }
          //     });
          //   },
          //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          // ),
          
        ],
      )
    );
  }
}