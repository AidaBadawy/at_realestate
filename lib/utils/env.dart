import 'package:meta/meta.dart';

enum BuildFlavor { production, development, staging }

BuildEnvironment? get env => _env;
BuildEnvironment? _env;

class BuildEnvironment {
  /// The backend server.
  final String baseUrl;
  final String appName;
  final BuildFlavor flavor;

  BuildEnvironment._init(
      {required this.flavor, required this.appName, required this.baseUrl});

  /// Sets up the top-level [env] getter on the first call only.
  static void init({@required flavor, @required appName, @required baseUrl}) =>
      _env ??= BuildEnvironment._init(
          flavor: flavor, appName: appName, baseUrl: baseUrl);
}
