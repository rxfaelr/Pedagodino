import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Pedagodino/models/course.dart';
import '../details_screen.dart';
import 'package:Pedagodino/models/globals.dart' as globals;
import 'package:audioplayers/audioplayers.dart';

import 'atividade12.dart';

class atividade11 extends StatefulWidget {
  const atividade11({Key? key}) : super(key: key);

  @override
  _atividade11State createState() => _atividade11State();
}

class _atividade11State extends State<atividade11> {
  Color containerErrado = Colors.black;
  Color containerCerto = Colors.black;
  double containerBorder = 1;
  double containerBorderM = 1;
  bool teste = false;
  final player = AudioPlayer();
  bool playing = false;
  Duration? duration = const Duration(seconds: 0);
  double value = 0;

  @override
  void initState() {
    super.initState();
    initAsset();
  }

  void initAsset() async {
    await player.setSourceAsset('mochila.mp3');
    duration = await player.getDuration();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: 'Qual palavra é escrita com '),
                                  TextSpan(
                                      text: 'CH',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: '?'),
                                ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: CustomIconButton(
                    color: const Color.fromRGBO(235, 159, 74, 1),
                    height: 55,
                    width: 55,
                    onTap: (() async {
                      if (playing == true) {
                        await player.resume();
                        setState(() {
                          playing = false;
                          player.pause();
                        });
                      } else {
                        await player.resume();
                        setState(() {
                          playing = true;
                          player.resume();
                        });
                        player.onPositionChanged.listen((event) {
                          value = event.inSeconds.toDouble();
                        });
                      }
                    }),
                    child: const Icon(Icons.play_circle, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                          setState(() {
                            containerErrado = Colors.red;
                            containerBorder = 4;
                            teste = true;
                          });

                          if (teste == false) {
                            setState(() {
                              teste == true;
                            });
                          }
                        }),
                        child: Container(
                          height: 140,
                          width: 140,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: containerErrado, width: containerBorder),
                          ),
                          child: Image.asset(
                            'assets/icons/xicara.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            containerErrado = Colors.red;
                            containerBorder = 4;
                            teste = true;
                          });

                          if (teste == false) {
                            setState(() {
                              teste == true;
                            });
                          }
                        }),
                        child: Container(
                          height: 140,
                          width: 140,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: containerErrado, width: containerBorder),
                          ),
                          child: Image.asset(
                            'assets/icons/peixe.png',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            containerCerto = Colors.green;
                            containerBorderM = 4;
                            globals.score4 = globals.score4 + 10;
                          });
                        }),
                        child: Container(
                          height: 140,
                          width: 140,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: teste == true
                                    ? Colors.green
                                    : containerCerto,
                                width: teste == true ? 4 : containerBorderM),
                          ),
                          child: Image.asset('assets/icons/mochila.png'),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            containerErrado = Colors.red;
                            containerBorder = 4;
                            teste = true;
                          });

                          if (teste == false) {
                            setState(() {
                              teste == true;
                            });
                          }
                        }),
                        child: Container(
                          height: 140,
                          width: 140,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: containerErrado, width: containerBorder),
                          ),
                          child: Image.asset(
                            'assets/icons/caixa.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const atividade12(),
                        ),
                      );
                    },
                    color: const Color.fromRGBO(235, 159, 74, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ), // ADICIONAR ROTA PROX. LIÇÃO
                    child: const Text(
                      "Próximo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final Course course;
  const CourseContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    title: course.name,
                  ))),
    );
  }
}
