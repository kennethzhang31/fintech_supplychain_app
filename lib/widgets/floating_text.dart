import 'package:flutter/material.dart';

class floatingWidget extends StatefulWidget {

  final Widget child;
  final double dx;
  final double dy;
  final Duration duration;

  floatingWidget({
    required this.child,
    this.dx = 10.0,
    this.dy = 3.0,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<floatingWidget> createState(){
    return _floatingWidget();
  }
}
 
class _floatingWidget extends State<floatingWidget> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animationX;
  late Animation<double> _animationY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse:true);

    _animationX = Tween<double>(begin: -widget.dx, end: widget.dx).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _animationY = Tween<double>(begin: -widget.dy, end: widget.dy).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animationX.value, _animationY.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}