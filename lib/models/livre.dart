class Livre {
  String image;
  String name;
  String publisher;
  String description;
  String chapters;
  String dir;
  late bool like;

  Livre({
    required this.name,
    required this.publisher,
    required this.image,
    required this.description,
    required this.chapters,
    required this.dir,
    required this.like,
  });
}
