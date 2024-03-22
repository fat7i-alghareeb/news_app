import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../utils/functions/format_date_string.dart';
import '../../../../utils/text_styles.dart';
import 'news_screen.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({super.key});

  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const NewsScreen(category: "general"),
      const NewsScreen(category: "health"),
      const NewsScreen(category: "science"),
      const NewsScreen(category: "sports"),
      const NewsScreen(category: "technology"),
      const NewsScreen(category: "business"),
      const NewsScreen(category: "entertainment"),
    ];
    return DefaultTabController(
      length: screens.length,
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
          actions: [
            IconButton(
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
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            dividerHeight: 0,
            labelColor: Theme.of(context).colorScheme.primary,
            labelPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.pink[300],
            ),
            unselectedLabelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
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
          children: screens,
        ),
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  final String label;
  const TabWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Tab(text: label),
    );
  }
}
