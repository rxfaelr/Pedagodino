library Pedagodino.globals;

import 'package:shared_preferences/shared_preferences.dart';

int score1 = 0;
int score2 = 0;
int score3 = 0;
int score4 = 0;

bool medalha1 = false;
bool medalha2 = false;
bool medalha3 = false;
bool medalha4 = false;

getData() {
  getData1();
  getData2();
  getData3();
  getData4();
}

getData1() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('medalha1cache') != null) {
    medalha1 = prefs.getBool('medalha1cache')!;
  } else {
    return;
  }
}

getData2() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('medalha2cache') != null) {
    medalha2 = prefs.getBool('medalha2cache')!;
  } else {
    return;
  }
}

getData3() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('medalha3cache') != null) {
    medalha3 = prefs.getBool('medalha3cache')!;
  } else {
    return;
  }
}

getData4() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('medalha4cache') != null) {
    medalha4 = prefs.getBool('medalha4cache')!;
  } else {
    return;
  }
}
