import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants.dart';
import 'news_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // int _selectedIndex = 0;
  final List<Widget> _screens = [
    const NewsScreen(category: "general"),
    const NewsScreen(category: "health"),
    const NewsScreen(category: "science"),
    const NewsScreen(category: "sports"),
    const NewsScreen(category: "technology"),
    const NewsScreen(category: "business"),
    const NewsScreen(category: "entertainment"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
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
                const Text(
                  "News App",
                  style: TextStyle(
                    fontSize: 28,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Font2",
                    color: Colors.pink,
                  ),
                ),
                Text(
                  formatDateString(DateTime.now().toString()).substring(0, 12),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontFamily: "Font1",
                    fontStyle: FontStyle.italic,
                  ),
                )
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
                    body: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            '"SOON"',
                            style: TextStyle(
                              fontFamily: "font2",
                              fontSize: 30,
                              color: Colors.grey[350],
                            ),
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
          children: _screens,
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
