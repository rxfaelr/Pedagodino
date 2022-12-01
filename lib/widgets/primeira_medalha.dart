import 'package:Pedagodino/models/globals.dart';
import 'package:flutter/material.dart';

class primeiraMedalha extends StatelessWidget {
  const primeiraMedalha({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Color.fromARGB(255, 249, 247, 247),
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 13.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              medalha1
                  ? IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/medalha1.png'),
                      iconSize: 40,
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.access_time,
                          size: 40.0, color: Color.fromRGBO(235, 159, 74, 1)),
                    ),
              const SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Módulo 1 - Letras",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Parabéns por completar as atividades!",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
