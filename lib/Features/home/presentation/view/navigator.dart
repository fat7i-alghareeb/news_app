import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/utils/helper_extensions.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/functions/format_date_string.dart';
import '../../../../utils/text_styles.dart';
import 'widgets/navigator/show_bottom_sheet_button.dart';
import 'widgets/navigator/tab_widget.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: context.primaryColor(),
      ),
    );
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
              color: const Color(0xFFF06292),
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
