// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../actions/index.dart' as actions;
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../../flutter_flow/custom_functions.dart'
    as functions; // Imports custom functions
import 'package:url_launcher/url_launcher.dart';
import '../../flutter_flow/permissions_util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:developer';

import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:taco_driver/v2/models/api_token.dart';
import 'package:taco_driver/v2/models/taxi_call.dart';

const String NotificationCategory_Taxicall = "Taxicall";
const String NotificationCategory_Payment = "Payment";
const String NotificationCategory_Driver = "Driver";

const String TaxiCallStateRequested = "TAXI_CALL_REQUESTED";
const String TaxiCallStateUserCancelled = "USER_CANCELLED";
const String TaxiCallStateDriverToDeparture = 'DRIVER_TO_DEPARTURE';
const String ExtTaxiCallStateDriverRejected = 'DRIVER_REJECTED';

const FOREGROUND_ISOLATE_PORT_NAME = 'foreground_port';
@pragma('vm:entry-point')
Future<void> _fcmMessageHandlerBackground(RemoteMessage message) async {
  debugPrint(
      "_fcmMessageHandlerBackground received ${message.data.toString()}");
  final foreground =
      IsolateNameServer.lookupPortByName(FOREGROUND_ISOLATE_PORT_NAME);
  if (foreground != null) {
    foreground.send(message);
  } else {
    // ... handle message in background ...
    debugPrint('foreground is null');
  }

  final data = message.data;

  // Open service overlay
  if (data["taxiCallState"] == TaxiCallStateRequested) {
    final taxiCallRequestTicket = TaxiCallTicket(
        taxiCallRequestId: data["taxiCallRequestId"],
        ticketId: data["taxiCallTicketId"],
        attempt: int.parse(data["ticketAttempt"]),
        tags: data["tags"],
        userTag: data["userTag"],
        toDepartureDistance: int.parse(data["toDepartureDistance"]),
        toArrivalDistance: int.parse(data["toArrivalDistance"]),
        toArrivalETA: int.parse(data["toArrivalETA"]),
        additionalPrice: int.parse(data["additionalPrice"]),
        departureAddressRegionDepth2: data["departureAddressRegionDepth2"],
        departureAddressRegionDepth3: data["departureAddressRegionDepth3"],
        departureName: data["departureBuildingName"],
        arrivalAddressRegionDepth2: data["arrivalAddressRegionDepth2"],
        arrivalAddressRegionDepth3: data["arrivalAddressRegionDepth3"],
        arrivalName: data["arrivalBuildingName"],
        updateTime: DateTime.parse(data["updateTime"]));
    final isActive = await FlutterOverlayWindow.isActive();
    await FlutterOverlayWindow.shareData(taxiCallRequestTicket);
    if (!isActive) {
      await FlutterOverlayWindow.showOverlay();
    }
  } else {
    await LocalNotification.showNotification(message);
  }
}

class LocalNotification {
  LocalNotification._();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static initialize() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    const AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      playSound: false,
      'driver_channel', // 임의의 id
      'Driver MISC Channel', // 설정에 보일 채널명
      description: 'Taco Driver MISC Channel', // 설정에 보일 채널 설명
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  static showNotification(RemoteMessage message) async {
    final androidNotificationDetal = AndroidNotificationDetails(
      'taco_driver_channel_id_2',
      'Taco Driver MISC Channel',
      playSound: false,
    );

    flutterLocalNotificationsPlugin.show(
        // TODO (Taekyeom) message id?
        0,
        message.notification?.title,
        message.notification?.body,
        NotificationDetails(android: androidNotificationDetal));
  }
}

