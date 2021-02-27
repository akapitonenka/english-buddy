enum RouteName {
  Home,
  Second,
  Categories,
  SubCategories,
}

extension RouteNameExtension on RouteName {
  String get name {
    switch (this) {
      case RouteName.Home:
        return '/';
      case RouteName.Second:
        return '/second';
      case RouteName.Categories:
        return '/categories';
      case RouteName.SubCategories:
        return '/sub-categories';
      default:
        return '';
    }
  }
}
