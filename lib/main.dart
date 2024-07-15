import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'app1/counter.dart';
import 'app2/animations.dart';
import 'app3/isolate.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigation',
      theme: ThemeData(primaryColor: Colors.blueGrey),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: [
        GoRoute(
          path: 'counter',
          builder: (context, state) => const CounterHomePage(),
        ),
        GoRoute(
          path: 'animations',
          builder: (context, state) => const AnimationsPage(),
        ),
        GoRoute(
          path: 'isolate',
          builder: (context, state) => const IsolatePage(),
        ),
        for (final demo in basicDemos)
          GoRoute(
            path: demo.route,
            builder: (context, state) => demo.builder(context),
          ),
        for (final demo in miscDemos)
          GoRoute(
            path: demo.route,
            builder: (context, state) => demo.builder(context),
          ),
      ],
    ),
  ],
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.go('/counter');
              },
              child: const Text('Provider Counter'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/animations');
              },
              child: const Text("Animations"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/isolate');
              },
              child: const Text("Isolate"),
            ),
          ],
        ),
      ),
    );
  }
}
