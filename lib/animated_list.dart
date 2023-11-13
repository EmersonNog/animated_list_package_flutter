// lib/list_animated.dart
library list_animated;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

class ListAnimated extends StatefulWidget {
  final IconData icon;
  final Color colorIcon;
  final Color colorText;
  final String text;
  final double? horizontalOffset;
  final Duration? duration;
  final Color? colorShine;
  final Color? colorBorder;

  const ListAnimated({
    Key? key,
    required this.icon,
    required this.colorIcon,
    required this.colorText,
    required this.text,
    this.horizontalOffset,
    this.duration,
    this.colorShine,
    this.colorBorder,
  }) : super(key: key);

  @override
  ListAnimatedState createState() => ListAnimatedState();
}

class ListAnimatedState extends State<ListAnimated>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();

    // Configurar controladores de animação
    _slideController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 2),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 2),
    );

    // Iniciar animações
    _slideController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // Adicionando um Material como ancestral mais próximo
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: widget.duration ?? const Duration(seconds: 2),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: widget is ListAnimated ? widget.horizontalOffset : 50.0,
              curve: Curves.fastEaseInToSlowEaseOut,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: widget.colorBorder ?? const Color.fromARGB(115, 218, 211, 211),
                    ),
                  ),
                  leading: Icon(
                    widget.icon,
                    color: widget.colorIcon,
                  ),
                  title: Shimmer.fromColors(
                    baseColor: widget.colorText,
                    highlightColor: widget.colorShine ?? Colors.grey.shade300,
                    child: Text(widget.text),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}