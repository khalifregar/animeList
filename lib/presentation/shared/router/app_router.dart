import 'package:anime_list/presentation/shared/guest_user_dashboard/guest_user_dashboard.dart';
import 'package:anime_list/presentation/shared/onboarding/onboarding_page.dart';
import 'package:anime_list/presentation/shared/router/app_router_path.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: AppRouterPath.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
        path: AppRouterPath.guestUserpage,
        builder: (context, state) => const GuestUserPage()),
  ]);
}
