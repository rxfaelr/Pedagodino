import 'package:Pedagodino/constants/color.dart';
import 'package:Pedagodino/models/course.dart';
import 'package:Pedagodino/screens/details_screen.dart';
import 'package:Pedagodino/screens/moduloSons/atividade10.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:Pedagodino/screens/licao1.dart';

class sonsScreen extends StatefulWidget {
  const sonsScreen({Key? key}) : super(key: key);

  @override
  _sonsScreenState createState() => _sonsScreenState();
}

class _sonsScreenState extends State<sonsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Atividades',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return CourseContainer(
                        course: courses[3],
                      );
                    },
                    itemCount: 1,
                  ),
                ),
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
          context, MaterialPageRoute(builder: (context) => atividade10())),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/icons/livros.png',
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name),
                  Text(
                    course.author,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: course.completedPercentage,
                    backgroundColor: Colors.black12,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
