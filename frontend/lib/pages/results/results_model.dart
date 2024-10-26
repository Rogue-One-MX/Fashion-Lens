import '/components/meal_card/meal_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'results_widget.dart' show ResultsWidget;
import 'package:flutter/material.dart';

class ResultsModel extends FlutterFlowModel<ResultsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for mealCard component.
  late MealCardModel mealCardModel;

  @override
  void initState(BuildContext context) {
    mealCardModel = createModel(context, () => MealCardModel());
  }

  @override
  void dispose() {
    mealCardModel.dispose();
  }
}
