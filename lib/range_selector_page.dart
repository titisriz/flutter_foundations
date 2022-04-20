import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (val) => _min = val,
        maxValueSetter: (val) => _max = val,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RandomizerPage(min: _min, max: _max),
            ));
          }
        },
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
