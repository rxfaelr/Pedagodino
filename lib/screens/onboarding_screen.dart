import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Pedagodino/screens/login.dart';
import 'package:Pedagodino/utilities/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ? Color.fromRGBO(235, 159, 74, 1)
            : Color.fromRGBO(235, 237, 239, 1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(1000, 250, 249, 246),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Pular',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/icons/carrossel3.png',
                                height: 200.0,
                                width: 200.0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text('Aprenda com a gente enquanto se diverte!',
                                style: kTitleStyle,
                                textAlign: TextAlign.center),
                            const SizedBox(height: 20.0),
                            Text(
                              'Preparamos diversas tarefas pra você ter um aprendizado agradável!',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/icons/carrossel2.png',
                                height: 200.0,
                                width: 200.0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text('Basta criar sua conta e vir brincar conosco!',
                                style: kTitleStyle,
                                textAlign: TextAlign.center),
                            const SizedBox(height: 20.0),
                            Text(
                                'É necessário uma conexão com a internet para se cadastrar.',
                                style: kSubtitleStyle,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/icons/carrossel1.png',
                                height: 200.0,
                                width: 200.0,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Text('E aí, vamos começar a\naprender?',
                                  style: kTitleStyle,
                                  textAlign: TextAlign.center),
                            ),
                            const SizedBox(height: 20.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Text('Seja bem-vindo ao Pedagodino!',
                                  style: kSubtitleStyle,
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 60.0,
              width: double.infinity,
              color: const Color.fromRGBO(235, 159, 74, 1),
              child: GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text(
                      'Vamos começar!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
