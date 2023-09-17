import 'package:country_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

/// Using GoRouter package to avoid additional configs if we need it to launch
/// on web, or if we need deeplinking
final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  )
]);