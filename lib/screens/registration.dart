import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Pedagodino/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:get/get.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firtNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("Por favor, insira seu nome");
        }
        if (!regex.hasMatch(value)) {
          return ("São necessárias no mínimo duas letras.");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(100, 235, 237, 239),
        prefixIcon: const Icon(Icons.account_circle,
            color: Color.fromARGB(255, 229, 133, 18)),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintText: "Nome",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{1,}$');
        if (value!.isEmpty) {
          return ("Por favor informe o sobrenome");
        }
        if (!regex.hasMatch(value)) {
          return ("O sobrenome deve ter mais de 1 caracter");
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(100, 235, 237, 239),
        prefixIcon: const Icon(Icons.account_circle,
            color: Color.fromARGB(255, 229, 133, 18)),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintText: "Sobrenome",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor insira seu email");
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Insira um email válido");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(100, 235, 237, 239),
        prefixIcon:
            const Icon(Icons.mail, color: Color.fromARGB(255, 229, 133, 18)),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintText: "Email",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Por favor insira uma senha");
        }
        if (!regex.hasMatch(value)) {
          return ("São necessários no mínimo seis caracteres");
        }
        return null;
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(100, 235, 237, 239),
        prefixIcon:
            const Icon(Icons.vpn_key, color: Color.fromARGB(255, 229, 133, 18)),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintText: "Senha",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "As senhas não correspondem";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(100, 235, 237, 239),
        prefixIcon:
            const Icon(Icons.vpn_key, color: Color.fromARGB(255, 229, 133, 18)),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintText: "Confirme a senha",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: const Color.fromARGB(255, 229, 133, 18),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: const Text(
          "Cadastrar",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/cadastro.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 260,
                              child: firtNameField,
                            ),
                            const SizedBox(height: 25),
                            Container(
                              width: 260,
                              child: secondNameField,
                            ),
                            const SizedBox(height: 25),
                            Container(
                              width: 260,
                              child: emailField,
                            ),
                            const SizedBox(height: 25),
                            Container(
                              width: 260,
                              child: passwordField,
                            ),
                            const SizedBox(height: 25),
                            Container(
                              width: 260,
                              child: confirmPasswordField,
                            ),
                            const SizedBox(height: 35),
                            Container(
                              width: 200,
                              child: signUpButton,
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  signUp(String email, String passoword) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: passoword)
            .then((value) => {postDetailstoFirestore()});

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } on FirebaseAuthException catch (error) {
        // ignore: unnecessary_null_comparison
        if (error.code != null) {
          if (error.code == 'auth/email-already-in-use') {
            Fluttertoast.showToast(msg: "Esse email já está sendo usado");
          } else {
            Fluttertoast.showToast(msg: "Erro inesperado");
          }
        }
      }
    }
  }

  postDetailstoFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Conta criada com sucesso!");

    if (!mounted) return;
    Navigator.of(context).push(MaterialPageRoute<LoginScreen>(
      builder: (BuildContext context) {
        return const LoginScreen();
      },
    ));
  }
}
