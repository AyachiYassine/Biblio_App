import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:ayachi_biblio/models/livre.dart';

class view_pdf extends StatefulWidget {
  final Livre lvr;
  const view_pdf({Key? key, required this.lvr}) : super(key: key);
  @override
  State<view_pdf> createState() => _view_pdfState();
}

class _view_pdfState extends State<view_pdf> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset(widget.lvr.dir, '${widget.lvr.name}.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Builder(
        builder: (BuildContext context) {
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  child: Text(
                    'Bonne lecture et bon courage 🙏\n\t\t\t\t\t\t    ( Vers le Document )',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (pathPDF.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(
                            path: pathPDF,
                            lvr: widget.lvr,
                          ),
                        ),
                      );
                    }
                  },
                )
              ]));
        },
      )),
    );
  }
}

class PDFScreen extends StatefulWidget {
  final String? path;
  final Livre lvr;

  const PDFScreen({Key? key, this.path, required this.lvr}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final text = 'Page : ${currentPage! + 1} / $pages  ';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lvr.name + " - " + widget.lvr.publisher),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            autoSpacing: false,
            pageFling: false,
            pageSnap: false,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
    );
  }
}
