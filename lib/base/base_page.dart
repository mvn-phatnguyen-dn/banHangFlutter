import 'package:final_flutter_project/base/base_view_model.dart';
import 'package:final_flutter_project/base/disposable.dart';
import 'package:flutter/material.dart';

abstract class BasePage<ViewModel extends BaseViewModel>
    extends StatefulWidget {
  final ViewModel viewModel;
  const BasePage({Key? key, required this.viewModel}) : super(key: key);
}

abstract class BasePageState<Page extends BasePage> extends State<Page>
    with DisposableMixin {
  @override
  void initState() {
    super.initState();
    bind();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    widget.viewModel.cancelSubscriptions();
    cancelSubscriptions();
    super.dispose();
  }

  void bind();
}
