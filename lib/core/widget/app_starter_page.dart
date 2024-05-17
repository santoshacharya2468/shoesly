import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';

class AppStarter extends StatefulWidget {
  const AppStarter({super.key});

  @override
  State<AppStarter> createState() => _AppStarterState();
}

class _AppStarterState extends State<AppStarter> {
  final _appRouter = AppRouter();
  final CartBloc cartBloc = getIt<CartBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cartBloc,
      child: MaterialApp(
          home: const SizedBox(),
          debugShowCheckedModeBanner: false,
          scrollBehavior: const CupertinoScrollBehavior(),
          builder: (_, extendedNav) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            return FlutterEasyLoading(
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                theme: ThemeData.dark().copyWith(
                    //primaryColor: const Color(0xffF97316),
                    cardColor: Colors.grey[200],
                    dividerColor: Colors.grey[200],
                    textTheme: const TextTheme(
                        bodyMedium:
                            TextStyle(fontSize: 14, color: Colors.black),
                        bodyLarge: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        titleSmall: TextStyle(color: Colors.grey, fontSize: 10),
                        titleMedium: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        titleLarge: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                        centerTitle: true,
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        iconTheme: IconThemeData(color: Colors.black),
                        color: Color(0xff1E1E1E),
                        elevation: 0)),
                routerConfig: _appRouter.config(),
              ),
            );
          }),
    );
  }
}
