// ignore_for_file: file_names, unused_field, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String path;
  final UniqueKey unique;
  const VideoScreen({required this.path, required this.unique})
      : super(key: unique);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewie;
  @override
  void initState() {
    _initControllers(widget.path);
    super.initState();
  }

  void _initControllers(String url) {
    _controller = VideoPlayerController.asset(url);
    _chewie = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: 16 / 9,
        // autoInitialize: true,
        // looping: true,
        autoPlay: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewie.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0), child: Chewie(controller: _chewie));
  }
}
