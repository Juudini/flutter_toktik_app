import 'package:flutter/material.dart';
import 'package:flutter_toktik_app/domain/entities/video_post.dart';
import 'package:flutter_toktik_app/infrastructure/models/local_video_model.dart';
import 'package:flutter_toktik_app/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  //todo: repository, datasource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    //todo: cargar videos

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
