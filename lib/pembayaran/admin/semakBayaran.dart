import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SemakBayaran extends StatefulWidget {
  final url;
  final userID;
  SemakBayaran(this.url,this.userID);
  @override
  _SemakBayaranState createState() => _SemakBayaranState();
}

class _SemakBayaranState extends State<SemakBayaran> {
  var url ='';
  WebViewController controller = WebViewController();
  @override
  void initState() {
    url = widget.url;
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
    ..loadRequest(Uri.parse(url));
  }
  
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
