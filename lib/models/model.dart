class Question {
  final String? text;
  final List<Option>? options;
  bool? isLocked;
  Option? selectedOption;
  final int? id;
  final String? audio;

  Question(
      {this.text,
      this.options,
      this.isLocked = false,
      this.selectedOption,
      this.audio,
      this.id});
}

class Option {
  final dynamic text;
  final bool? isCorrect;
  final int i;

  const Option({required this.text, this.isCorrect, required this.i});
}

final questions = [
  Question(
    id: 0,
    text: 'Fruta bla bla bla',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'Pêra', isCorrect: false, i: 0),
      const Option(text: 'Maçã', isCorrect: false, i: 1),
      const Option(text: 'Melancia', isCorrect: true, i: 2),
      const Option(text: 'Abacaxi', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 1,
    text: 'Qual fruta tem duas vogais em seu nome',
    audio: '../assets/audio2.mp3',
    options: [
      const Option(text: 'Errado', isCorrect: false, i: 0),
      const Option(text: 'Errado', isCorrect: false, i: 1),
      const Option(text: 'Certo', isCorrect: true, i: 2),
      const Option(text: 'Errado', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 2,
    text: 'Qual fruta tem duas vogais em seu nome',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'Nao', isCorrect: false, i: 0),
      const Option(text: 'Nao', isCorrect: false, i: 1),
      const Option(text: 'Sim', isCorrect: true, i: 2),
      const Option(text: 'Não', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 3,
    text: 'QUAL É O NÚMERO NOVE?',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: '1', isCorrect: true, i: 0),
      const Option(text: '19', isCorrect: false, i: 1),
      const Option(text: '9', isCorrect: false, i: 2),
      const Option(text: '8', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 4,
    text: 'ONDE ESTÁ ESCRITO 110?',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'CENTO E DEZ', isCorrect: false, i: 0),
      const Option(text: 'CENTO E ONZE', isCorrect: false, i: 1),
      const Option(text: 'OITENTA', isCorrect: true, i: 2),
      const Option(text: 'DEZ', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 5,
    text: 'Qual fruta tem duas vogais em seu nome',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'Pêra', isCorrect: false, i: 0),
      const Option(text: 'Morango', isCorrect: false, i: 1),
      const Option(text: 'Melancia', isCorrect: true, i: 2),
      const Option(text: 'Abacaxi', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 6,
    text: 'Qual fruta tem duas vogais em seu nome',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'Pêra', isCorrect: false, i: 0),
      const Option(text: 'Morango', isCorrect: false, i: 1),
      const Option(text: 'Melancia', isCorrect: true, i: 2),
      const Option(text: 'Abacaxi', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 7,
    text: 'Qual fruta tem duas vogais em seu nome',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'Pêra', isCorrect: false, i: 0),
      const Option(text: 'Morango', isCorrect: false, i: 1),
      const Option(text: 'Melancia', isCorrect: true, i: 2),
      const Option(text: 'Abacaxi', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 8,
    text: 'Qual fruta tem duas vogais em seu nome',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'Pêra', isCorrect: false, i: 0),
      const Option(text: 'Morango', isCorrect: false, i: 1),
      const Option(text: 'Melancia', isCorrect: true, i: 2),
      const Option(text: 'Abacaxi', isCorrect: false, i: 3),
    ],
  ),
  Question(
    id: 9,
    text: 'Qual fruta tem duas vogais em seu nome',
    audio: '../assets/audio.mp3',
    options: [
      const Option(text: 'Pêra', isCorrect: false, i: 0),
      const Option(text: 'Morango', isCorrect: false, i: 1),
      const Option(text: 'Melancia', isCorrect: true, i: 2),
      const Option(text: 'Abacaxi', isCorrect: false, i: 3),
    ],
  ),
];
