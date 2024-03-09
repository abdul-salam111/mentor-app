import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppGuideController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    controller = YoutubePlayerController(
      initialVideoId: ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  List<String> videoTitles = [
    "Fun Activities For Everyone",
    "Fun Activities For Everyone",
    "Fun Activities For Everyone",
    "Fun Activities For Everyone"
  ];

  final List<String> ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
  ];

  void listener() {
    if (isPlayerReady && !controller.value.isFullScreen) {
      playerState = controller.value.playerState;
      videoMetaData = controller.metadata;
    }
  }

  late YoutubePlayerController controller;
  late YoutubePlayerController anothercontroller;

  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;

  bool isPlayerReady = false;
  var selectedVideo = 0.obs;

}
