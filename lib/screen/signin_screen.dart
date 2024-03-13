import 'package:event_book_task/screen/home/home_cubit.dart';
import 'package:event_book_task/screen/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign-In"),),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


      InkWell(
        onTap: (){

          googleLogin();

        },
        child: Center(child: Container(
          width: 200,
          height: 50,
          decoration:
          BoxDecoration(color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10)),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

          Icon(Icons.g_mobiledata_rounded,
            size: 40,
            color: Colors.white,),

          Text("Google Sign-IN",
            style: TextStyle(fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w800),)

        ],),),),
      )
    ],),);
  }


  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);

      // Navigator.push(context, MaterialPageRoute(builder:
      //     (context) => HomeScreen(reslut.displayName),));


      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: HomeScreen(reslut.displayName),
          )));

    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
}
