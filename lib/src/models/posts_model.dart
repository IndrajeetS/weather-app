// To parse this JSON data, do
//
//     final postsMode = postsModeFromJson(jsonString);

import 'dart:convert';

List<PostsMode> postsModeFromJson(String str) =>
    List<PostsMode>.from(json.decode(str).map((x) => PostsMode.fromJson(x)));

String postsModeToJson(List<PostsMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsMode {
  PostsMode({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostsMode.fromJson(Map<String, dynamic> json) => PostsMode(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
