import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'details_product_model.dart';
export 'details_product_model.dart';

class DetailsProductWidget extends StatefulWidget {
  const DetailsProductWidget({
    super.key,
    required this.nameProduct,
    required this.imgProduct,
  });

  final String? nameProduct;
  final String? imgProduct;

  @override
  State<DetailsProductWidget> createState() => _DetailsProductWidgetState();
}

class _DetailsProductWidgetState extends State<DetailsProductWidget> {
  late DetailsProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsProductModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DetailsProduct'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DETAILS_PRODUCT_DetailsProduct_ON_INIT_S');
      logFirebaseEvent('DetailsProduct_gemini');
      await geminiGenerateText(
        context,
        valueOrDefault<String>(
          'Make a description of  ${widget.nameProduct}',
          'geminiDescription',
        ),
      ).then((generatedText) {
        safeSetState(() => _model.geminiDescription = generatedText);
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          widget.imgProduct!,
                          width: double.infinity,
                          height: 340.0,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.85, -0.4),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: const Color(0x7F0F1113),
                              icon: const Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'DETAILS_PRODUCT_close_rounded_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.nameProduct,
                                'Title',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.geminiDescription,
                                'loading...',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('DETAILS_PRODUCT_SEARCH_IN_LIVERPOOL_BTN_');
                logFirebaseEvent('Button_launch_u_r_l');
                await launchURL(functions.getLink(widget.nameProduct!));
              },
              text: 'Search in Liverpool',
              options: FFButtonOptions(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Space Grotesk',
                      color: Colors.white,
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ].addToEnd(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
