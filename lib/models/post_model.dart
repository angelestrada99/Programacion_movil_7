class PostModel {
  int? idPost;
  String? desPost;
  String? datePost;

  PostModel({this.idPost, this.desPost, this.datePost});
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
        idPost: map['idPost'],
        desPost: map['desPost'],
        datePost: map['datePost']);
  }
}
