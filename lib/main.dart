import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final webviewController = WebviewController();

  final String appsmithUrl =
      'https://admin.foodly-app.net/app/orders-evasion/home-67eef9bd44b7ae1104c914fb';

  @override
  void initState() {
    super.initState();
    initWebView();
  }

  Future<void> initWebView() async {
    await webviewController.initialize();
    await webviewController.loadUrl(appsmithUrl);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appsmith Viewer',
      home: Scaffold(
        body: webviewController.value.isInitialized
            ? Webview(webviewController)
            : const Center(child: CircularProgressIndicator()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
