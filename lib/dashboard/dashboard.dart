import 'package:e_pibg/HEP/menu_HEP.dart';
import 'package:e_pibg/Peraturan/peraturan.dart';
import 'package:e_pibg/Riverpod/user_data.dart';
import 'package:e_pibg/pelajar/detailPelajar.dart';
import 'package:e_pibg/pelajar/senaraiPelajar.dart';
import 'package:e_pibg/pembayaran/user/bayar_menu.dart';
import 'package:e_pibg/takwim/takwim.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class DashboardUser extends ConsumerStatefulWidget {
  @override
  ConsumerState<DashboardUser> createState() => _DashboardUserState();
}

// 2. extend [ConsumerState]
class _DashboardUserState extends ConsumerState<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title:Container(
          child: Text('DASHBOARD PENGGUNA',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
        ), 
        // leading: InkWell(
        //   onTap: (){
        //     Navigator.pop(context);
        //   },
        //   child: Icon(FontAwesome5.arrow_left)
        // ),
      ),
      
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      getOnepelajar(ref).then((value){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPelajar(value,ref.read(currentStdID)))); // mcm hyperlink
                      });

                    },
                    child: Container(
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.02,right: w*0.02),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: ref.watch(truegray),width:2)
                      ),
                      child: Stack( // overlap element
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: h*0.08,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded( //  auto kembang saiz nya\
                                  child: Container(
                                    // width: w*0.3,
                                    height: h*0.07,
                                    padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.yellow,width:2)
                                    ),
                                    child: Center(
                                      child: Container(
                                        // width: w*0.6,
                                        child: Text('MAKLUMAT PELAJAR',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: h*0.1,
                                height: h*0.1,
                                padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(h),
                                  border: Border.all(color: Colors.yellow,width:2)
                                ),
                                child: Icon(FontAwesome5.sitemap,color: Colors.yellow, size: h*0.03,)
                              ),
                            ],
                          ),
                  
                          
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => WebViewerPage())); 
                    },
                    child: Container(
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.02,right: w*0.02),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: ref.watch(truegray),width:2)
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: h*0.08,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: w*0.3,
                                    height: h*0.07,
                                    padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.yellow,width:2)
                                    ),
                                    child: Center(
                                      child: Container(
                                        // width: w*0.6,
                                        child: Text('JADUAL KELAS',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: h*0.1,
                                height: h*0.1,
                                padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(h),
                                  border: Border.all(color: Colors.yellow,width:2)
                                ),
                                child: Icon(FontAwesome5.calendar,color: Colors.yellow, size: h*0.03,)
                              ),
                            ],
                          ),
                  
                          
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),

            SizedBox(height: h*0.02,),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Peraturan()));
                    },
                    child: Container(
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.02,right: w*0.02),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: ref.watch(truegray),width:2)
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: h*0.08,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: w*0.3,
                                    height: h*0.07,
                                    padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.yellow,width:2)
                                    ),
                                    child: Center(
                                      child: Container(
                                        // width: w*0.6,
                                        child: Text('PERATURAN SEKOLAH',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: h*0.1,
                                height: h*0.1,
                                padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(h),
                                  border: Border.all(color: Colors.yellow,width:2)
                                ),
                                child: Icon(FontAwesome5.gavel,color: Colors.yellow, size: h*0.03,)
                              ),
                            ],
                          ),
                  
                          
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BayarMenuUser()));
                    },
                    child: Container(
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.02,right: w*0.02),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: ref.watch(truegray),width:2)
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: h*0.08,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: w*0.3,
                                    height: h*0.07,
                                    padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.yellow,width:2)
                                    ),
                                    child: Center(
                                      child: Container(
                                        // width: w*0.6,
                                        child: Text('PEMBAYARAN',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: h*0.1,
                                height: h*0.1,
                                padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(h),
                                  border: Border.all(color: Colors.yellow,width:2)
                                ),
                                child: Icon(FontAwesome5.money_bill,color: Colors.yellow, size: h*0.03,)
                              ),
                            ],
                          ),
                  
                          
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
            
            SizedBox(height: h*0.02,),
            Row(
              children: [
                

                
                
              ],
            )
          
          
          
          
          ],
        )
      ),
    );
  }
}