class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "Venha aprender a diferenciar as sílabas!",
    completedPercentage: .0,
    name: "Sílabas",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "Vamos aprender a contar!",
    completedPercentage: .0,
    name: "Números",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "Vamos rimar e entender a semelhança entre os sons!",
    completedPercentage: .0,
    name: "Rimas",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "Vamos diferenciar as letras e suas sonoridades!",
    completedPercentage: .0,
    name: "Sons",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "Mais atividades em breve!",
    completedPercentage: .0,
    name: "Em desenvolvimento",
    thumbnail: "assets/icons/flutter.jpg",
  ),
];

/* modelo de componente para a tela de seleção
de tarefa, o qual requere os campos para serem exibidos na tela.
>>>refatorar<<<
*/
