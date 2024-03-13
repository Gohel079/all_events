import 'dart:ui';

import 'package:event_book_task/screen/event_list/event_list.dart';
import 'package:event_book_task/screen/home/home_cubit.dart';
import 'package:event_book_task/screen/home/home_state.dart';
import 'package:event_book_task/screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  String? name;

  HomeScreen(this.name, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categoriesList = ["Music", "Business", "Sports", "Workshops","All"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi,${widget.name ?? ""}",
          style: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
              onTap: () {
                logout();
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {

                if(state is LoadedState){

                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => EventList(state.dataList,state.musicResponseModel),
                      ));
                }

                 },
             builder: (context, state) {

               if(state is LoadingState){
                 return const Expanded(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Center(child: CircularProgressIndicator()),
                     ],
                   ),
                 );
               }else if(state is LoadedState){
                 return categoriesWidget();
               }else {
                 return categoriesWidget();
               }


            },
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  void selectCategories(int index) {
    if (index == 0) {
      BlocProvider.of<HomeCubit>(context).callMusicListAPI();
    }else if(index ==1){
      BlocProvider.of<HomeCubit>(context).callBusinessListAPI();
    }else if(index ==2){
      BlocProvider.of<HomeCubit>(context).callSportsListAPI();
    }else if(index == 3){
      BlocProvider.of<HomeCubit>(context).callWorkShopListAPI();
    }
    else if(index ==4){
      BlocProvider.of<HomeCubit>(context).calAllListAPI();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void callMusicApi() {
    BlocProvider.of<HomeCubit>(context).callMusicListAPI();
  }

  Widget categoriesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Entertainment",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 23),
        ),
      ),

      SizedBox(height: 10,),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

        InkWell(onTap:(){
          BlocProvider.of<HomeCubit>(context).callMusicListAPI();
        },
            child: commonWidget(categoriesList[0])),

        InkWell(
            onTap: (){
              BlocProvider.of<HomeCubit>(context).callBusinessListAPI();
            },
            child: commonWidget(categoriesList[1])),

        InkWell(onTap:(){

          BlocProvider.of<HomeCubit>(context).callSportsListAPI();
    },child: commonWidget(categoriesList[2]))

        ,InkWell(onTap:(){

            BlocProvider.of<HomeCubit>(context).callWorkShopListAPI();
    },child: commonWidget(categoriesList[3])),

      ],),

      SizedBox(height: 10,),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(onTap:(){

              BlocProvider.of<HomeCubit>(context).calAllListAPI();
    },child: commonWidget(categoriesList[4])),
          ),
        ],
      ),
    ],);
  }

  Widget commonWidget(String name){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 7),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black, width: 1)),
      child:
    Text(name,
        style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 13)),);
  }
}
