import 'package:flutter/material.dart';
import 'package:flutter_toktik_app/config/theme/app_theme.dart';
import 'package:flutter_toktik_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:flutter_toktik_app/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:flutter_toktik_app/presentation/providers/discover_provider.dart';
import 'package:flutter_toktik_app/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(
      videosDatasource: LocalVideoDatasource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)
            ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false,
        home: const DiscoverScreen(),
      ),
    );
  }
}
