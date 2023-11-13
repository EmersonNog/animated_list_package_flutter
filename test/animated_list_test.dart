import 'package:animated_list/animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; 

void main() {
  testWidgets('Teste de animação do CustomListAnimated', (WidgetTester tester) async { 
    await tester.pumpWidget(MaterialApp(
      home: ListAnimated(
        icon: Icons.star,
        colorBorder: Colors.grey,
        colorShine: Colors.amber,
        duration: Duration(seconds: 2),
        horizontalOffset: 500,
        text: 'Teste', 
        colorIcon: Colors.red, 
        colorText: Colors.black,
      ),
    ));
  });
}
