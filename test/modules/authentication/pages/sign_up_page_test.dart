import 'package:example_financy/app/app_module.dart';
import 'package:example_financy/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("", (tester) async {
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    );
  });
}
