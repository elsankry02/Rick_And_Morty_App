// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CharacterPage]
class CharacterRoute extends PageRouteInfo<void> {
  const CharacterRoute({List<PageRouteInfo>? children})
      : super(CharacterRoute.name, initialChildren: children);

  static const String name = 'CharacterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CharacterPage();
    },
  );
}

/// generated route for
/// [CharacterProfilePage]
class DetailsCharacterRoute extends PageRouteInfo<DetailsCharacterRouteArgs> {
  DetailsCharacterRoute({
    Key? key,
    required Results results,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsCharacterRoute.name,
          args: DetailsCharacterRouteArgs(key: key, results: results),
          initialChildren: children,
        );

  static const String name = 'DetailsCharacterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsCharacterRouteArgs>();
      return CharacterProfilePage(key: args.key, results: args.results);
    },
  );
}

class DetailsCharacterRouteArgs {
  const DetailsCharacterRouteArgs({this.key, required this.results});

  final Key? key;

  final Results results;

  @override
  String toString() {
    return 'DetailsCharacterRouteArgs{key: $key, results: $results}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}
