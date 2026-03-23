import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// FIX: Previously this threw an [Error] unconditionally, which caused an
/// unrecoverable crash in production. Now returns a visible error widget in
/// debug mode and a graceful blank scaffold in release mode.
Widget handleState<T>(T t) {
  debugPrint(">>> Unrecognized State ${t.runtimeType}");
  if (kDebugMode) {
    return Scaffold(
      body: Center(
        child: Text(
          "Unrecognized state: ${t.runtimeType}",
          style: const TextStyle(color: Colors.red, fontSize: 18),
        ),
      ),
    );
  }
  // In release/production, show a blank screen instead of crashing.
  return const Scaffold();
}