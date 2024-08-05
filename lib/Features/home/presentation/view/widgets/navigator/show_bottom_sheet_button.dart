import 'package:flutter/material.dart';
import 'package:news_app/Features/home/presentation/view/widgets/navigator/theme_switch.dart';
import 'package:news_app/utils/helper_extensions.dart';
import 'package:news_app/utils/text_styles.dart';

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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        builder: (context) {
          return const BottomSheetBody();
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

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: context.primaryColor(),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Settings",
            style: Styles.textStyle28,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ThemeSwitch(),
          ),
        ],
      ),
    );
  }
}
