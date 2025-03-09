import 'package:example_financy/app/modules/home/_export_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStoreState _homeStoreState;
  late final HomeStoreAction _homeStoreAction;

  @override
  void initState() {
    super.initState();
    _homeStoreState = Modular.get<HomeStoreState>();
    _homeStoreAction = Modular.get<HomeStoreAction>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Home Page")),
            ElevatedButton(
              onPressed: () async => _homeStoreAction.signOut(),
              child: const Text("Sair"),
            ),
          ],
        ),
      );
    });
  }
}
