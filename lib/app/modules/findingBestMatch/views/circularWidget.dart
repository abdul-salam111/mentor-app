import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_app/app/resources/colors.dart';

import 'package:mentor_app/app/resources/icons.dart';

class LoginAssets extends StatefulWidget {
  const LoginAssets({super.key});

  @override
  State<LoginAssets> createState() => _LoginAssetsState();
}

class _LoginAssetsState extends State<LoginAssets>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(_controller);

    _controller.addListener(() {
      if (mounted && context.mounted) {
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor.withOpacity(0.5)),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    whitecolor,
                        Colors.white,
                      ]),
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Color(0xffFFE4EC),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                         height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: greyColor.withOpacity(0.5)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      whitecolor,
                          Colors.white,
                        ]),
                    shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                            image: const DecorationImage(
                              image: AssetImage(
                                mentor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedRotation(
          turns: 1 - _animation.value,
          duration: const Duration(milliseconds: 0),
          child: Container(
            height: 500,
            width: 500,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  right: 20,
                  left: 0,
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      height: 50,
                      width: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(mentor),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  right: 0,
                  
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      height: 50,
                      width: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(mentor2),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: 100,
                  
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      height: 60,
                      width: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(mentor),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 270.h,
                  right: 0,
                  left: 290,
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      height: 50,
                      width: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(mentor2),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  right: 290,
                  left: 0,
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      height: 50,
                      width: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(mentor2),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 150,
                  right: 200,
                  left: 0,
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      height: 60,
                      width: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        image: const DecorationImage(
                          image: AssetImage(girl),
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
