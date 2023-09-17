import 'package:country_app/presentation/screens/countries/search_screen.dart';
import 'package:country_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

/// Using GoRouter package to avoid additional configs if we need it to launch
/// on web, or if we need deeplinking
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      name: SearchScreen.name,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/country-detail/:countryName',
      name: DetailedCountryScreen.name,
      builder: (context, state) {
        final countryName = state.pathParameters["countryName"] ?? 'no-name';
        return DetailedCountryScreen(
          countryName: countryName,
        );
      },
    )
  ],
);
