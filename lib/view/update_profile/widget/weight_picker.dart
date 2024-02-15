import 'package:flutter/material.dart';
import 'package:lifepartner/view/update_profile/update_profile_provider.dart';
import 'package:provider/provider.dart';

class WeightPicker extends StatelessWidget {
  const WeightPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final staticProvider = Provider.of<UpdateProvider>(context, listen: false);
    return SizedBox(
      height: 40,
      child: Consumer<UpdateProvider>(builder: (context, provider, child) {
        return DropdownButton<int>(
          value: provider.selectedWeight,
          onChanged: (newValue) {
            staticProvider.setSelectedWeight(newValue!);
          },
          items: provider.weightValues.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text('$value Kg'),
            );
          }).toList(),
        );
      }),
    );
  }
}
