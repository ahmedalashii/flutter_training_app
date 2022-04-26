// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import "colors.dart" as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List _videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;

  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/video_info.json")
        .then((value) {
      setState(() {
        _videoInfo = json.decode(value) as List;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller!.pause();
    _controller!.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: (_playArea == false)
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond,
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(
                color: color.AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            (_playArea == false)
                ? Container(
                    padding: const EdgeInsets.only(top: 50, left: 25, right: 0),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back_ios,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outlined,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                            fontSize: 26,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "and Gluts Workout",
                          style: TextStyle(
                            fontSize: 26,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "68 min",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                            Container(
                              width: 220,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Resistant band, kettebell",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        height: 100,
                        padding:
                            const EdgeInsets.only(top: 30, left: 15, right: 15),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _playArea = false;
                                });
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.info_outlined,
                              size: 20,
                              color: color.AppColor.secondPageTopIconColor,
                            ),
                          ],
                        ),
                      ),
                      _playView(context),
                      _controlView(context),
                    ],
                  ),
            Expanded(
              child: Container(
                // padding: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "Circuit1: Legs Toning",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.loopColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                fontSize: 15,
                                color: color.AppColor.setsColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // String convertTwo(int value) {
  //   return value < 10 ? "0$value" : "$value";
  // }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller!.value.volume) > 0;
    // final duration = _duration!.inSeconds ?? 0; // if seconds is null >> 0
    // final head = _position!.inSeconds ?? 0;
    // final remaind = max(0, duration - head);
    // final mins = convertTwo(remaind ~/ 60.0); // 22~/7 = 3
    // final secs = convertTwo(remaind % 60); // 22 % 7 = 1

    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SliderTheme(
          //   data: SliderTheme.of(context).copyWith(
          //     activeTrackColor: Colors.red[700],
          //     inactiveTrackColor: Colors.red[100],
          //     trackShape: RoundedRectSliderTrackShape(),
          //     trackHeight: 2.0,
          //     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          //     thumbColor: Colors.redAccent,
          //     overlayColor: Colors.red.withAlpha(32),
          //     overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          //     tickMarkShape: RoundSliderTickMarkShape(),
          //     activeTickMarkColor: Colors.red[700],
          //     inactiveTickMarkColor: Colors.red[100],
          //     valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          //     valueIndicatorColor: Colors.redAccent,
          //     valueIndicatorTextStyle: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   child: Slider(
          //     value: max(0,min(_progress*100,100)),
          //     min : 0,
          //     max: 100,
          //     divisions: 100,
          //     label: _position!.toString().split(".")[0],
          //     onChanged: (value){
          //       setState(() {
          //         _progress = value*0.01;
          //       });
          //     },
          //     onChangeStart: (value){
          //       _controller!.pause();
          //     },
          //     onChangeEnd: (value){
          //       final duration = _controller!.value!.duration;
          //       if(duration!=null){
          //         var newValue = max(0,min(value,99))*0.01;
          //         var millis = (duration.inMilliseconds*newValue).toInt();
          //         _controller!.seekTo(Duration(milliseconds: millis));
          //         _controller!.play();
          //       }
          //     },
          //   ),
          // ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0),
                    ),
                  ],
                ),
                child: Icon(
                  (noMute) ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              if (noMute) {
                _controller!.setVolume(0);
              } else {
                _controller!.setVolume(1.0);
              }
            },
          ),
          TextButton(
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && _videoInfo.isNotEmpty) {
                _initializeVideo(index);
              } else {
                Get.snackbar(
                  "Video",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(
                    Icons.face,
                    size: 30,
                  ),
                  backgroundColor: color.AppColor.gradientSecond,
                  colorText: Colors.white,
                  messageText: const Text(
                    "No More Previous Videos to Play!",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
            child: const Icon(Icons.fast_rewind, size: 36, color: Colors.white),
          ),
          TextButton(
            onPressed: () async {
              if (_isPlaying) {
                _controller!.pause();
              } else {
                _controller!.play();
              }
            },
            child: Icon((_isPlaying) ? Icons.pause : Icons.play_arrow,
                size: 36, color: Colors.white),
          ),
          TextButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index <= _videoInfo.length - 1) {
                _initializeVideo(index);
              } else {
                Get.snackbar(
                  "Video",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(
                    Icons.face,
                    size: 30,
                  ),
                  backgroundColor: color.AppColor.gradientSecond,
                  colorText: Colors.white,
                  messageText: const Text(
                    "You have finished watching all the videos. Congrats!",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
            child:
                const Icon(Icons.fast_forward, size: 36, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: (16 / 9),
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Preparing...",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var _onUpdateControllerTime;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      debugPrint("Controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("Controller can not be initialized");
      return;
    }
    setState(() {
      _isPlaying = controller.value.isPlaying;
    });
  }

  _initializeVideo(int index) {
    final VideoPlayerController controller =
        VideoPlayerController.network(_videoInfo[index]["videoUrl"]);
    final old = _controller;

    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    _controller!
      ..initialize().then((context) {
        old!.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  _listView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      itemCount: _videoInfo.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _onTapVideo(index);
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index: index),
        );
      },
    );
  }

  _buildCard({required int index}) {
    return SizedBox(
      height: 120,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(_videoInfo[index]["thumbnail"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _videoInfo[index]["title"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _videoInfo[index]["time"],
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 80; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: const Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
