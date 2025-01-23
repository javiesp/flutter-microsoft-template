import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart'; // Para usar kIsWeb

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      // Esto solo se ejecuta en dispositivos móviles (Android/iOS)
      _controller = WebViewController();
      _controller.loadRequest(Uri.parse('https://flutter.dev/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Container'),
      ),
      body: kIsWeb
          ? Center(child: Text("WebView no está disponible en la web."))
          : WebViewWidget(controller: _controller), // Solo en móvil
    );
  }
}
