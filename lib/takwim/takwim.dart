import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewerPage extends StatefulWidget {

  @override
  _WebViewerPageState createState() => _WebViewerPageState();
}

class _WebViewerPageState extends State<WebViewerPage> {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://drive.google.com/file/d/1tPJdhoFeD8s1h10kYJU80xruXIop9zx0/view?usp=share_link'));
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadual Kelas'),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          _isLoading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.reload();
          setState(() {
            _isLoading = true;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
