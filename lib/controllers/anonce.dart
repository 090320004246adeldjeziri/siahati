import 'package:achref_siaha/model/anonce.dart';
import 'package:get/get.dart';

class AnnouncementController extends GetxController {
  var announcements = <AnnouncementModel>[].obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the announcements list here
    announcements.addAll([
      AnnouncementModel(
        imageUrl: 'assets/images/s.png',
        title: 'Announcement 1',
        description: 'This is the first announcement.',
      ),
      AnnouncementModel(
        imageUrl: 'assets/images/a.png',
        title: 'Announcement 2',
        description: 'This is the second announcement.',
      ),
    ]);
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void previousAnnouncement() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void nextAnnouncement() {
    if (currentIndex.value < announcements.length - 1) {
      currentIndex.value++;
    }
  }
}
