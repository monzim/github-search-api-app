import 'package:flutter/material.dart' show BuildContext, Widget, immutable;
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/src/pages/details/details_page.dart';
import '/src/pages/error/error_page.dart';
import '/src/pages/home/home_page.dart';
import '/src/pages/settings/settings_page.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
String initialRoute(InitialRouteRef ref) {
  return AppRouterPath.home;
}

@immutable
class AppRouterPath {
  static const String home = '/';
  static const String settings = '/settings';
  static const String details = '/details/:id';
}

@TypedGoRoute<HomeRoute>(
  path: AppRouterPath.home,
  routes: <TypedGoRoute<GoRouteData>>[],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<SettingsRoute>(
  path: AppRouterPath.settings,
  routes: <TypedGoRoute<GoRouteData>>[],
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.error});
  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorPage(error: error);
}

@TypedGoRoute<DetailsPageRoute>(
  path: AppRouterPath.details,
  routes: <TypedGoRoute<GoRouteData>>[],
)
class DetailsPageRoute extends GoRouteData {
  final int id;
  const DetailsPageRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DetailsPage(id: id);
}
