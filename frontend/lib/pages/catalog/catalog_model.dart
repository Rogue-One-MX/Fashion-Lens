import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'catalog_widget.dart' show CatalogWidget;
import 'package:flutter/material.dart';

class CatalogModel extends FlutterFlowModel<CatalogWidget> {
  ///  Local state fields for this page.

  bool hasSearched = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<LiverpoolDBRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
