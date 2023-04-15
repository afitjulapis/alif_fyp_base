import 'package:e_pibg/HEP/tambah_pelajar.dart';
import 'package:e_pibg/Riverpod/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../pelajar/senaraiPelajar.dart';

class MenuHEP extends ConsumerWidget {
  const MenuHEP({super.key});
  // Navigator.push(context,MaterialPageRoute(builder: (context) => SenaraiPelajar())); // mcm hyperlink
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        
        title:Container(
          child: Text('HEP',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
        ), 
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(FontAwesome5.arrow_left)
        ),
      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded( //  auto kembang saiz nya\
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => TambahPelajar())); // mcm hyperlink
                    },
                    child: Container(
                      // width: w*0.3,
                      height: h*0.07,
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                        // border: Border.all(color: Colors.yellow,width:2)
                      ),
                      child: Center(
                        child: Container(
                          // width: w*0.6,
                          child: Text('TAMBAH PELAJAR',style: TextStyle(fontSize:h*0.018,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: h*0.01,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded( //  auto kembang saiz nya\
                  child: InkWell(
                    onTap: (){
                      ref.invalidate(searchName);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SenaraiPelajar())); // mcm hyperlink

                    },
                    child: Container(
                      // width: w*0.3,
                      height: h*0.07,
                      padding:  EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        // border: Border.all(color: Colors.yellow,width:2)
                      ),
                      child: Center(
                        child: Container(
                          // width: w*0.6,
                          child: Text('SENARAI PELAJAR',style: TextStyle(fontSize:h*0.018,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}