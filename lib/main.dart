import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiring_test/features/product/product.dart';
import 'package:hiring_test/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: TestApp()));
}

class TestApp extends StatefulHookConsumerWidget {
  const TestApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestAppState();
}

class _TestAppState extends ConsumerState<TestApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductPage(),
    );
  }
}
