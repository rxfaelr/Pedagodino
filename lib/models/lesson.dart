/*
tela intermediária entre a seleção de tarefas
e a tarefa em si, possivelmente descontinuada ou refatorada.
Mesma lógica da anterior, requirindo os dados para exibir em cada item da lista
*/
class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;

  Lesson({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
  });
}

List<Lesson> lessonList = [
  Lesson(
    duration: '11 min 20 sec',
    isCompleted: true,
    isPlaying: true,
    name: "Why Flutter Development",
  ),
  Lesson(
    duration: '10 min 11 sec',
    isCompleted: false,
    isPlaying: false,
    name: "Setup Flutter on MacOS",
  ),
  Lesson(
    duration: '7 min',
    isCompleted: false,
    isPlaying: false,
    name: "Setup Flutter on Windows",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Introduction to Flutter widgets.",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "What are Stateless Widgets?",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "What are Statefull Widgets?",
  )
];
