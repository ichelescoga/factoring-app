import 'package:flutter/material.dart';

class CustomAnimatedExpandCard extends StatefulWidget {
  CustomAnimatedExpandCard({
    Key? key,
    required this.child,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final String title;
  final String subtitle;
  final void Function(bool)? onTap;

  @override
  State<CustomAnimatedExpandCard> createState() =>
      _CustomAnimatedExpandCardState();
}

class _CustomAnimatedExpandCardState extends State<CustomAnimatedExpandCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.isDismissed
          ? _controller.forward()
          : _controller.reverse();
          widget.onTap!(_controller.isDismissed);
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: Text(widget.title),
              subtitle: Text(widget.subtitle),
            ),
            SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                width: double.infinity,
                child: widget.child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
