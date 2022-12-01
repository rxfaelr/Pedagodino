import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Pedagodino/screens/login.dart';

class settingsScreen extends StatefulWidget {
  const settingsScreen({Key? key}) : super(key: key);
  @override
  settingsScreenState createState() => settingsScreenState();
}

class settingsScreenState extends State<settingsScreen> {
  final _emailController = TextEditingController();
  bool switchStateSound = false;
  bool switchStateNot = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return Stack(
              children: const [
                AlertDialog(
                  content: Text(
                      "Cheque seu email para acessar o link de troca de senha\n\nCaso a mensagem não apareça, verifique sua caixa de spam!"),
                ),
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content:
                  Text("O email informado não está registrado no aplicativo"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(235, 159, 74, 1)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const Text(
              "Configurações",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(Icons.person, color: Color.fromRGBO(235, 159, 74, 1)),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Usuário",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRowPass(context, "Mudar senha"),
            buildAccountOptionRowPriv(context, "Privacidade e uso de dados"),
            buildAccountOptionRowCred(context, "Créditos"),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }),
                child: const Text("SAIR",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildNotificationOptionRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        CupertinoSwitch(
          value: switchStateNot,
          onChanged: (bool value) {
            setState(() {
              switchStateNot = value;
            });
          },
        ),
      ],
    );
  }

  builSoundOptionRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        CupertinoSwitch(
          value: switchStateSound,
          onChanged: (bool value) {
            setState(() {
              switchStateSound = value;
            });
          },
        ),
      ],
    );
  }

  GestureDetector buildAccountOptionRowPass(
      BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Insira seu email para redefinir a senha"),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(100, 235, 237, 239),
                        prefixIcon: const Icon(Icons.mail,
                            color: Color.fromARGB(255, 229, 133, 18)),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: passwordReset,
                      color: const Color.fromARGB(255, 229, 133, 18),
                      child: const Text("Redefinir senha"),
                    )
                  ],
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Fechar")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRowPriv(
      BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                        "Suas informações são privadas e não são partilhadas com terceiros"),
                  ],
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Fechar")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRowCred(
      BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                        "Desenvolvido por Cléo Bueno Vedovato, Maria Eduarda A. Benedito e Rafael Rodrigues"),
                    Text(
                        "Imagens utilizadas: fotos disponibilizadas pelo freepik e alteradas por processo de vetorização"),
                    Text("Outras Informações: áudios gerados por TTSFree.com"),
                  ],
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Fechar")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
