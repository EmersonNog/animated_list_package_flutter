// lib/list_animated.dart
library list_animated;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';  

class ListAnimated extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;

  const ListAnimated({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
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
      duration: const Duration(seconds: 2),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
    return Material( // Adicionando um Material como ancestral mais próximo
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(seconds: 2),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,  // Ajuste conforme necessário
              curve: Curves.fastEaseInToSlowEaseOut,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: Color.fromARGB(115, 218, 211, 211),
                    ),
                  ),
                  leading: Icon(
                    widget.icon,
                    color: widget.color,
                  ),
                  title: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade300,
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                        color: Color.fromARGB(222, 255, 255, 255),
                      ),
                    ),
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
