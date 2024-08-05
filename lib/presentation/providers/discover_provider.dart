import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
//import 'package:toktik/shared/data/local_video_post.dart';
//import 'package:toktik/infrastructure/models/local_video_model.dart';

class DiscoverProvider extends ChangeNotifier {
  
  final VideoPostRepositoryImpl videoRepository;
  bool initialLoading = true;

  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoRepository
  });

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));

    //* Como estaba antes
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoRepository.getTrendingVideosByPage(1); 

    videos.addAll(newVideos);

    initialLoading = false;
    notifyListeners();
  }
}
