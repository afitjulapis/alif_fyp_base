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
            ElevatedButton(
              onPressed: () {
                getOnepelajar(ref).then((value){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => PackageScreen(value))); // mcm hyperlink
                });
              },
              child: Text('Buat Pembayaran'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Do something
              },
              child: Text('Rekod Bayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
