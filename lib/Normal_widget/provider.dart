
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class PageProvider with ChangeNotifier {

  int currentIndex = 0;
  bool isLoading = false;

  final LiquidController controller = LiquidController();

  // page change হলে call হবে
  void setPage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // Next button
  void nextPage(int totalPages) {
    if (currentIndex < totalPages - 1) {
      currentIndex++;
      controller.jumpToPage(page: currentIndex);
      notifyListeners();
    }
  }

  // Skip button (last page)
  void skipPage(int totalPages) {
    currentIndex = totalPages - 1;
    controller.jumpToPage(page: currentIndex);
    notifyListeners();
  }

  // optional: first page এ যাওয়ার জন্য
  void resetPage() {
    currentIndex = 0;
    controller.jumpToPage(page: currentIndex);
    notifyListeners();
  }
}
