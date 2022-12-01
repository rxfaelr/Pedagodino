// import 'package:flutter/material.dart';
// import 'package:Pedagodino/models/model.dart';
// import 'package:audioplayers/audioplayers.dart';

// class QuestionWidget extends StatefulWidget {
//   const QuestionWidget({Key? key}) : super(key: key);

//   @override
//   State<QuestionWidget> createState() => _QuestionWidgetState();
// }

// class _QuestionWidgetState extends State<QuestionWidget> {
//   late PageController _controller;
//   int _questionNumber = 1;
//   int _score = 0;
//   bool? _isLocked = false;
//   final player = AudioPlayer();
//   Duration? duration = Duration(seconds: 0);
//   bool playing = false;
//   double value = 0;
//   Question question = Question();

//   @override
  // void initState() {
  //   super.initState();
  //   _controller = PageController(initialPage: 0);
  //   initAsset();
  // }

  // void initAsset() async {
  //   await player.setSourceAsset('audio.mp3');
  //   duration = await player.getDuration();
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 const SizedBox(height: 32),
//                 Text(
//                   'Question $_questionNumber/${questions.length}',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 14,
//                     decoration: TextDecoration.none,
//                   ),
//                 ),
//                 const Divider(thickness: 1, color: Colors.grey),
//                 Flexible(
//                   child: PageView.builder(
//                     itemCount: questions.length,
//                     controller: _controller,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final _question = questions[index];
//                       return buildQuestion(_question);
//                     },
//                   ),
//                 ),
//                 if (_isLocked == true) buildElevatedButton(),
//                 if (_isLocked == false) const SizedBox.shrink(),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Column buildQuestion(Question question) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 32),
//         Text(
//           question.text.toString(),
//         ),
//         const SizedBox(height: 10),
//         IconButton(
//           onPressed: () async {
//             if (playing) {
//               await player.resume();
//               setState(() {
//                 playing = false;
//                 player.pause();
//               });
//             } else {
//               await player.resume();
//               setState(() {
//                 playing = true;
//                 player.resume();
//               });
//               player.onPositionChanged.listen((event) {
//                 value = event.inSeconds.toDouble();
//               });
//             }
//           },
//           icon: Icon(playing ? Icons.pause_circle : Icons.play_arrow),
//         ),
//         const SizedBox(height: 32),
//         OptionsWidget(
//           question: question,
//           onClickedOption: (option) {
//             if (question.isLocked == true) {
//               return;
//             } else {
//               setState(() {
//                 question.isLocked = true;
//                 question.selectedOption = option;
//               });
//               _isLocked = question.isLocked;
//               if (question.selectedOption!.isCorrect == true) {
//                 _score++;
//               }
//             }
//           },
//           // ),
//         )
//       ],
//     );
//   }

//   ElevatedButton buildElevatedButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_questionNumber < questions.length) {
//           _controller.nextPage(
//             duration: const Duration(microseconds: 250),
//             curve: Curves.easeInExpo,
//           );

//           setState(() {
//             _questionNumber++;
//             _isLocked = false;
//             playing = false;
//           });
//         } else {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ResultPage(score: _score),
//               ));
//         }
//       },
//       child: Text(
//           _questionNumber < questions.length ? 'Next Page' : 'See the Result'),
//     );
//   }
// }

// class OptionsWidget extends StatelessWidget {
//   final Question question;
//   final ValueChanged<Option> onClickedOption;

//   const OptionsWidget({
//     Key? key,
//     required this.question,
//     required this.onClickedOption,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => SingleChildScrollView(
//         child: Wrap(
//           direction: Axis.horizontal,
//           children: question.options!
//               .map((option) => buildOption(context, option))
//               .toList(),
//         ),
//       );

//   Widget buildOption(BuildContext context, Option option) {
//     final color = getColorForOption(option, question);
//     return GestureDetector(
//       onTap: () => onClickedOption(option),
//       child: Container(
//         height: 170,
//         width: 170,
//         margin: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: color),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               question.options![option.i].text.toString(),
//               style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                   decoration: TextDecoration.none),
//             ),
//             getIconForOption(option, question),
//           ],
//         ),
//       ),
//     );
//   }

//   Color getColorForOption(Option option, Question question) {
//     final isSelected = option == question.selectedOption;
//     if (question.isLocked == true) {
//       if (isSelected) {
//         if (option.isCorrect == true) {
//           return Colors.green;
//         } else {
//           return Colors.red;
//         }
//       } else if (option.isCorrect == true) {
//         return Colors.green;
//       }
//     }
//     return Colors.grey.shade300;
//   }

//   Widget getIconForOption(Option option, Question question) {
//     final isSelected = option == question.selectedOption;
//     if (question.isLocked == true) {
//       if (isSelected) {
//         if (option.isCorrect == true) {
//           return const Icon(
//             Icons.check_circle,
//             color: Colors.green,
//           );
//         } else {
//           return const Icon(
//             Icons.cancel,
//             color: Colors.red,
//           );
//         }
//       } else if (option.isCorrect == true) {
//         return const Icon(
//           Icons.check_circle,
//           color: Colors.green,
//         );
//       }
//     }
//     return const SizedBox.shrink();
//   }
// }

// class ResultPage extends StatelessWidget {
//   const ResultPage({Key? key, required this.score}) : super(key: key);

//   final int score;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('You got $score/${questions.length}'),
//       ),
//     );
//   }
// }
