import 'dart:ui';

import 'package:Pedagodino/models/user_model.dart';
import 'package:Pedagodino/screens/numeros_screen.dart';
import 'package:Pedagodino/screens/letras_screen.dart';
import 'package:Pedagodino/screens/rimas_screen.dart';
import 'package:Pedagodino/screens/sons_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: const [
          AppBar(),
          Body(),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 3),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromARGB(118, 99, 97, 97),
                      blurRadius: 7.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: const Text(
                        "  Pequeno dino,\n\n  é hora de aprender!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Futura Heavy font',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 125,
                      child: Image.asset(
                        'assets/icons/livros.png',
                        width: 180,
                      ),
                    ),
                  ],
                ),
              ),
              //TextButton(
              //onPressed: () {},
              //child: Text(
              //"",
              //style: Theme.of(context)
              //  .textTheme
              //.bodyMedium
              //?.copyWith(color: kPrimaryColor),
              //),
              //)
            ],
          ),
        ),
        SizedBox(height: 40),
        Text('Escolha um módulo de atividades:',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'futura medium bt',
                fontWeight: FontWeight.w500)),

        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 25,
            children: [
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const letrasScreen(),
                    ),
                  );
                }),
                child: Container(
                  child: Image.asset(
                    'assets/icons/dino_alfabeto.png',
                    width: size.width / 2.5,
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const numerosScreen(),
                    ),
                  );
                }),
                child: Container(
                  child: Image.asset(
                    'assets/icons/dino_numero.png',
                    width: size.width / 2.5,
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const rimasScreen(),
                    ),
                  );
                }),
                child: Container(
                  child: Image.asset(
                    'assets/icons/dino_rima.png',
                    width: size.width / 2.5,
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const sonsScreen(),
                    ),
                  );
                }),
                child: Container(
                  child: Image.asset(
                    'assets/icons/dino_som.png',
                    width: size.width / 2.5,
                  ),
                ),
              ),
            ],
          ),
        )

        //GridView.builder(
        //  padding: const EdgeInsets.symmetric(
        //  horizontal: 20,
        //  vertical: 8,
        //  ),
        //gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //crossAxisCount: 2,
        //childAspectRatio: 0.8,
        //crossAxisSpacing: 20,
        //mainAxisSpacing: 24,
        //),
        //itemBuilder: (context, index) {
        //  return CategoryCard(
        //  category: categoryList[index],
        // );
        // },
        // itemCount: categoryList.length,
        // ),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 4.0,
            spreadRadius: .05,
          ), //BoxShadow
        ],
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Align(
      //       alignment: Alignment.topRight,
      //       child: Image.asset(
      //         category.thumbnail,
      //         height: kCategoryCardImageSize,
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Text(category.name),
      //     Text(
      //       "${category.noOfCourses.toString()} atividades",
      //       style: Theme.of(context).textTheme.bodySmall,
      //     ),
      //   ],
      // ),
    ),
  );
}

class AppBar extends StatefulWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0),
              //   child: Text(
              //     "",
              //     style: const TextStyle(
              //       fontFamily: 'Futura Heavy font',
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ProfilePicture(
              //   name: 'usuário',
              //   radius: 20,
              //   fontsize: 15,
              //   random: false,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
