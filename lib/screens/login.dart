import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Pedagodino/screens/base_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(100, 235, 237, 239),
        prefixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 229, 133, 18)),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintText: "Email",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please enter a password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid password (minimum 6 character)");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(100, 235, 237, 239),
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: Color.fromARGB(255, 229, 133, 18),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        hintText: "Senha",
        hintStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: const Color.fromARGB(255, 229, 133, 18),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => login(emailController.text, passwordController.text),
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: const Color.fromRGBO(255, 255, 255, 1))),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Column(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Container(
                      width: 330.0,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                  "Bem-vindo!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    fontFamily: 'Futura Heavy font',
                                  ),
                                ),
                                const SizedBox(height: 35),
                                SizedBox(
                                  width: 225,
                                  child: emailField,
                                ),
                                const SizedBox(height: 25),
                                SizedBox(
                                  width: 225,
                                  child: passwordField,
                                ),
                                const SizedBox(height: 35),
                                Container(
                                  width: 200,
                                  child: loginButton,
                                ),
                                const SizedBox(height: 15),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      "Ainda não tem uma conta?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationScreen()));
                                      },
                                      child: const Text(
                                        "Cadastre-se",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 91, 145, 44),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      ),
    );
  }

  login(String email, String passoword) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: passoword)
            .then((uid) => {Fluttertoast.showToast(msg: "Login Bem Sucedido")});

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BaseScreen()));
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case 'auth/email-already-in-use':
            Fluttertoast.showToast(msg: "Esse email já está sendo usado");
            break;

          case 'wrong-password':
            Fluttertoast.showToast(msg: "A senha informada está incorreta");
            break;

          case 'user-not-found':
            Fluttertoast.showToast(msg: "O usuário informado não existe");
            break;

          default:
            Fluttertoast.showToast(msg: "Erro inesperado");
        }
      }
    }
  }
}
