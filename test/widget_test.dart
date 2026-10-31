import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tarea_flutter/main.dart';

void main() {
  testWidgets('El contador suma y se reinicia', (WidgetTester tester) async {
    await tester.pumpWidget(const MiApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add_task));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Reiniciar'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });
}
