import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  RangeSelectorPage({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> min = useState<int>(0);
    final ValueNotifier<int> max = useState<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (val) => min.value = val,
        maxValueSetter: (val) => max.value = val,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RandomizerPage(
                min: min.value,
                max: max.value,
              ),
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
