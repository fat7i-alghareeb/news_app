import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/utils/constants.dart';

Future<void> checkCache(
    {bool clearNow = false, required String category}) async {
  var box = Hive.box<int>("time");

  if (box.values.isEmpty) {
    await box.add(DateTime.now().millisecondsSinceEpoch);
  } else {
    int savedTimestamp = box.getAt(0)!;
    var savedTime = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
    var currentTime = DateTime.now();
    var difference = currentTime.difference(savedTime).inMinutes;

    if (difference >= 5 || clearNow) {
      await Hive.box<List<dynamic>>(kArticlesBox).put(category, []);
      box.putAt(0, DateTime.now().millisecondsSinceEpoch);
    }
  }
}