class DriverCallManager extends StatefulWidget {
  const DriverCallManager({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DriverCallManagerState createState() => _DriverCallManagerState();
}

class _DriverCallManagerState extends State<DriverCallManager> {
  ApiCallResponse? apiResult438;
  ApiCallResponse? apiResult439;
  ApiCallResponse? apiResultkg1;
  ApiCallResponse? apiResultCancelCall2;
  ApiCallResponse? apiResultCancelCall;
  ApiCallResponse? apiResultCancelCall3;
  ApiCallResponse? apiResultDriverToArrival;
  ApiCallResponse? apiResultj1q;
  ApiCallResponse? apiResultw8d;
  ApiCallResponse? apiResultDoneTaxiCall;
  TextEditingController? taxiFareController;
  TextEditingController? tollFareController;
  bool? switchValue;
  ApiCallResponse? apiResult550;
  ApiCallResponse? apiResult560;
  ApiCallResponse? apiResultkz1;
  AudioPlayer? soundPlayer;
  ApiCallResponse? apiResultyb9;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ReceivePort? _foregroundReceivePort;
  StreamSubscription<RemoteMessage>? _foregroundMessageSubscription;

  Future setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleInitialMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    //FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // foreground handler
    _foregroundMessageSubscription =
        FirebaseMessaging.onMessage.listen(_handleMessage);

    FirebaseMessaging.onBackgroundMessage(_fcmMessageHandlerBackground);

    _foregroundReceivePort = ReceivePort();
    if (!(IsolateNameServer.registerPortWithName(
      _foregroundReceivePort!.sendPort,
      FOREGROUND_ISOLATE_PORT_NAME,
    ))) {
      print('registerPortWithName failed in call manager');
    }
    _foregroundReceivePort!.listen(_handleBackgroundMessage);
  }

  void cleanupInteractedMessage() {
    _foregroundMessageSubscription?.cancel();
  }

  void _handleMessage(RemoteMessage message) async {
    dynamic data = message.data;
    debugPrint('Message received in foreground  ${data.toString()}');

    switch (data['category']) {
      case NotificationCategory_Driver:
        setState(() {
          FFAppState().driverIsActivated = true;
        });
        break;
      case NotificationCategory_Taxicall:
        if (FFAppState().driverIsActivated && FFAppState().driverIsOnDuty) {
          if (data['taxiCallState'] == TaxiCallStateRequested) {
            setState(() {
              actions.fromCallRequestedMessagePayload(message.data);
              actions.setCallState('TAXI_CALL_REQUESTED');
            });
            soundPlayer ??= AudioPlayer();
            if (soundPlayer!.playing) {
              await soundPlayer!.stop();
            }

            soundPlayer!
                .setAsset('assets/audios/CallRequested.mp3')
                .then((_) => soundPlayer!.play());
          } else if (data['taxiCallState'] == TaxiCallStateUserCancelled) {
            soundPlayer ??= AudioPlayer();
            if (soundPlayer!.playing) {
              await soundPlayer!.stop();
            }

            soundPlayer!
                .setAsset('assets/audios/RiderCancelled.mp3')
                .then((_) => soundPlayer!.play());
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text('승객의 요청으로 배차가 취소되었습니다'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('확인'),
                    ),
                  ],
                );
              },
            );

            setState(() {
              actions.setCallState('TAXI_CALL_WAITING');
            });
          }
        }
        break;
    }
  }

  void _handleInitialMessage(RemoteMessage message) async {
    dynamic data = message.data;
    debugPrint('Initial data received ${data.toString()}');

    switch (data['category']) {
      case NotificationCategory_Driver:
        setState(() {
          FFAppState().driverIsActivated = true;
        });
        break;
      case NotificationCategory_Taxicall:
        if (FFAppState().driverIsActivated && FFAppState().driverIsOnDuty) {
          if (data['taxiCallState'] == TaxiCallStateRequested) {
            if (FFAppState().driverIsOnDuty) {
              apiResultyb9 =
                  await TaxiCallGroup.getLatestTaxiCallTicketCall.call(
                apiToken: FFAppState().apiToken,
                driverId: FFAppState().driverId,
                apiEndpointTarget: FFAppState().apiEndpointTarget,
              );
              if ((apiResultyb9?.succeeded ?? true)) {
                setState(() {
                  actions.fromGetLatestCallTicketlApiResponse(
                    (apiResultyb9?.jsonBody ?? ''),
                  );
                  actions.setCallState('TAXI_CALL_REQUESTED');
                });
              } else {
                setState(() {
                  actions.setCallState('TAXI_CALL_WAITING');
                });
              }
            }
          } else if (data['taxiCallState'] == TaxiCallStateUserCancelled) {
            if (FFAppState().isOnDrivingToDeparture) {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    content: Text('승객의 요청으로 배차가 취소되었습니다'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('확인'),
                      ),
                    ],
                  );
                },
              );

              setState(() {
                actions.setCallState('TAXI_CALL_WAITING');
              });
            }
          }
        }
        break;
    }
  }

  void _handleBackgroundMessage(dynamic message) async {
    if (message is! RemoteMessage) {
      print('got wrong data type for handling in foreground');
      return;
    }

    dynamic data = message.data;
    log('Data received in background ${data.toString()}');

    switch (data['category']) {
      case NotificationCategory_Driver:
        setState(() {
          FFAppState().driverIsActivated = true;
        });
        break;
      case NotificationCategory_Taxicall:
        if (FFAppState().driverIsActivated && FFAppState().driverIsOnDuty) {
          switch (data['taxiCallState']) {
            case TaxiCallStateRequested:
              setState(() {
                actions.fromCallRequestedMessagePayload(data);
                actions.setCallState('TAXI_CALL_REQUESTED');
              });
              break;
            case TaxiCallStateUserCancelled:
              setState(() {
                actions.setCallState('TAXI_CALL_WAITING');
              });
              break;
            case TaxiCallStateDriverToDeparture:
              actions.fromGetLatestCallApiResponse(data);
              actions.setCallState('DRIVER_TO_DEPARTURE');
              break;
            case ExtTaxiCallStateDriverRejected:
              setState(() {
                actions.setCallState('TAXI_CALL_WAITING');
              });
              break;
          }
        }
        break;
    }
  }

  static initOverlayWidget() async {
    await FlutterOverlayWindow.shareData(ApiToken(
        token: FFAppState().apiToken, driverId: FFAppState().driverId));
  }

  @override
  void initState() {
    super.initState();

    IsolateNameServer.removePortNameMapping(FOREGROUND_ISOLATE_PORT_NAME);
    setupInteractedMessage();
    LocalNotification.initialize();

    taxiFareController = TextEditingController();
    tollFareController = TextEditingController(text: '0');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    debugPrint(
        'driverId ${FFAppState().driverId} apiToken ${FFAppState().apiToken}');
    initOverlayWidget();
  }

  @override
  void dispose() {
    cleanupInteractedMessage();
    taxiFareController?.dispose();
    tollFareController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                    child: Text(
                      '야간주행모드',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Switch.adaptive(
                    value: switchValue ??= FFAppState().darkModeSetting,
                    onChanged: (newValue) async {
                      setState(() => switchValue = newValue!);
                      if (newValue!) {
                        setDarkModeSetting(context, ThemeMode.dark);
                        FFAppState().darkModeSetting = true;
                      } else {
                        setDarkModeSetting(context, ThemeMode.light);
                        FFAppState().darkModeSetting = false;
                      }
                    },
                    activeColor: Colors.white,
                    activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  if (!FFAppState().isOnCallViewing &&
                      !FFAppState().isOnDrivingToDeparture &&
                      !FFAppState().isOnDrivingToArrival &&
                      !FFAppState().isArrived &&
                      !valueOrDefault<bool>(
                        FFAppState().isOnCallWaiting,
                        false,
                      ) &&
                      !FFAppState().isOnCallWaitingPaused)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 40),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${FFAppState().driverLastName}${FFAppState().driverFirstName}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      '기사님 안녕하세요',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '매일 4시간 콜대기하고 3만원 적립의 혜택을 받아가세요!',
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: Stack(
                                  children: [
                                    if (FFAppState().driverCarNumber != null &&
                                        FFAppState().driverCarNumber != '')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFAppState().driverCarNumber,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${FFAppState().driverCarModel} / ${FFAppState().driverTaxiCategory}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (!FFAppState().driverIsAtWork)
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context
                                                      .pushNamed('CarSetting');
                                                },
                                                text: '차량 변경',
                                                options: FFButtonOptions(
                                                  width: 100,
                                                  height: 40,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    if (FFAppState().driverCarNumber == null ||
                                        FFAppState().driverCarNumber == '')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed('CarSetting');
                                              },
                                              text: '차량 추가',
                                              options: FFButtonOptions(
                                                width: 120,
                                                height: 50,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().isOnCallWaiting)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 90, 10, 90),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '콜 대기중',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    color: Color(0xFF95A1AC),
                                    size: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidCircle,
                                      color: Color(0xFF9288F0),
                                      size: 10,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    color: Color(0xFF6B59F0),
                                    size: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().isOnCallWaitingPaused)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 90, 10, 90),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '콜 대기 멈춤',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    color: Color(0xFF95A1AC),
                                    size: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidCircle,
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                      size: 10,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().isOnCallViewing)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (FFAppState().callTagsConcat != null &&
                                  FFAppState().callTagsConcat != '')
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFAppState().callTagsConcat,
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (FFAppState().callUserTag != null &&
                                  FFAppState().callUserTag != '')
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFAppState().callUserTag,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Text(
                                          '출발지 약 ${functions.toHumanFriendlyDistanceFromMeters(FFAppState().callToDepartureDistance.toString())}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '목적지 ${functions.toHumanFriendlyDistanceFromMeters(FFAppState().callToArrivalDistance.toString())} / ${functions.toHumanFreindlyEtaFromNanoseconds(FFAppState().callToArrivalEtaNanoSec.toString())}',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (FFAppState().callAdditionalPrice > 0)
                                        Text(
                                          '타코 ${FFAppState().callAdditionalPrice.toString()}개',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 0, 0),
                                        child: Text(
                                          FFAppState().callDepartureName !=
                                                      null &&
                                                  FFAppState()
                                                          .callDepartureName !=
                                                      ''
                                              ? '${FFAppState().callDepartureName}'
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 0, 0),
                                        child: Text(
                                          FFAppState().callArrivalName !=
                                                      null &&
                                                  FFAppState()
                                                          .callArrivalName !=
                                                      ''
                                              ? '${FFAppState().callArrivalName}'
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          apiResultw8d = await TaxiCallGroup
                                              .rejectTaxiCallTicketCall
                                              .call(
                                            ticketId: FFAppState().callTicketId,
                                            apiToken: FFAppState().apiToken,
                                            apiEndpointTarget:
                                                FFAppState().apiEndpointTarget,
                                          );
                                          if ((apiResultw8d?.succeeded ??
                                              true)) {
                                            await actions.setCallState(
                                              'TAXI_CALL_WAITING',
                                            );
                                          } else {
                                            FFAppState().update(() {
                                              FFAppState().errCode =
                                                  getJsonField(
                                                (apiResultw8d?.jsonBody ?? ''),
                                                r'''$.errCode''',
                                              ).toString();
                                            });
                                            if ((FFAppState().errCode ==
                                                    'ERR_NOT_FOUND') ||
                                                (FFAppState().errCode ==
                                                    'ERR_INVALID')) {
                                              await actions.setCallState(
                                                'TAXI_CALL_WAITING',
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('오류'),
                                                    content: Text(
                                                        '서버 오류가 발생하여 다시 시도해주세요'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('확인'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          }

                                          setState(() {});
                                        },
                                        text: '거절',
                                        options: FFButtonOptions(
                                          width: 100,
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          apiResultj1q = await TaxiCallGroup
                                              .acceptTaxiCallTicketCall
                                              .call(
                                            ticketId: FFAppState().callTicketId,
                                            apiToken: FFAppState().apiToken,
                                            apiEndpointTarget:
                                                FFAppState().apiEndpointTarget,
                                          );
                                          if ((apiResultj1q?.succeeded ??
                                              true)) {
                                            await actions
                                                .fromGetLatestCallApiResponse(
                                              (apiResultj1q?.jsonBody ?? ''),
                                            );
                                            await actions.setCallState(
                                              'DRIVER_TO_DEPARTURE',
                                            );
                                            soundPlayer ??= AudioPlayer();
                                            if (soundPlayer!.playing) {
                                              await soundPlayer!.stop();
                                            }

                                            soundPlayer!
                                                .setAsset(
                                                    'assets/audios/CallAccepted.mp3')
                                                .then(
                                                    (_) => soundPlayer!.play());
                                          } else {
                                            FFAppState().update(() {
                                              FFAppState().errCode =
                                                  getJsonField(
                                                (apiResultj1q?.jsonBody ?? ''),
                                                r'''$.errCode''',
                                              ).toString();
                                            });
                                            if ((FFAppState().errCode ==
                                                    'ERR_NOT_FOUND') ||
                                                (FFAppState().errCode ==
                                                    'ERR_INVALID')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('오류'),
                                                    content:
                                                        Text('만료된 콜 요청입니다'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('확인'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              await actions.setCallState(
                                                'TAXI_CALL_WAITING',
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('오류'),
                                                    content: Text(
                                                        '서버 오류가 발생하여 다시 시도해주세요'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('확인'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          }

                                          setState(() {});
                                        },
                                        text: '콜 수락',
                                        options: FFButtonOptions(
                                          width: 140,
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().isOnDrivingToDeparture)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            apiResultCancelCall =
                                                await TaxiCallGroup
                                                    .cancelTaxiCallRequestCall
                                                    .call(
                                              taxiCallRequestId:
                                                  FFAppState().callId,
                                              apiToken: FFAppState().apiToken,
                                              apiEndpointTarget: FFAppState()
                                                  .apiEndpointTarget,
                                              confirmCancel: false,
                                              isUserFault: false,
                                            );
                                            if ((apiResultCancelCall
                                                    ?.succeeded ??
                                                true)) {
                                              await actions.setCallState(
                                                'TAXI_CALL_WAITING',
                                              );
                                            } else {
                                              FFAppState().update(() {
                                                FFAppState().errCode =
                                                    getJsonField(
                                                  (apiResultCancelCall
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.errCode''',
                                                ).toString();
                                              });
                                              if (FFAppState().errCode ==
                                                  'ERR_NEED_CONFIRMATION') {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text('주의'),
                                                              content: Text(
                                                                  '콜 수락을 취소하시겠습니까? 정당한 사유없이 취소하는 경우 페널티가 부과됩니다'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      '유지'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      '취소'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                content: Text(
                                                                    '탑승지 도착 3분 경과후 연락두절 등 손님 귀책으로 인한 취소인가요?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        '기사님사유'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        '손님귀책사유'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    apiResultCancelCall2 =
                                                        await TaxiCallGroup
                                                            .cancelTaxiCallRequestCall
                                                            .call(
                                                      taxiCallRequestId:
                                                          FFAppState().callId,
                                                      apiToken:
                                                          FFAppState().apiToken,
                                                      apiEndpointTarget:
                                                          FFAppState()
                                                              .apiEndpointTarget,
                                                      confirmCancel: true,
                                                      isUserFault: true,
                                                    );
                                                    if ((apiResultCancelCall2
                                                            ?.succeeded ??
                                                        true)) {
                                                      await actions
                                                          .setCallState(
                                                        'TAXI_CALL_WAITING',
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text('오류'),
                                                            content: Text(
                                                                '서버 오류가 발생하여 다시 시도해주세요'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('확인'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    apiResultCancelCall3 =
                                                        await TaxiCallGroup
                                                            .cancelTaxiCallRequestCall
                                                            .call(
                                                      taxiCallRequestId:
                                                          FFAppState().callId,
                                                      apiToken:
                                                          FFAppState().apiToken,
                                                      apiEndpointTarget:
                                                          FFAppState()
                                                              .apiEndpointTarget,
                                                      confirmCancel: true,
                                                      isUserFault: false,
                                                    );
                                                    if ((apiResultCancelCall3
                                                            ?.succeeded ??
                                                        true)) {
                                                      await actions
                                                          .setCallState(
                                                        'TAXI_CALL_WAITING',
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text('오류'),
                                                            content: Text(
                                                                '서버 오류가 발생하여 다시 시도해주세요'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('확인'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('오류'),
                                                      content: Text(
                                                          '서버 오류가 발생하여 다시 시도해주세요'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('확인'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: '취소',
                                          options: FFButtonOptions(
                                            width: 80,
                                            height: 60,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path: FFAppState().callUserPhone,
                                            ));
                                          },
                                          text: '',
                                          icon: Icon(
                                            Icons.phone,
                                            size: 25,
                                          ),
                                          options: FFButtonOptions(
                                            width: 60,
                                            height: 60,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'sms',
                                              path: FFAppState().callUserPhone,
                                            ));
                                          },
                                          text: '',
                                          icon: Icon(
                                            Icons.message,
                                            size: 25,
                                          ),
                                          options: FFButtonOptions(
                                            width: 60,
                                            height: 60,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await actions.launchKakaoNavi(
                                            functions.toLatitudeFromLatLng(
                                                FFAppState()
                                                    .callDepartureCoordinate!),
                                            functions.toLongitudeFromLatLng(
                                                FFAppState()
                                                    .callDepartureCoordinate!),
                                            '출발지',
                                          );
                                        },
                                        text: '길안내',
                                        options: FFButtonOptions(
                                          width: 100,
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (FFAppState().callTagsConcat != null &&
                                  FFAppState().callTagsConcat != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFAppState().callTagsConcat,
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (FFAppState().callUserTag != null &&
                                  FFAppState().callUserTag != '')
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFAppState().callUserTag,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 0, 0),
                                        child: Text(
                                          FFAppState().callDepartureName !=
                                                      null &&
                                                  FFAppState()
                                                          .callDepartureName !=
                                                      ''
                                              ? '${FFAppState().callDepartureName}'
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 0, 0),
                                        child: Text(
                                          FFAppState().callArrivalName !=
                                                      null &&
                                                  FFAppState()
                                                          .callArrivalName !=
                                                      ''
                                              ? '${FFAppState().callArrivalName}'
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        apiResultDriverToArrival =
                                            await TaxiCallGroup
                                                .taxiCallDriverToArrivalCall
                                                .call(
                                          taxiCallRequestId:
                                              FFAppState().callId,
                                          apiToken: FFAppState().apiToken,
                                          apiEndpointTarget:
                                              FFAppState().apiEndpointTarget,
                                        );
                                        if ((apiResultDriverToArrival
                                                ?.succeeded ??
                                            true)) {
                                          await actions.setCallState(
                                            'DRIVER_TO_ARRIVAL',
                                          );
                                          soundPlayer ??= AudioPlayer();
                                          if (soundPlayer!.playing) {
                                            await soundPlayer!.stop();
                                          }

                                          soundPlayer!
                                              .setAsset(
                                                  'assets/audios/RiderOnboarded.mp3')
                                              .then((_) => soundPlayer!.play());
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('오류'),
                                                content: Text(
                                                    '서버 오류가 발생하여 다시 시도해주세요'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: '손님 탐승 완료',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().isOnDrivingToArrival)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await actions.launchKakaoNavi(
                                            functions.toLatitudeFromLatLng(
                                                FFAppState()
                                                    .callArrivalCoordinate!),
                                            functions.toLongitudeFromLatLng(
                                                FFAppState()
                                                    .callArrivalCoordinate!),
                                            '목적지',
                                          );
                                        },
                                        text: '길안내',
                                        options: FFButtonOptions(
                                          width: 100,
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (FFAppState().callTagsConcat != null &&
                                  FFAppState().callTagsConcat != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFAppState().callTagsConcat,
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (FFAppState().callUserTag != null &&
                                  FFAppState().callUserTag != '')
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFAppState().callUserTag,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${FFAppState().callDepartureAddressRegionDepth2}  ${FFAppState().callDepartureAddressRegionDepth3} ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 0, 0),
                                        child: Text(
                                          FFAppState().callDepartureName !=
                                                      null &&
                                                  FFAppState()
                                                          .callDepartureName !=
                                                      ''
                                              ? '${FFAppState().callDepartureName}'
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${FFAppState().callArrivalAddressRegionDepth2}  ${FFAppState().callArrivalAddressRegionDepth3} ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 0, 0),
                                        child: Text(
                                          FFAppState().callArrivalName !=
                                                      null &&
                                                  FFAppState()
                                                          .callArrivalName !=
                                                      ''
                                              ? '${FFAppState().callArrivalName}'
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '승객 하차시 호출료 제외 실운임을 결제 받으세요',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await actions.setCallState(
                                          'ARRIVED',
                                        );
                                        soundPlayer ??= AudioPlayer();
                                        if (soundPlayer!.playing) {
                                          await soundPlayer!.stop();
                                        }

                                        soundPlayer!
                                            .setAsset(
                                                'assets/audios/Arrived.mp3')
                                            .then((_) => soundPlayer!.play());
                                      },
                                      text: '목적지 도착',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 60,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().isArrived)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (FFAppState().callAdditionalPrice > 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Text(
                                            '적립 타코 ${FFAppState().callAdditionalPrice.toString()}개',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Form(
                                  key: formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextFormField(
                                        controller: taxiFareController,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: '운임',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          hintText: '최종 미터기 실 운임 입력',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return '운임을 정확히 입력해주세요';
                                          }

                                          if (val.length < 1) {
                                            return '운임을 정확히 입력해주세요';
                                          }

                                          return null;
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 10),
                                        child: TextFormField(
                                          controller: tollFareController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: '통행료',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            hintText: '통행료 및 추가금액 입력',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20,
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 31, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (formKey.currentState == null ||
                                        !formKey.currentState!.validate()) {
                                      return;
                                    }

                                    apiResultDoneTaxiCall = await TaxiCallGroup
                                        .doneTaxiCallCall
                                        .call(
                                      taxiCallRequestId: FFAppState().callId,
                                      basePrice: int.tryParse(
                                          taxiFareController!.text),
                                      apiToken: FFAppState().apiToken,
                                      tollFee:
                                          tollFareController!.text != null &&
                                                  tollFareController!.text != ''
                                              ? int.tryParse(
                                                  tollFareController!.text)
                                              : 0,
                                      apiEndpointTarget:
                                          FFAppState().apiEndpointTarget,
                                    );
                                    if ((apiResultDoneTaxiCall?.succeeded ??
                                        true)) {
                                      setState(() {
                                        tollFareController?.clear();
                                        taxiFareController?.clear();
                                      });
                                      await actions.setCallState(
                                        'TAXI_CALL_WAITING',
                                      );
                                      soundPlayer ??= AudioPlayer();
                                      if (soundPlayer!.playing) {
                                        await soundPlayer!.stop();
                                      }

                                      soundPlayer!
                                          .setAsset(
                                              'assets/audios/TaxiFareInputSuccess.mp3')
                                          .then((_) => soundPlayer!.play());
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('오류'),
                                            content:
                                                Text('서버 오류가 발생하여 다시 시도해주세요'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('확인'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: '운행 종료',
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 60,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Stack(
                children: [
                  if (FFAppState().driverIsActivated &&
                      !FFAppState().driverIsOnDuty &&
                      FFAppState().driverIsAtWork)
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (await getPermissionStatus(locationPermission)) {
                            apiResult438 =
                                await DriverInfoGroup.updateOnDutyCall.call(
                              apiToken: FFAppState().apiToken,
                              driverId: FFAppState().driverId,
                              onDuty: true,
                              apiEndpointTarget: FFAppState().apiEndpointTarget,
                            );
                            if ((apiResult438?.succeeded ?? true)) {
                              FFAppState().update(() {
                                FFAppState().driverIsOnDuty = true;
                              });
                              await actions.setCallState(
                                'TAXI_CALL_WAITING',
                              );
                              await actions.startLocationService();
                              soundPlayer ??= AudioPlayer();
                              if (soundPlayer!.playing) {
                                await soundPlayer!.stop();
                              }

                              soundPlayer!
                                  .setAsset(
                                      'assets/audios/StartCallWaiting.mp3')
                                  .then((_) => soundPlayer!.play());
                            } else {
                              FFAppState().update(() {
                                FFAppState().errCode = getJsonField(
                                  (apiResult438?.jsonBody ?? ''),
                                  r'''$.errCode''',
                                ).toString();
                              });
                              if (FFAppState().errCode == 'ERR_UNSUPPORTED') {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('오류'),
                                      content: Text(
                                          '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('확인'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                soundPlayer ??= AudioPlayer();
                                if (soundPlayer!.playing) {
                                  await soundPlayer!.stop();
                                }

                                soundPlayer!
                                    .setAsset(
                                        'assets/audios/NotSupportedRegion.mp3')
                                    .then((_) => soundPlayer!.play());
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('오류'),
                                      content: Text('서버 오류가 발생하여 다시 시도해주세요'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('확인'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          } else {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('위치 정보 사용'),
                                      content: Text(
                                          '타코 기사용 앱은 앱이 종료되었거나 사용중이 아닐 때도 위치 데이터를 수집하여 승객과의 거리를 고려한 정확한 배차 기능을 지원합니다'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('거부'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('승인'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await requestPermission(locationPermission);
                              if (await getPermissionStatus(
                                  locationPermission)) {
                                apiResult439 =
                                    await DriverInfoGroup.updateOnDutyCall.call(
                                  apiToken: FFAppState().apiToken,
                                  driverId: FFAppState().driverId,
                                  onDuty: true,
                                  apiEndpointTarget:
                                      FFAppState().apiEndpointTarget,
                                );
                                if ((apiResult439?.succeeded ?? true)) {
                                  FFAppState().update(() {
                                    FFAppState().driverIsOnDuty = true;
                                  });
                                  await actions.setCallState(
                                    'TAXI_CALL_WAITING',
                                  );
                                  await actions.startLocationService();
                                  soundPlayer ??= AudioPlayer();
                                  if (soundPlayer!.playing) {
                                    await soundPlayer!.stop();
                                  }

                                  soundPlayer!
                                      .setAsset(
                                          'assets/audios/StartCallWaiting.mp3')
                                      .then((_) => soundPlayer!.play());
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().errCode = getJsonField(
                                      (apiResult439?.jsonBody ?? ''),
                                      r'''$.errCode''',
                                    ).toString();
                                  });
                                  if (FFAppState().errCode ==
                                      'ERR_UNSUPPORTED') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('오류'),
                                          content: Text(
                                              '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('확인'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    soundPlayer ??= AudioPlayer();
                                    if (soundPlayer!.playing) {
                                      await soundPlayer!.stop();
                                    }

                                    soundPlayer!
                                        .setAsset(
                                            'assets/audios/NotSupportedRegion.mp3')
                                        .then((_) => soundPlayer!.play());
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('오류'),
                                          content:
                                              Text('서버 오류가 발생하여 다시 시도해주세요'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('확인'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(
                                          '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('확인'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text(
                                        '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('확인'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }

                          setState(() {});
                        },
                        text: '콜 받기',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  if (FFAppState().driverIsOnDuty &&
                      !FFAppState().isOnDrivingToDeparture &&
                      !FFAppState().isOnDrivingToArrival &&
                      !FFAppState().isArrived &&
                      FFAppState().driverIsActivated &&
                      FFAppState().driverIsAtWork)
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          apiResultkg1 =
                              await DriverInfoGroup.updateOnDutyCall.call(
                            apiToken: FFAppState().apiToken,
                            driverId: FFAppState().driverId,
                            onDuty: false,
                            apiEndpointTarget: FFAppState().apiEndpointTarget,
                          );
                          if ((apiResultkg1?.succeeded ?? true)) {
                            FFAppState().update(() {
                              FFAppState().driverIsOnDuty = false;
                            });
                            await actions.setCallState(
                              'TAXI_CALL_WAITING_PAUSED',
                            );
                            await actions.cancelLocationService();
                            soundPlayer ??= AudioPlayer();
                            if (soundPlayer!.playing) {
                              await soundPlayer!.stop();
                            }

                            soundPlayer!
                                .setAsset('assets/audios/PauseCallWaiting.mp3')
                                .then((_) => soundPlayer!.play());
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('오류'),
                                  content: Text('서버 오류가 발생하여 다시 시도해주세요'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          setState(() {});
                        },
                        text: '콜 멈추기',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Stack(
                children: [
                  if (FFAppState().driverIsActivated &&
                      !FFAppState().driverIsAtWork &&
                      (FFAppState().driverCarNumber != null &&
                          FFAppState().driverCarNumber != ''))
                    Align(
                      alignment: AlignmentDirectional(0, 0.9),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (await getPermissionStatus(locationPermission)) {
                              apiResult550 =
                                  await DriverInfoGroup.updateOnDutyCall.call(
                                apiToken: FFAppState().apiToken,
                                driverId: FFAppState().driverId,
                                onDuty: true,
                                apiEndpointTarget:
                                    FFAppState().apiEndpointTarget,
                              );
                              if ((apiResult550?.succeeded ?? true)) {
                                FFAppState().update(() {
                                  FFAppState().driverIsOnDuty = true;
                                  FFAppState().driverIsAtWork = true;
                                });
                                await actions.setCallState(
                                  'TAXI_CALL_WAITING',
                                );
                                await actions.startLocationService();
                                soundPlayer ??= AudioPlayer();
                                if (soundPlayer!.playing) {
                                  await soundPlayer!.stop();
                                }

                                soundPlayer!
                                    .setAsset('assets/audios/StartWorking.mp3')
                                    .then((_) => soundPlayer!.play());
                              } else {
                                FFAppState().update(() {
                                  FFAppState().errCode = getJsonField(
                                    (apiResult550?.jsonBody ?? ''),
                                    r'''$.errCode''',
                                  ).toString();
                                });
                                if (FFAppState().errCode == 'ERR_UNSUPPORTED') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('오류'),
                                        content: Text(
                                            '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('확인'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  soundPlayer ??= AudioPlayer();
                                  if (soundPlayer!.playing) {
                                    await soundPlayer!.stop();
                                  }

                                  soundPlayer!
                                      .setAsset(
                                          'assets/audios/NotSupportedRegion.mp3')
                                      .then((_) => soundPlayer!.play());
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('오류'),
                                        content: Text('서버 오류가 발생하여 다시 시도해주세요'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('확인'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            } else {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('위치 정보 사용'),
                                            content: Text(
                                                '타코 기사용 앱은 앱이 종료되었거나 사용중이 아닐 때도 위치 데이터를 수집하여 승객과의 거리를 고려한 정확한 배차 기능을 지원합니다'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('거부'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('승인'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await requestPermission(locationPermission);
                                if (await getPermissionStatus(
                                    locationPermission)) {
                                  apiResult560 = await DriverInfoGroup
                                      .updateOnDutyCall
                                      .call(
                                    apiToken: FFAppState().apiToken,
                                    driverId: FFAppState().driverId,
                                    onDuty: true,
                                    apiEndpointTarget:
                                        FFAppState().apiEndpointTarget,
                                  );
                                  if ((apiResult560?.succeeded ?? true)) {
                                    FFAppState().update(() {
                                      FFAppState().driverIsOnDuty = true;
                                      FFAppState().driverIsAtWork = true;
                                    });
                                    await actions.setCallState(
                                      'TAXI_CALL_WAITING',
                                    );
                                    await actions.startLocationService();
                                    soundPlayer ??= AudioPlayer();
                                    if (soundPlayer!.playing) {
                                      await soundPlayer!.stop();
                                    }

                                    soundPlayer!
                                        .setAsset(
                                            'assets/audios/StartWorking.mp3')
                                        .then((_) => soundPlayer!.play());
                                  } else {
                                    FFAppState().update(() {
                                      FFAppState().errCode = getJsonField(
                                        (apiResult560?.jsonBody ?? ''),
                                        r'''$.errCode''',
                                      ).toString();
                                    });
                                    if (FFAppState().errCode ==
                                        'ERR_UNSUPPORTED') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('오류'),
                                            content: Text(
                                                '현재 미지원 지역입니다 순차적으로 오픈될 예정이니 조금만 기다려주세요'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('확인'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      soundPlayer ??= AudioPlayer();
                                      if (soundPlayer!.playing) {
                                        await soundPlayer!.stop();
                                      }

                                      soundPlayer!
                                          .setAsset(
                                              'assets/audios/NotSupportedRegion.mp3')
                                          .then((_) => soundPlayer!.play());
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('오류'),
                                            content:
                                                Text('서버 오류가 발생하여 다시 시도해주세요'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('확인'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('확인'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(
                                          '정확한 배차 기능 제공을 위해서 위치 정보 접근을 허용해주세요'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('확인'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }

                            // get request permission for system alert
                            final permissionGranted = await FlutterOverlayWindow
                                .isPermissionGranted();
                            debugPrint(
                                "Permission Granted???: $permissionGranted");
                            if (permissionGranted) {
                            } else {
                              final confirm = await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(
                                          '콜 카드 수신을 위해 설정을 수정해주세요. 다른 앱 위에 표시 -> 타코택시 기사용 선택 -> 다른 앱 위에 표시 허용 선택'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('거부'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('승인'),
                                        ),
                                      ],
                                    );
                                  });
                              if (confirm) {
                                await FlutterOverlayWindow.requestPermission();
                                await FlutterOverlayWindow.shareData(ApiToken(
                                    token: FFAppState().apiToken,
                                    driverId: FFAppState().driverId));
                              } else {
                                await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            '다른 앱 사용 중에도 콜 티켓을 수신하려면 설정이 필요합니다'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('확인'),
                                          ),
                                        ],
                                      );
                                    });
                              }
                            }

                            setState(() {});
                          },
                          text: '출근하기',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().driverIsActivated &&
                      FFAppState().driverIsAtWork &&
                      !FFAppState().isOnDrivingToDeparture &&
                      !FFAppState().isOnDrivingToArrival &&
                      !FFAppState().isArrived)
                    Align(
                      alignment: AlignmentDirectional(0, 0.9),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: InkWell(
                          onLongPress: () async {
                            if (FFAppState().driverIsOnDuty) {
                              apiResultkz1 =
                                  await DriverInfoGroup.updateOnDutyCall.call(
                                apiToken: FFAppState().apiToken,
                                driverId: FFAppState().driverId,
                                onDuty: false,
                                apiEndpointTarget:
                                    FFAppState().apiEndpointTarget,
                              );
                              if ((apiResultkz1?.succeeded ?? true)) {
                                FFAppState().update(() {
                                  FFAppState().driverIsOnDuty = false;
                                  FFAppState().driverIsAtWork = false;
                                });
                                await actions.setCallState(
                                  'NONE',
                                );
                                await actions.cancelLocationService();
                                soundPlayer ??= AudioPlayer();
                                if (soundPlayer!.playing) {
                                  await soundPlayer!.stop();
                                }

                                soundPlayer!
                                    .setAsset('assets/audios/EndWorking.mp3')
                                    .then((_) => soundPlayer!.play());
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('오류'),
                                      content: Text('서버 오류가 발생하여 다시 시도해주세요'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('확인'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              FFAppState().update(() {
                                FFAppState().driverIsAtWork = false;
                              });
                            }

                            setState(() {});
                          },
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: '길게눌러 퇴근하기',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (!FFAppState().driverIsActivated)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0.95),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Text(
                                      '등록해주신 정보로 승인 심사중입니다',
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    '매일 일괄 처리해드리고 있으니 조금만 기다려 주세요',
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
