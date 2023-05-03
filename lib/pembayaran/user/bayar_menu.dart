import 'package:e_pibg/pembayaran/user/rekod_bayaran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Riverpod/user_data.dart';
import 'buat_bayaran.dart';

class BayarMenuUser extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title:Container(
          child: Text('Menu Bayaran',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
        ), 
        // leading: InkWell(
        //   onTap: (){
        //     Navigator.pop(context);
        //   },
        //   child: Icon(FontAwesome5.arrow_left)
        // ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                getOnepelajar(ref).then((value){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PackageScreen(value))); // mcm hyperlink
                });
              },
              child: Container(
                width: w*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.015),
                  color: Colors. yellow,
                ),

                child: Padding(
                  padding:  EdgeInsets.only(top: h*0.01, bottom: h*0.01),
                  child: Center(child: Text('Buat Pembayaran',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)),
                )),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Do something
                  Navigator.push(context,MaterialPageRoute(builder: (context) => RekodBayaran())); // mcm hyperlink

              },
              child: Container(
                width: w*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.015),
                  color: Colors. yellow,
                ),

                child: Padding(
                  padding:  EdgeInsets.only(top: h*0.01, bottom: h*0.01),
                  child: Center(child: Text('Rekod Pembayaran',style: TextStyle(fontSize:h*0.025,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,)),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
