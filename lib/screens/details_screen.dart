import 'package:Pedagodino/constants/color.dart';
//import 'package:Pedagodino/constants/icons.dart';
//import 'package:Pedagodino/models/lesson.dart';
//import 'package:Pedagodino/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import '../widgets/lesson_card.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  const DetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: const [],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Parabéns por ter\ completado as tarefas!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: const [],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return const SizedBox(
              height: 80,
              child: EnrollBottomSheet(),
            );
          },
        ),
      ),
    );
  }
}

class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: CustomIconButton(
                onTap: () {}, //ADICIONAR: LOGICA DAS MEDALHAS
                color: kPrimaryColor,
                height: 45,
                width: double.infinity,
                child: const Text(
                  "Finalizar módulo!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// MODELO BOTÃO COM ICONE

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ), //BoxShadow
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Center(child: child),
      ),
    );
  }
}
