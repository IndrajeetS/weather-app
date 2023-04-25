import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/globals/constants/api_constants.dart';
import 'package:weather_app/src/models/posts_model.dart';

class PostRepository {
  final cancelToken = CancelToken();
  final _dioClient = Dio();

  Future<PostsMode> fetchPosts() async {
    try {
      final response = await _dioClient.get(
        postAPI,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.data);
        final posts = PostsMode.fromJson(jsonResponse);
        return posts;
      } else {
        log(response.statusCode.toString());
        throw Exception("Unable to fetch weather details");
      }
    } on DioError catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}

final postRepositoryProvider = Provider((ref) => PostRepository());
