import 'package:e_pibg/Riverpod/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class DetailPelajar extends ConsumerStatefulWidget {
  final dataPelajar;
  DetailPelajar(this.dataPelajar);
  @override
  ConsumerState<DetailPelajar> createState() => _DetailPelajarState();
}

// 2. extend [ConsumerState]
class _DetailPelajarState extends ConsumerState<DetailPelajar> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: ref.read(turqose),
        title:Container(
          child: Text('MAKLUMAT PELAJAR',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
            SizedBox(height: h*0.02,),
            Container(
              width: h*0.1,
              height: h*0.1,
              padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
              decoration: BoxDecoration(
                color: ref.read(turqose),
                borderRadius: BorderRadius.circular(h),
                border: Border.all(color: ref.read(turqose),width:2)
              ),
              child: Center(
                child: Icon(FontAwesome5.user_astronaut,color: Colors.black, size: h*0.03,)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
              child: Row(
                children: [
                  
                  
                  Expanded(
                    flex: 3,
                    child: Container(
                      // width: w*0.3,
                      // height: h*0.1,
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.transparent,width:2)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // width: w*0.6,
                              child: Row(
                                children: [
                                  Text('Nama Pelajar : ',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                                  
                                ],
                              )
                            ),
                            Container(
                              // width: w*0.6,
                              child: Row(
                                children: [
                                  Expanded(child: Text(widget.dataPelajar['name'],style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)),
                                  
                                ],
                              )
                            ),

                            SizedBox(height: h*0.01,),
                            Container(
                              // width: w*0.6,
                              child: Row(
                                children: [
                                  Text('No Kad Pengenalan :',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                                ],
                              )
                            ),
                            Container(
                              // width: w*0.6,
                              child: Row(
                                children: [
                                  Text(widget.dataPelajar['ic'],style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                                  
                                ],
                              )
                            ),
                            
                            SizedBox(height: h*0.01,),
                            Container(
                              // width: w*0.6,
                              child: Row(
                                children: [
                                  Text('Tahap :',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                                ],
                              )
                            ),
                            Container(
                              // width: w*0.6,
                              child: Row(
                                children: [
                                  Text(widget.dataPelajar['tahap'].isEmpty? 'Tidak Dinyatakan':widget.dataPelajar['tahap'],style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                                  
                                ],
                              )
                            ),
                            
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.0,right: w*0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: w,
                      height: h*0.07,
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                      decoration: BoxDecoration(
                        color: ref.read(turqose),
                        borderRadius: BorderRadius.circular(5),
                        // border: Border.all(color: ref.read(turqose),width:2)
                      ),
                      child: Center(
                        child: Container(
                          // width: w*0.6,
                          child: Text('SUBJEK DIPILIH',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h*0.01,),
            // Padding(
            //   padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.08,right: w*0.04),
            //   child: Container(
            //     // width: w*0.6,
            //     child: Row(
            //       children: [
            //         Text('Subjek :',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
            //       ],
            //     )
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: h*0.0,bottom: h*0.01 ,left: w*0.08,right: w*0.04),
              child: Container(
                // width: w*0.6,
                child: Row(
                  children: [
                    Expanded(child: Text(widget.dataPelajar['subjek'].isEmpty? 'Tidak Dinyatakan':widget.dataPelajar['subjek'].toString(),style: TextStyle(fontSize:h*0.03,fontWeight: FontWeight.normal,color: Colors.white),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)),
                    
                  ],
                )
              ),
            ),

            

            // Padding(
            //   padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Container(
            //           // width: w*0.3,
            //           height: h*0.07,
            //           padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            //           decoration: BoxDecoration(
            //             color: Colors.blue,
            //             borderRadius: BorderRadius.circular(5),
            //             // border: Border.all(color: ref.read(turqose),width:2)
            //           ),
            //           child: Center(
            //             child: Container(
            //               // width: w*0.6,
            //               child: Text('MAKLUMAT IBU BAPA',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // SizedBox(height: h*0.01,),
            // Padding(
            //   padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.08,right: w*0.04),
            //   child: Container(
            //     // width: w*0.6,
            //     child: Row(
            //       children: [
            //         Text('No Telefon Penjaga :',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
            //       ],
            //     )
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.08,right: w*0.04),
            //   child: Container(
            //     // width: w*0.6,
            //     child: Row(
            //       children: [
            //         Text(widget.dataPelajar['phone'].isEmpty? 'Tidak Dinyatakan':widget.dataPelajar['phone'].toString(),style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
                    
            //       ],
            //     )
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}