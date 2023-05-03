import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:tuple/tuple.dart';

import '../../Riverpod/user_data.dart';

class PackageScreen extends ConsumerStatefulWidget {
  final dataPelajar;
  PackageScreen(this.dataPelajar);
  @override
  ConsumerState<PackageScreen> createState() => _PackageScreenState();
}

// 2. extend [ConsumerState]
class _PackageScreenState extends ConsumerState<PackageScreen> {
  int quantty = 0;
  List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<bool> _isSelected = List.generate(12, (_) => false);
  final _yearController = TextEditingController(
    text: DateFormat('yyyy').format(DateTime.now()),
  );

  bool get _isValidInput =>
      quantty != null && quantty > 0 && _isSelected.any((isSelected) => isSelected);
  
  var totalHarga = 0;
  int count =0;
  File _selectedFile=File('');
  var fileName='';

  Widget _previewWidget=SizedBox();
  final FirebaseStorage storage = FirebaseStorage.instance;
  


  Widget _buildPdfContainer(String label) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.picture_as_pdf),
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        fileName =result.files.single.name;
      });
      if (_selectedFile.path.endsWith('.pdf')) {
        setState(() {
          _previewWidget = _buildPdfContainer(result.files.single.name);
        });
      } else if (_selectedFile.path.endsWith('.jpg') ||
                _selectedFile.path.endsWith('.jpeg') ||
                _selectedFile.path.endsWith('.png')) {
        setState(() {
          _previewWidget = Image.file(_selectedFile);
        });
      }
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dataPelajar);
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer(builder: (context, ref, child) {
              return ref.watch(getThpdetails(widget.dataPelajar['tahap'])).when(
                data: (dataPakej){
                  totalHarga =dataPakej['pakej'][widget.dataPelajar['pakej']]['harga'];
                  return Card(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pakej '+widget.dataPelajar['pakej'],
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            ''+widget.dataPelajar['tahap'].toString(),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            dataPakej['pakej'][widget.dataPelajar['pakej']]['bilSubjek'].toString() +" subjek",
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Subjek : '+widget.dataPelajar['subjek'].toString(),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'RM '+dataPakej['pakej'][widget.dataPelajar['pakej']]['harga'].toString() +"/bulan",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, 
                error: (error,st){
                  return Text('error');
                }, 
                loading: (){
                  return Text('loading');
                }
              );
            },),
            
            SizedBox(height: 16.0),
            Text(
              'Kuantiti Bayaran:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if(value.length==0){
                  setState(() {
                    quantty = 0;
                  });
                }else{
                  setState(() {
                    quantty = int.tryParse(value)!;
                  });
                }
                
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Sila isi bilangan bulan',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tahun Bayaran:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _yearController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _yearController.text = value.toString();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Sila isi bilangan bulan',
              ),
            ),
            SizedBox(height: 16.0),
            quantty>0?
            Text(
              'Bulan ingin dibayar:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ):SizedBox(),
            SizedBox(height: 8.0),
            quantty>0?
            Wrap(
              spacing: 8.0,
              children: List<Widget>.generate(
                12,
                (index) => ChoiceChip(
                  selectedColor: Colors.yellow,
                  label: Text(_months[index]),
                  selected: _isSelected[index],
                  onSelected: (selected) {
                    print(selected);
                    print(quantty);
                    if(!selected){
                      setState(() {
                        _isSelected[index] = selected;
                        count = _isSelected.where((element) => element == true).length;
                        print(_isSelected);
                      });
                    }else{
                      if(count+1>quantty){
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: Text("Bilangan Bulan Melebihi"),
                        //       content: Text('Hanya pilih' +quantty.toString()+' bulan sahaja.'),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           child: Text('Close'),
                        //           onPressed: () {
                        //             Navigator.of(context).pop();
                        //           },
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                      }else{
                        setState(() {
                          _isSelected[index] = selected;
                          count = _isSelected.where((element) => element == true).length;
                          print(_isSelected);
                        });
                      }
                    }
                    
                    
                  },
                ),
              ).toList(),
            ):SizedBox(),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Pilih Resit'),
            ),
            SizedBox(height: 8.0),
            Expanded(child: _previewWidget != null ? _previewWidget : Container()),
          ],
        ),
      ),
      floatingActionButton: _isValidInput && count==quantty && _selectedFile.path.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () async {
                Random random = Random();
                int randomNumber = random.nextInt(100000000);
                String randomString = randomNumber.toString();
                String extensionName = extension(fileName);
                String finalRef = 'rekodBayaran/'+randomString + extensionName;

                Reference reference = storage.ref().child(finalRef);
                print(finalRef);
                UploadTask task;
                if(extensionName=='.pdf'){
                  print('pdf');
                  task = reference.putData(await _selectedFile.readAsBytesSync(),SettableMetadata(contentType: 'file/pdf'));
                }else{
                  task = reference.putFile(_selectedFile);
                }
                try{
                  await task.whenComplete(() async {
                    var listMonth =[];
                    for (var i = 0; i < _isSelected.length; i++) {
                      if(_isSelected[i]){
                        listMonth.add(_months[i]);
                      }
                    }
                    var title='';
                    if(listMonth.length>1){
                      title = 'Bayaran ';
                      listMonth.forEach((element) {
                        title+= element+',';
                      });
                      title = title.substring(0, title.length - 1);
                      title+= ' '+ _yearController.text;
                    }else{
                      title = 'Bayaran '+listMonth.first +' '+  _yearController.text;
                    }
                    ref.read(addNewPay(Tuple2([quantty,listMonth,randomString,totalHarga,totalHarga*quantty,widget.dataPelajar['pakej'],widget.dataPelajar['tahap'],_yearController.text,title,extensionName], ref)));
                    ref.read(addPendingPay(Tuple2([quantty,listMonth,randomString,totalHarga,totalHarga*quantty,widget.dataPelajar['pakej'],widget.dataPelajar['tahap'],_yearController.text,title,extensionName,ref.read(userUID),widget.dataPelajar['name']], ref)));
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Bayaran Direkodkan"),
                          content: Text('Sila tunggu pengesahan dari pihak pentadbiran'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Tutup'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );

                  });
                }catch(e){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Ralat"),
                        content: Text(e.toString()),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                // task.snapshotEvents.listen((TaskSnapshot snapshot) {
                //   double progress =
                //       (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                //   print('Upload progress: $progress%');
                // }, onError: (Object e) {
                //   print(e.toString());
                // }, onDone: () async {
                //   String downloadURL = await reference.getDownloadURL();
                //   print('Download URL: $downloadURL');
                // });
              },
              label: Text('Rekodkan bayaran RM '+(totalHarga*quantty).toString()),
              icon: Icon(Icons.check),
            )
          : null,
    );
  }
  
}
