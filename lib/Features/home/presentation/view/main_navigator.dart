import 'package:flutter/material.dart';
import 'package:news_app/utils/helper_extensions.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/functions/format_date_string.dart';
import '../../../../utils/text_styles.dart';
import 'widgets/navigator/show_bottom_sheet_button.dart';
import 'widgets/navigator/tab_widget.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 0, left: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("News App", style: Styles.textStyle28),
                Text(
                    formatDateString(DateTime.now().toString())
                        .substring(0, 12),
                    style: Styles.textStyle14)
              ],
            ),
          ),
          actions: const [ShowBottomSheetButton()],
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            dividerHeight: 0,
            labelColor: context.primaryColor(),
            labelPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: context.accentColor(),
            ),
            unselectedLabelStyle: TextStyle(color: context.onPrimaryColor()),
            isScrollable: true,
            tabs: const [
              TabWidget(label: "General"),
              TabWidget(label: "Health"),
              TabWidget(label: "Science"),
              TabWidget(label: "Sports"),
              TabWidget(label: "Technology"),
              TabWidget(label: "Business"),
              TabWidget(label: "Entertainment"),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: categories,
        ),
      ),
    );
  }
}
