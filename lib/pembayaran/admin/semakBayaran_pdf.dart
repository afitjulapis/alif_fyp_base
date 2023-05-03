import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../Riverpod/user_data.dart';

class SemakPDF extends ConsumerStatefulWidget {
  final fileURL;
  final userID;
  final docID;
  final pendDoc;
  SemakPDF({required this.fileURL,this.userID,this.docID,this.pendDoc});
  
  @override
  ConsumerState<SemakPDF> createState() => _SemakPDFState();
}
  

// 2. extend [ConsumerState]
class _SemakPDFState extends ConsumerState<SemakPDF> {
  String pathPDF = "";
  var dataBytes;
  Future<File> createFileOfPdfUrl() async {
    final url = widget.fileURL;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    dataBytes=bytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename.pdf');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    Widget child = const Center(child: CircularProgressIndicator());
    if (dataBytes != null) {
      child = SfPdfViewer.memory(
        
        dataBytes!,
      );
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: const Text('Semak Bayaran')),
      floatingActionButton: 
        dataBytes!=null?
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                heroTag: "btn1",
                backgroundColor: Colors.red,
                onPressed: (){
                  updateDataPay(widget.userID, widget.docID, 'TIDAK BERJAYA').then((value){
                    print(ref.read(currentPendID));
                    print(widget.pendDoc);
                    deleteData(widget.pendDoc).then((value){
                      ref.invalidate(getPendPay);
                      Navigator.pop(context);
                    });
                  });
                }, 
                label: Text('Batalkan Bayaran'),
                icon: Icon(Icons.close),
              ),
              SizedBox(height: h*0.02,),
              FloatingActionButton.extended(
                heroTag: "btn12",
                backgroundColor: Colors.green,
                onPressed: (){
                  updateDataPay(widget.userID, widget.docID, 'BERJAYA').then((value){
                    print(ref.read(currentPendID));
                    print(widget.pendDoc);
                    deleteData(widget.pendDoc).then((value){
                      ref.invalidate(getPendPay);
                      Navigator.pop(context);
                      
                    });
                  });
                }, 
                label: Text('Sahkan Bayaran'),
                icon: Icon(Icons.check),
              ),
            ],
          ):
          Container(),
      body: Column(
        children: [
          Expanded(child: child)
        ],
      ),
    );
  }
}