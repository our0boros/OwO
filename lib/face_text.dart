import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class FaceText {
  String face_text = "";
  String base_face = "OwO";
  String blink_face = "—w—";

  Timer? _timer;
  final Random _random = Random();

  FaceText() {
    face_text = base_face;
    _startRandomTimer();
  }

  void _startRandomTimer() {
    int randomMilliseconds = (_random.nextInt(5) + 5) * 1000; // 生成 5 到 9 秒之间的随机毫秒数
    _timer = Timer(Duration(milliseconds: randomMilliseconds), () {
      _blink();
      _startRandomTimer(); // 递归调用以实现随机时间间隔
    });
  }

  void _blink() {
    face_text = blink_face;
    Timer(Duration(milliseconds: 100), () {
      face_text = base_face;
    });
  }

  String getFace() {
    return face_text;
  }

  void dispose() {
    _timer?.cancel();
  }
}