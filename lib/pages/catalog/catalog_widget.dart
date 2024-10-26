import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/meal_card/meal_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:text_search/text_search.dart';
import 'catalog_model.dart';
export 'catalog_model.dart';

class CatalogWidget extends StatefulWidget {
  const CatalogWidget({super.key});

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  late CatalogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Catalog'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CATALOG_PAGE_Catalog_ON_INIT_STATE');
      logFirebaseEvent('Catalog_auth');
      GoRouter.of(context).prepareAuthEvent();
      final user = await authManager.signInAnonymously(context);
      if (user == null) {
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Catalog',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Text(
                              'Found what fits your style!',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Space Grotesk',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Liverpool.png',
                            width: 75.0,
                            height: 75.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 200.0,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Space Grotesk',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'What are you looking for today?',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Space Grotesk',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Space Grotesk',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 50.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('CATALOG_PAGE_search_ICN_ON_TAP');
                        if (_model.textController.text != '') {
                          logFirebaseEvent('IconButton_simple_search');
                          await queryLiverpoolDBRecordOnce()
                              .then(
                                (records) => _model.simpleSearchResults =
                                    TextSearch(
                                  records
                                      .map(
                                        (record) => TextSearchItem.fromTerms(
                                            record, [record.name]),
                                      )
                                      .toList(),
                                )
                                        .search(_model.textController.text)
                                        .map((r) => r.object)
                                        .take(8)
                                        .toList(),
                              )
                              .onError(
                                  (_, __) => _model.simpleSearchResults = [])
                              .whenComplete(() => safeSetState(() {}));

                          logFirebaseEvent('IconButton_update_page_state');
                          _model.hasSearched = true;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('IconButton_update_page_state');
                          _model.hasSearched = false;
                          safeSetState(() {});
                        }
                      },
                    ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
                if (!_model.hasSearched)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: StreamBuilder<List<LiverpoolDBRecord>>(
                        stream: queryLiverpoolDBRecord(
                          queryBuilder: (liverpoolDBRecord) =>
                              liverpoolDBRecord.orderBy('SKU'),
                          limit: 10,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<LiverpoolDBRecord>
                              listViewLiverpoolDBRecordList = snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewLiverpoolDBRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewLiverpoolDBRecord =
                                  listViewLiverpoolDBRecordList[listViewIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    9.0, 0.0, 9.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CATALOG_PAGE_Container_kia8ikej_ON_TAP');
                                    logFirebaseEvent('mealCard_navigate_to');

                                    context.pushNamed(
                                      'DetailsProduct',
                                      queryParameters: {
                                        'nameProduct': serializeParam(
                                          listViewLiverpoolDBRecord.name,
                                          ParamType.String,
                                        ),
                                        'imgProduct': serializeParam(
                                          listViewLiverpoolDBRecord.imagen1,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: MealCardWidget(
                                    key: Key(
                                        'Keykia_${listViewIndex}_of_${listViewLiverpoolDBRecordList.length}'),
                                    imageProduct:
                                        listViewLiverpoolDBRecord.imagen1,
                                    nameProduct: listViewLiverpoolDBRecord.name,
                                    numberSKU: listViewLiverpoolDBRecord.sku,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                if (_model.hasSearched)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Builder(
                        builder: (context) {
                          final myItemSearched = _model.simpleSearchResults
                              .toList()
                              .take(8)
                              .toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: myItemSearched.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                            itemBuilder: (context, myItemSearchedIndex) {
                              final myItemSearchedItem =
                                  myItemSearched[myItemSearchedIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    9.0, 0.0, 9.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CATALOG_PAGE_Container_aqs5qkre_ON_TAP');
                                    logFirebaseEvent('mealCard_navigate_to');

                                    context.pushNamed(
                                      'DetailsProduct',
                                      queryParameters: {
                                        'nameProduct': serializeParam(
                                          myItemSearchedItem.name,
                                          ParamType.String,
                                        ),
                                        'imgProduct': serializeParam(
                                          myItemSearchedItem.imagen1,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: MealCardWidget(
                                    key: Key(
                                        'Keyaqs_${myItemSearchedIndex}_of_${myItemSearched.length}'),
                                    imageProduct: myItemSearchedItem.imagen1,
                                    nameProduct: myItemSearchedItem.name,
                                    numberSKU: myItemSearchedItem.sku,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
