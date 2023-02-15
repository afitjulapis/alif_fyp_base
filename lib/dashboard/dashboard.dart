import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class Dashboard extends StatefulWidget {
  // const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
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
                                      child: Text('DASHBOARD PENGGUNA',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h*0.04,),
            Row(
              children: [
                Expanded(
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
                                      child: Text('HEP',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                                color: Colors.white,
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

                Expanded(
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
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blue,width:2)
                                  ),
                                  child: Center(
                                    child: Container(
                                      // width: w*0.6,
                                      child: Text('TAKWIM',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(h),
                                border: Border.all(color: Colors.blue,width:2)
                              ),
                              child: Icon(FontAwesome5.calendar,color: Colors.blue, size: h*0.03,)
                            ),
                          ],
                        ),

                        
                      ],
                    ),
                  ),
                ),
                
              ],
            ),

            SizedBox(height: h*0.02,),
            Row(
              children: [
                Expanded(
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
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.lightBlue,width:2)
                                  ),
                                  child: Center(
                                    child: Container(
                                      // width: w*0.6,
                                      child: Text('PERATURAN SEKOLAH',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(h),
                                border: Border.all(color: Colors.lightBlue,width:2)
                              ),
                              child: Icon(FontAwesome5.gavel,color: Colors.lightBlue, size: h*0.03,)
                            ),
                          ],
                        ),

                        
                      ],
                    ),
                  ),
                ),
                Expanded(
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
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.red,width:2)
                                  ),
                                  child: Center(
                                    child: Container(
                                      // width: w*0.6,
                                      child: Text('PEPERIKSAAN',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(h),
                                border: Border.all(color: Colors.red,width:2)
                              ),
                              child: Icon(FontAwesome5.edit,color: Colors.red, size: h*0.03,)
                            ),
                          ],
                        ),

                        
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            
            SizedBox(height: h*0.02,),
            Row(
              children: [
                Expanded(
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
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.green,width:2)
                                  ),
                                  child: Center(
                                    child: Container(
                                      // width: w*0.6,
                                      child: Text('PEMBAYARAN',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(h),
                                border: Border.all(color: Colors.green,width:2)
                              ),
                              child: Icon(FontAwesome5.money_bill,color: Colors.green, size: h*0.03,)
                            ),
                          ],
                        ),

                        
                      ],
                    ),
                  ),
                ),

                
                
              ],
            )
          
          
          
          
          ],
        )
      ),
    );
  }
}