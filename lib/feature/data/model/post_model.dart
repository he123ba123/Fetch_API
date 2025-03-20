class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
      
  // Convert JSON to PostModel
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
    // Convert PostModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId
    };
  }

    // Convert List of JSON to List of UserModel
  static List<PostModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => PostModel.fromJson(json)).toList();
  }

  // Convert List of UserModel to List of JSON
  static List<Map<String, dynamic>> listToJson(List<PostModel> users) {
    return users.map((user) => user.toJson()).toList();
  }
}
