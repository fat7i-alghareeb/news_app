import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/utils/helper_extensions.dart';

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
        backgroundColor: context.primaryColor(),
        showDragHandle: true,
        builder: (context) {
          return const Scaffold(
            body: SizedBox(
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
