//import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:Pedagodino/utils/custom_clipper.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'top_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Pedagodino/models/user_model.dart';

class StackContainer extends StatefulWidget {
  StackContainer({Key? key}) : super(key: key);

  @override
  State<StackContainer> createState() => _StackContainerState();
}

class _StackContainerState extends State<StackContainer> {
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
      height: 250.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 000.0,
              decoration: const BoxDecoration(
                color: Color.fromARGB(68, 255, 149, 0),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ProfilePicture(
                  name: 'usuário',
                  radius: 56,
                  fontsize: 30,
                  random: true,
                ),
                const SizedBox(height: 4.0),
                Text(
                  "${loggedInUser.firstName} ${loggedInUser.secondName}",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Dino Aprendiz",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const TopBar(),
        ],
      ),
    );
  }
}
