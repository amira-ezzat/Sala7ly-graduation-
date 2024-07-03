import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sala7ly/layout/layout_screen.dart';
import 'package:sala7ly/modules/Drawer/profil/profile.dart';
import 'package:sala7ly/modules/login/login.dart';
import 'package:sala7ly/modules/screens/order/order.dart';
import 'package:sala7ly/modules/screens/order/server.dart';
import 'package:sala7ly/modules/screens/create_order/order_services.dart';
import 'package:sala7ly/modules/screens/order_parts/cubit.dart';
import 'package:sala7ly/shared/bloc.dart';
import 'package:sala7ly/shared/componants/constant.dart';
import 'package:sala7ly/shared/componants/showTast.dart';
import 'package:sala7ly/shared/cubit/cubit.dart';
import 'package:sala7ly/shared/cubit/state.dart';
import 'package:sala7ly/shared/network/local/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:sala7ly/shared/styles/theme.dart';
import 'firebase_options.dart';
import 'layout/cubit/cubit.dart';
import 'model/userModel.dart';
import 'modules/Drawer/profil/manage.dart';
import 'modules/register/cubit/cubit.dart';
import 'modules/register/register.dart';
import 'modules/screens/home/animation_logo_screen/logo_screen.dart';
import 'modules/screens/order_parts/payment.dart';
import 'modules/screens/order_parts/succesful.dart';
import 'modules/screens/serviceasfire/services.dart';
import 'modules/setting/cubit/cubit.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('on message opened app');
  //   print(event.data.toString());
  //   showToast(text: 'on message opened app', state: ToastState.SUCCESS);
  // });

  FirebaseMessaging.onMessage.listen((event) {
    print('on message');
    print(event.data.toString());
    showToast(text: 'on message', state: ToastState.SUCCESS);

    RemoteNotification? notification = event.notification;
    AndroidNotification? android = event.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'channel_id',
            'channel_name',
            channelDescription: 'channel_description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
          ),
        ),
      );
    }
  });

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  await EasyLocalization.ensureInitialized();

  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translate',
      child: MyApp(isDark: isDark),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<Sala7lyUserModel>(
          create: (_) => Sala7lyUserModel(),
        ),
        ChangeNotifierProvider(create: (_) => ImageProviderNotifier()),
        BlocProvider(
          create: (BuildContext context) => SettingsCubit(),
        ),
        BlocProvider(
          create: (context) => sla7lyCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (_) => PartsBloc()..fetchProducts(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: Layout(),
          );
        },
      ),
    );
  }
}
