import 'package:flutter/material.dart';
import 'package:Pedagodino/widgets/primeira_medalha.dart';
import 'package:Pedagodino/widgets/stack_container.dart';
import '../widgets/quarta_medalha.dart';
import '../widgets/segunda_medalha.dart';
import '../widgets/terceira_medalha.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                height: 110.0,
                margin: const EdgeInsets.all(0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const primeiraMedalha(),
                  shrinkWrap: true,
                  itemCount: 1,
                ),
              ),
            ),
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                height: 110.0,
                margin: const EdgeInsets.all(0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const segundaMedalha(),
                  shrinkWrap: true,
                  itemCount: 1,
                ),
              ),
            ),
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                height: 110.0,
                margin: const EdgeInsets.all(0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const terceiraMedalha(),
                  shrinkWrap: true,
                  itemCount: 1,
                ),
              ),
            ),
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                height: 110.0,
                margin: const EdgeInsets.all(0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const quartaMedalha(),
                  shrinkWrap: true,
                  itemCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
