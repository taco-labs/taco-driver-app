// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../widgets/index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
// Begin custom widget code

const String TaxiCallState_Waiting = 'TAXI_CALL_WAITING';
const String TaxiCallState_Waiting_Paused = 'TAXI_CALL_WAITING_PAUSED';
const String TaxiCallState_Requested = 'TAXI_CALL_REQUESTED';
const String TaxiCallState_Driver_To_Departure = 'DRIVER_TO_DEPARTURE';
const String TaxiCallState_Driver_To_Arrival = 'DRIVER_TO_ARRIVAL';
const String TaxiCallState_Arrived = 'ARRIVED';
const String TaxiCallState_None = 'NONE';

Future setCallState(String currentState) async {
  // Initialize call states
  FFAppState().isArrived = false;
  FFAppState().isOnCallViewing = false;
  FFAppState().isOnCallWaiting = false;
  FFAppState().isOnCallWaitingPaused = false;
  FFAppState().isOnDrivingToDeparture = false;
  FFAppState().isOnDrivingToArrival = false;

  // Set requested call state
  switch (currentState) {
    case TaxiCallState_Waiting:
      {
        FFAppState().update(() {
          FFAppState().driverIsAtWork = true;
          FFAppState().isOnCallWaiting = true;
        });
        break;
      }
    case TaxiCallState_Waiting_Paused:
      {
        FFAppState().update(() {
          FFAppState().driverIsAtWork = true;
          FFAppState().isOnCallWaitingPaused = true;
        });
        break;
      }
    case TaxiCallState_Requested:
      {
        FFAppState().update(() {
          FFAppState().driverIsAtWork = true;
          FFAppState().isOnCallViewing = true;
        });
        break;
      }
    case TaxiCallState_Driver_To_Departure:
      {
        FFAppState().update(() {
          FFAppState().driverIsAtWork = true;
          FFAppState().isOnDrivingToDeparture = true;
        });
        break;
      }
    case TaxiCallState_Driver_To_Arrival:
      {
        FFAppState().update(() {
          FFAppState().driverIsAtWork = true;
          FFAppState().isOnDrivingToArrival = true;
        });
        break;
      }
    case TaxiCallState_Arrived:
      {
        FFAppState().update(() {
          FFAppState().driverIsAtWork = true;
          FFAppState().isArrived = true;
        });
        break;
      }
    case TaxiCallState_None:
      {
        break;
      }
  }
}
