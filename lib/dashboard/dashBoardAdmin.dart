import 'package:e_pibg/HEP/menu_HEP.dart';
import 'package:e_pibg/pelajar/senaraiPelajar.dart';
import 'package:e_pibg/pembayaran/admin/pendingPayment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../Riverpod/user_data.dart';
class DashboardAdmin extends ConsumerStatefulWidget {
  @override
  ConsumerState<DashboardAdmin> createState() => _DashboardAdminState();
}

// 2. extend [ConsumerState]
class _DashboardAdminState extends ConsumerState<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: ref.read(turqose),
        title:Container(
          child: Text('DASHBOARD ADMIN',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MenuHEP())); // mcm hyperlink

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
                                      color: ref.watch(turqose),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: ref.watch(turqose),width:2)
                                    ),
                                    child: Center(
                                      child: Container(
                                        // width: w*0.6,
                                        child: Text('HEP',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                                  border: Border.all(color: ref.watch(turqose),width:2)
                                ),
                                child: Icon(FontAwesome5.sitemap,color: ref.watch(turqose), size: h*0.03,)
                              ),
                            ],
                          ),
                  
                          
                        ],
                      ),
                    ),
                  ),
                ),
                
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    return ref.watch(getPendPay(ref)).when(
                      data: (data){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => PengesahanRekodBayaran())); // mcm hyperlink
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
                                            color: ref.watch(turqose),
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: ref.watch(turqose),width:2)
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
                                        border: Border.all(color: ref.watch(turqose),width:2)
                                      ),
                                      child: Icon(FontAwesome5.money_bill,color: ref.watch(turqose), size: h*0.03,)
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: h*0.06,),
                                    Container(
                                      width: h*0.04,
                                      height: h*0.04,
                                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.0,right: w*0.0),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(h),
                                        border: Border.all(color: Colors.red,width:2)
                                      ),
                                      child: Center(child: Text(data.length.toString(),style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,))
                                    ),
                                  ],
                                ),
                        
                                
                              ],
                            ),
                          ),
                        );
                      }, 
                      error: (error,st){
                        return Text(error.toString());
                      }, 
                      loading: (){
                        return Center(child: CircularProgressIndicator(color: ref.watch(turqose),));
                      }
                    );
                  },),
                ),
              ],
            ),
            SizedBox(height: h*0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(builder: (context, ref, child) {
                  return ref.watch(dataPelajar(ref)).when(
                      data: (data){
                        return Container(
                          // width: w*0.6,
                          child: Text('Jumlah Pelajar: '+data.length.toString(),style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                        );
                      }, 
                      error: (e,st){
                        return Text(e.toString());
                      }, 
                      loading: (){
                        return Text('loading');
                        
                      }
                    );
                },),
              ],
            )
          
          
          
          
          ],
        )
      ),
    );
  }
}