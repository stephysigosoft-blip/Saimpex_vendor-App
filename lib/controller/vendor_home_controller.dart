class VendorHomeLayoutConfig {
  const VendorHomeLayoutConfig({
    required this.horizontalPadding,
    required this.topOffset,
    required this.membershipCardHeight,
    required this.dashboardButtonHeight,
    required this.tabsHeight,
    required this.tabWidth,
    required this.searchBoxWidth,
  });

  final double horizontalPadding;
  final double topOffset;
  final double membershipCardHeight;
  final double dashboardButtonHeight;
  final double tabsHeight;
  final double tabWidth;
  final double searchBoxWidth;
}

class VendorHomeController {
  const VendorHomeController();

  VendorHomeLayoutConfig getLayoutConfig({
    required double screenWidth,
    required double screenHeight,
    required double topPadding,
  }) {
    final horizontalPadding = (screenWidth * 0.04).clamp(16.0, 24.0).toDouble();
    final topSpacing = (screenHeight * 0.035).clamp(48.0, 72.0).toDouble();
    final membershipCardHeight = (screenHeight * 0.075)
        .clamp(56.0, 72.0)
        .toDouble();
    final dashboardButtonHeight = (screenHeight * 0.055)
        .clamp(42.0, 52.0)
        .toDouble();
    final tabsHeight = (screenHeight * 0.048).clamp(36.0, 44.0).toDouble();
    final tabWidth = (screenWidth * 0.28).clamp(96.0, 124.0).toDouble();
    final searchBoxWidth = screenWidth - (horizontalPadding * 2);

    return VendorHomeLayoutConfig(
      horizontalPadding: horizontalPadding,
      topOffset: topPadding + topSpacing,
      membershipCardHeight: membershipCardHeight,
      dashboardButtonHeight: dashboardButtonHeight,
      tabsHeight: tabsHeight,
      tabWidth: tabWidth,
      searchBoxWidth: searchBoxWidth,
    );
  }
}
