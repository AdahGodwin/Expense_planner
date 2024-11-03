import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerSpecs {
  double xOffset;
  double yOffset;
  double scaleFactor;
  bool isDrawerOpen;

  DrawerSpecs({
    required this.xOffset,
    required this.yOffset,
    required this.scaleFactor,
    required this.isDrawerOpen,
  });
}

class DrawerNotifier extends StateNotifier<DrawerSpecs> {
  DrawerNotifier()
      : super(DrawerSpecs(
          isDrawerOpen: false,
          xOffset: 0,
          yOffset: 0,
          scaleFactor: 1,
        ));

  void openDrawer() {
    Future.delayed(const Duration(milliseconds: 180), () {
      state = DrawerSpecs(
        isDrawerOpen: true,
        xOffset: 270,
        yOffset: 90,
        scaleFactor: .85,
      );
    });
  }

  void closeDrawer() {
    state = DrawerSpecs(
      isDrawerOpen: false,
      xOffset: 0,
      yOffset: 0,
      scaleFactor: 1,
    );
  }
}

final drawerProvider =
    StateNotifierProvider<DrawerNotifier, DrawerSpecs>((ref) {
  return DrawerNotifier();
});
