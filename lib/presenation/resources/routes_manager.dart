import 'package:advanced_flutter_arabic/presenation/forget_password/forget_password_view.dart';
import 'package:advanced_flutter_arabic/presenation/login/login_view.dart';
import 'package:advanced_flutter_arabic/presenation/main/main_view.dart';
import 'package:advanced_flutter_arabic/presenation/on_boarding/on_boarding_view.dart';
import 'package:advanced_flutter_arabic/presenation/register/register_view.dart';
import 'package:advanced_flutter_arabic/presenation/resources/strings_manager.dart';
import 'package:advanced_flutter_arabic/presenation/splash/splash_view.dart';
import 'package:advanced_flutter_arabic/presenation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes
{
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator
{
  static Route<dynamic>getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView(),);

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingView(),);

        case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView(),);

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterView(),);

      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordView(),);

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => const MainView(),);

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (context) => const StoreDetailsView(),);

      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic>unDefinedRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.noRouteFound,
        ),
      ),
      body: const Center(
        child: Text(
          AppStrings.noRouteFound,
        ),
      ),
    ),);
  }
}