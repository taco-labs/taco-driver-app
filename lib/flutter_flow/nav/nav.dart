import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Color(0xFFFFEB62),
                child: Center(
                  child: Image.asset(
                    'assets/images/Original_on_Transparent.png',
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          : EntryWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Color(0xFFFFEB62),
                    child: Center(
                      child: Image.asset(
                        'assets/images/Original_on_Transparent.png',
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : EntryWidget(),
          routes: [
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'Entry',
              path: 'entry',
              builder: (context, params) => EntryWidget(),
            ),
            FFRoute(
              name: 'VerifyCode',
              path: 'verifyCode',
              builder: (context, params) => VerifyCodeWidget(
                phoneNumber: params.getParam('phoneNumber', ParamType.String),
                authSmsStateKey:
                    params.getParam('authSmsStateKey', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegisterDriver',
              path: 'registerDriver',
              builder: (context, params) => RegisterDriverWidget(
                phoneNumber: params.getParam('phoneNumber', ParamType.String),
                authSmsStateKey:
                    params.getParam('authSmsStateKey', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegisterImages',
              path: 'registerImages',
              builder: (context, params) => RegisterImagesWidget(
                phoneNumber: params.getParam('phoneNumber', ParamType.String),
                authSmsStateKey:
                    params.getParam('authSmsStateKey', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'RegisterInstallment',
              path: 'registerInstallment',
              builder: (context, params) => RegisterInstallmentWidget(
                phoneNumber: params.getParam('phoneNumber', ParamType.String),
                authSmsStateKey:
                    params.getParam('authSmsStateKey', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DriverProfile',
              path: 'driverProfile',
              builder: (context, params) => DriverProfileWidget(),
            ),
            FFRoute(
              name: 'CarSetting',
              path: 'carSetting',
              builder: (context, params) => CarSettingWidget(),
            ),
            FFRoute(
              name: 'AddCar',
              path: 'addCar',
              builder: (context, params) => AddCarWidget(),
            ),
            FFRoute(
              name: 'ModifyCar',
              path: 'modifyCar',
              builder: (context, params) => ModifyCarWidget(
                phoneNumber: params.getParam('phoneNumber', ParamType.String),
                authSmsStateKey:
                    params.getParam('authSmsStateKey', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Setting',
              path: 'setting',
              builder: (context, params) => SettingWidget(
                appVersion: params.getParam('appVersion', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CompanyInfo',
              path: 'companyInfo',
              builder: (context, params) => CompanyInfoWidget(),
            ),
            FFRoute(
              name: 'Policy',
              path: 'policy',
              builder: (context, params) => PolicyWidget(),
            ),
            FFRoute(
              name: 'HomeCopy',
              path: 'homeCopy',
              builder: (context, params) => HomeCopyWidget(),
            ),
            FFRoute(
              name: 'TermsOfService',
              path: 'termsOfService',
              builder: (context, params) => TermsOfServiceWidget(),
            ),
            FFRoute(
              name: 'PrivacyPolicy',
              path: 'privacyPolicy',
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'SettlementInfo',
              path: 'settlementInfo',
              builder: (context, params) => SettlementInfoWidget(
                bankCode: params.getParam('bankCode', ParamType.String),
                accountNumber:
                    params.getParam('accountNumber', ParamType.String),
                totalAmount: params.getParam('totalAmount', ParamType.int),
                requestableAmount:
                    params.getParam('requestableAmount', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'SettlementHistory',
              path: 'settlementHistory',
              builder: (context, params) => SettlementHistoryWidget(),
            ),
            FFRoute(
              name: 'SupportChat',
              path: 'supportChat',
              builder: (context, params) => SupportChatWidget(),
            ),
            FFRoute(
              name: 'DriveHistory',
              path: 'driveHistory',
              builder: (context, params) => DriveHistoryWidget(),
            ),
            FFRoute(
              name: 'SettingCopy',
              path: 'settingCopy',
              builder: (context, params) => SettingCopyWidget(
                appVersion: params.getParam('appVersion', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
