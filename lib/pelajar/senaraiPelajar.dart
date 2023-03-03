import 'package:e_pibg/pelajar/detailPelajar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SenaraiPelajar extends StatelessWidget {
  const SenaraiPelajar({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return  Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            
            Padding(
              padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.04,right: w*0.04),
              child: Row(
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
                          child: Text('SENARAI PELAJAR',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.02,right: w*0.02),
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
                                padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.02,right: w*0.0),
                                child: Text('Cari Pelajar',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 6,),
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
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01 ,left: w*0.0,right: w*0.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPelajar())); // mcm hyperlink
                      },
                      child: Container(
                        color: Colors.amber,
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
                              Text('Pelajar ' +index.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}