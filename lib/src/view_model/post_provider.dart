import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/repositories/posts_repository.dart';

final postRepositoryDataProvider = FutureProvider((ref) {
  return ref.watch(postRepositoryProvider).fetchPosts();
});
