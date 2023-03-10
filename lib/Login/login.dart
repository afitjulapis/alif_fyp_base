import 'package:e_pibg/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width; // amik saiz screen AUTO SCALE
    var h = MediaQuery.of(context).size.height;

    return Scaffold( // SETUP PAGE , xwajib ada , tapi perlu untuk page lawa , kena kena kena
      body: SafeArea( // UNTUK avoid langgar statusbar
        child: Column( // Bina kebawah
          mainAxisAlignment: MainAxisAlignment.center, // control kedudukan - center, end dsbgainya
          children: [
            Row( // Bina Horizontal
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( // Kotak boleh custom
                  width: w*0.7,
                  child: Text('IRIS \nManagement \nSystem',style: TextStyle(fontSize:h*0.05,fontWeight: FontWeight.bold,color: Colors.blue),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                ),
              ],
            ),

            SizedBox(height: h*0.04,),// kotak custom size ONLY
            

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // width: w*0.6,
                  child: Text('Selamat Datang',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.red),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                ),
              ],
            ),
            SizedBox(height: h*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                  child: Container(
                    // width: w*0.6,
                    child: Text('Nama Pengguna',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.green),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
              child: Container(
                decoration: BoxDecoration( // Custom container yang dihajati
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.black,width:w*0.005)
                ),
                height: h*0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: w*0.04,),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: h*0.03,
                      
                    ),
                    SizedBox(width: w*0.04,),
                    SizedBox(
                      height: h*0.06,
                      width: w*0.5,
                      child: Center(
                        child: TextField(  // kotak untuk input data
                          obscureText: false, // hide/show data
                          textAlign: TextAlign.start, 
                          keyboardType: TextInputType.text, // 
                          maxLines: 1, // maxline untuk ruangan taip
                          onChanged: (String txt) { // live record apa perubahan
                            
                          },
                          style: TextStyle(
                            fontSize: h*0.02,
                            color: Colors.white
                          ),
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText:  'Sila isi nama',
                            hintStyle: TextStyle(color:Colors.white,fontSize: h*0.015),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h*0.01,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h*0.0,bottom: h*0.0 ,left: w*0.04,right: w*0.04),
                  child: Container(
                    // width: w*0.6,
                    child: Text('Kata Laluan',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.green),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                  ),
                ),
              ],
            ),
            SizedBox(height: h*0.0,),

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
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: h*0.03,
                      
                    ),
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
            SizedBox(height: h*0.02,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: w*0.6,
                  child: Text('Sila masukkan nama pengguna dan katalaluan yang sah bagi log masuk',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                ),
              ],
            ),
            SizedBox(height: h*0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell( // Convert into interaction
                  onTap: (){
                    // Navigator.push(context, route)
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Dashboard())); // mcm hyperlink

                  },
                  child: Container(
                    width: w*0.6,
                    height: h*0.05,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: ref.watch(truegray),width:2)
                    ),
                    child: Center(child: Text('Log Masuk',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,))
                  ),
                ),
              ],
            ),


            
            
          ],
        )
      ),
    );
  }
}