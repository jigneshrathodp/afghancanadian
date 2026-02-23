import 'package:afghancanadian/Auth/signin.dart';
import 'package:flutter/material.dart';
// import 'bottom_nav_screen.dart';

class FinalImageAnimation extends StatefulWidget {
  const FinalImageAnimation({super.key});

  @override
  State<FinalImageAnimation> createState() => _FinalImageAnimationState();
}

class _FinalImageAnimationState extends State<FinalImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blueMoveAnimation;
  late Animation<double> _redEntryAnimation;
  late Animation<double> _blueScaleAnimation;
  late Animation<double> _verticalAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _controller.forward();

    // Navigate to SignIn screen when animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const Signin(),
            ),
          );
        }
      }
    });

    _blueScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.5)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.5, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 60),
    ]).animate(_controller);

    _blueMoveAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 20),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 20,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 60),
    ]).animate(_controller);

    _redEntryAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 40),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0)
            .chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 30,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 30),
    ]).animate(_controller);

    _verticalAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween<double>(0), weight: 80),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
    ]).animate(_controller);

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween<double>(1), weight: 80),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 0).chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final mediaScreenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            // Base logo size
            final baseImageSize = screenWidth * 0.25;
            final spacing = baseImageSize * 0.2;

            // Right side logo size (30% bigger than left)
            final rightLogoSize = baseImageSize * 1.3;

            // Blue logo final position (left side)
            final blueFinalX = (screenWidth / 2) - baseImageSize - spacing;

            // Red logo final position (right side) - adjusted for larger size
            final redFinalX = (screenWidth / 2) + spacing;

            // Center position (Blue starts here)
            final blueStartX = (screenWidth - baseImageSize) / 2;
            final centerY = (screenHeight - baseImageSize) / 2;

            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final blueMoveProgress = _blueMoveAnimation.value;
                final redProgress = _redEntryAnimation.value;
                final blueScale = _blueScaleAnimation.value;
                final vProg = _verticalAnimation.value;
                final opacity = _opacityAnimation.value;

                // Blue logo position
                final bluePosX = blueStartX - ((blueStartX - blueFinalX) * blueMoveProgress);

                // Blue logo scale (size) - up to 150%
                final blueSize = baseImageSize * blueScale;

                // Red logo position
                double redPosX;
                if (redProgress > 0) {
                  redPosX = redFinalX + (screenWidth * redProgress);
                } else {
                  redPosX = redFinalX;
                }

                // Adjust red logo position to account for larger size
                final redPosXAdjusted = redPosX - ((rightLogoSize - baseImageSize) / 2);

                // Vertical movement
                final topPos = centerY - (centerY * vProg);

                return Stack(
                  children: [
                    // Blue logo (up to 150% size)
                    Positioned(
                      left: bluePosX + ((baseImageSize - blueSize) / 2),
                      top: topPos + ((baseImageSize - blueSize) / 2),
                      child: Opacity(
                        opacity: opacity,
                        child: _buildLogo(
                          'assets/greenacic.png',
                          blueSize,
                          Colors.blue,
                          "BLUE",
                        ),
                      ),
                    ),

                    // Red logo (increased size - 30% bigger)
                    Positioned(
                      left: redPosXAdjusted,
                      top: topPos - ((rightLogoSize - baseImageSize) / 2),
                      child: Opacity(
                        opacity: opacity,
                        child: _buildLogo(
                          'assets/blackacic.png',
                          rightLogoSize,
                          Colors.red,
                          "RED",
                        ),
                      ),
                    ),
                    
                    // Bottom spacing
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: mediaScreenHeight * 0.05 > 60 ? 60 : mediaScreenHeight * 0.05
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo(String path, double size, Color color, String label) {
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => Container(
        width: size,
        height: size,
        color: color.withOpacity(0.8),
        child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}