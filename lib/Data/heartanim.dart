import 'package:flutter/material.dart';

class likeAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? ending;
  final alwaysAnimate;

  const likeAnimationWidget({
    Key? key,
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(milliseconds: 150),
    this.ending,
    this.alwaysAnimate = false,
  }) : super(key: key);

  @override
  _likeAnimationWidgetState createState() => _likeAnimationWidgetState();
}

class _likeAnimationWidgetState extends State<likeAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    final halfDuration = widget.duration.inMilliseconds ~/ 2;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: halfDuration),
    );

    _scale = Tween<double>(begin: 1, end: 1.2).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant likeAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      doingAnimation();
    }
  }

  Future doingAnimation() async {
    if(widget.isAnimating || widget.alwaysAnimate) {
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(Duration(milliseconds: 400));

      if (widget.ending != null) {
        widget.ending!();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      child: widget.child,
      scale: _scale,
    );
  }
}