import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../utils/text_styles.dart';

class ShowBottomSheetButton extends StatelessWidget {
  const ShowBottomSheetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  HapticFeedback.heavyImpact();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "images/expand-button.png",
                    height: 23,
                  ),
                ),
              ),
            ),
            body: const SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Text(
                    '"SOON"',
                    style: Styles.textStyle28,
                  ),
                )),
          );
        },
      ),
      icon: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.settings,
          size: 25,
        ),
      ),
    );
  }
}
