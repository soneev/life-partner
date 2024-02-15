import 'package:flutter/material.dart';

import 'package:lifepartner/view/update_profile/update_profile_provider.dart';
import 'package:provider/provider.dart';

class heightPicker extends StatelessWidget {
  const heightPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final staticProvider = Provider.of<UpdateProvider>(context, listen: false);
    return SizedBox(
      height: 40,
      child: Consumer<UpdateProvider>(builder: (context, provider, child) {
        return DropdownButton<int>(
          value: staticProvider.selectedHeight,
          onChanged: (newValue) {
            staticProvider.setSelectedHeight(newValue!);
          },
          items: staticProvider.heightValues
              .map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text('$value cm'),
            );
          }).toList(),
        );
      }),
    );
  }
}
