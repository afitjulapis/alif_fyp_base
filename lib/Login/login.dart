import 'package:e_pibg/Riverpod/user_data.dart';
import 'package:e_pibg/dashboard/dashBoardAdmin.dart';
import 'package:e_pibg/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  @override
  ConsumerState<Login> createState() => _LoginState();
}

// 2. extend [ConsumerState]
class _LoginState extends ConsumerState<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email='';
  String password='';
  bool _isLoading = false;

  void resetPassword(String email) {
    if(email.isEmpty){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Email Tidak Diisi"),
            content: Text('Sila isikan emel akaun anda dan tekan "Lupa Katalaluan"' ),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
        print('Password reset email sent successfully!');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Email Dihantar"),
              content: Text('Sila semak emel anda untuk kemaskini katalaluan' ),
              actions: <Widget>[
                TextButton(
                  child: Text('Tutup'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }).catchError((error) {
        showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("ralat"),
            content: Text(error ),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      });
    }
    
  }

  void _signInWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      print('User logged in with uid: ${userCredential.user!.uid}');
      ref.read(userUID.notifier).state=userCredential.user!.uid;
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardAdmin())); // LOGIN ADMIN
      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardUser())); // LOGIN USER
      // Navigate to HomeScreen on successful login
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('User not found'),
            content: Text(
                'No user found for that email. Please check your email and try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Wrong password'),
            content: Text(
                'The password you entered is incorrect. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  void debuglogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: 'satria@gmail.com',
        password: '061116010489',
      );
      print('User logged in with uid: ${userCredential.user!.uid}');
      ref.read(userUID.notifier).state=userCredential.user!.uid;
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardAdmin())); // LOGIN ADMIN
      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardUser())); // LOGIN USER
      // Navigate to HomeScreen on successful login
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('User not found'),
            content: Text(
                'No user found for that email. Please check your email and try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Wrong password'),
            content: Text(
                'The password you entered is incorrect. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  void debugadmin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: 'admin@gmail.com',
        password: '123456',
      );
      print('User logged in with uid: ${userCredential.user!.uid}');
      ref.read(userUID.notifier).state=userCredential.user!.uid;
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardAdmin())); // LOGIN ADMIN
      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashboardUser())); // LOGIN USER
      // Navigate to HomeScreen on successful login
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('User not found'),
            content: Text(
                'No user found for that email. Please check your email and try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Wrong password'),
            content: Text(
                'The password you entered is incorrect. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width; // amik saiz screen AUTO SCALE
    var h = MediaQuery.of(context).size.height;

    return Scaffold( // SETUP PAGE , xwajib ada , tapi perlu untuk page lawa , kena kena kena
      body: SafeArea( // UNTUK avoid langgar statusbar
        child: Column( // Bina kebawah
          mainAxisAlignment: MainAxisAlignment.center, // control kedudukan - center, end dsbgainya
          children: [
            Image.asset(
              'assets/logo.jpg',
              width: h*0.2,
              fit: BoxFit.fitHeight,
            ),
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
                            if(txt.isEmpty){
                              email='';
                            }else{
                              email=txt;
                            }
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
                          obscureText: true,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          onChanged: (String txt) {
                            if(txt.isEmpty){
                              password='';
                            }else{
                              password=txt;
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
            SizedBox(height: h*0.02,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    resetPassword(email);
                  },
                  child: Container(
                    width: w*0.6,
                    child: Text('Lupa Katalaluan?',style: TextStyle(fontSize:h*0.015,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,)
                  ),
                ),
              ],
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
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell( // Convert into interaction
                  onTap: (){
                    // Navigator.push(context, route)
                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Dashboard())); // mcm hyperlink
                    _signInWithEmailAndPassword();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell( // Convert into interaction
                  onTap: (){
                    // Navigator.push(context, route)
                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Dashboard())); // mcm hyperlink
                    debuglogin();
                  },
                  child: Container(
                    width: w*0.6,
                    height: h*0.05,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: ref.watch(truegray),width:2)
                    ),
                    child: Center(child: Text('DEBUG LOGIN',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,))
                  ),
                ),
              ],
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell( // Convert into interaction
            //       onTap: (){
            //         // Navigator.push(context, route)
            //         // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Dashboard())); // mcm hyperlink
            //         debugadmin();
            //       },
            //       child: Container(
            //         width: w*0.6,
            //         height: h*0.05,
            //         decoration: BoxDecoration(
            //           color: Colors.blue,
            //           borderRadius: BorderRadius.circular(10),
            //           // border: Border.all(color: ref.watch(truegray),width:2)
            //         ),
            //         child: Center(child: Text('DEBUG ADMIN',style: TextStyle(fontSize:h*0.02,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 6,))
            //       ),
            //     ),
            //   ],
            // ),


            
            
          ],
        )
      ),
    );
  }
}