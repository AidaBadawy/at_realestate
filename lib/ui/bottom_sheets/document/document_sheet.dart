import 'dart:io';

import 'package:flutter/material.dart';
import 'package:aisu_realestate/ui/common/ui_helpers.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'document_sheet_model.dart';

class DocumentSheet extends StackedView<DocumentSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DocumentSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DocumentSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? 'Hello Stacked Sheet!!',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
          ),
          verticalSpaceMedium,
          request.data.extension == "pdf"
              ? Expanded(
                  child: PDFView(
                    filePath: request.data.path,
                    enableSwipe: true,
                    swipeHorizontal: false,
                    autoSpacing: false,
                    pageFling: false,
                    // onRender: (pages) {
                    //   setState(() {
                    //     pages = pages;
                    //     isReady = true;
                    //   });
                    // },
                    onError: (error) {
                      debugPrint(error.toString());
                    },
                    onPageError: (page, error) {
                      debugPrint('$page: ${error.toString()}');
                    },
                    // onViewCreated: (PDFViewController pdfViewController) {
                    //   _controller.complete(pdfViewController);
                    // },
                    // onPageChanged: (int page, int total) {
                    //   print('page change: $page/$total');
                    // },
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: Image.file(
                    File(request.data.path),
                    fit: BoxFit.cover,
                  ),
                ),
          verticalSpaceLarge,
        ],
      ),
    );
  }

  @override
  DocumentSheetModel viewModelBuilder(BuildContext context) =>
      DocumentSheetModel();
}
