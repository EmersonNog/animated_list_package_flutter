import 'package:custom_list_animated/animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; 

void main() {
  testWidgets('Teste de animação do CustomListAnimated', (WidgetTester tester) async { 
    await tester.pumpWidget(MaterialApp(
      home: ListAnimated(
        icon: Icons.star,
        color: Colors.blue,
        text: 'Teste',
      ),
    ));
  });
}
