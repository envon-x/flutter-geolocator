import 'dart:async';

import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';

export 'package:geolocator_platform_interface/geolocator_platform_interface.dart';

/// Returns a [Future] indicating if the user allows the App to access
/// the device's location.
Future<LocationPermission> checkPermission() =>
    GeolocatorPlatform.instance.checkPermission();

/// Request permission to access the location of the device.
///
/// Returns a [Future] which when completes indicates if the user granted
/// permission to access the device's location.
/// Throws a [PermissionDefinitionsNotFoundException] when the required
/// platform specific configuration is missing (e.g. in the
/// AndroidManifest.xml on Android or the Info.plist on iOS).
/// A [PermissionRequestInProgressException] is thrown if permissions are
/// requested while an earlier request has not yet been completed.
Future<LocationPermission> requestPermission() =>
    GeolocatorPlatform.instance.requestPermission();

/// Returns a [Future] containing a [bool] value indicating whether location
/// services are enabled on the device.
Future<bool> isLocationServiceEnabled() =>
    GeolocatorPlatform.instance.isLocationServiceEnabled();

/// Returns the last known position stored on the users device.
///
/// On Android we look for the location provider matching best with the
/// supplied [desiredAccuracy]. On iOS this parameter is ignored.
/// When no position is available, null is returned.
/// Throws a [PermissionDeniedException] when trying to request the device's
/// location when the user denied access.
Future<Position> getLastKnownPosition(
        {bool forceAndroidLocationManager = false}) =>
    GeolocatorPlatform.instance.getLastKnownPosition(
        forceAndroidLocationManager: forceAndroidLocationManager);

/// Returns the current position taking the supplied [desiredAccuracy] into
/// account.
///
/// You can control the precision of the location updates by supplying the
/// [desiredAccuracy] parameter (defaults to "best"). On Android you can
/// force the use of the Android LocationManager instead of the
/// FusedLocationProvider by setting the [forceAndroidLocationManager]
/// parameter to true. The [timeLimit] parameter allows you to specify a
/// timeout interval (by default no time limit is configured).
///
/// Throws a [TimeoutException] when no location is received within the
/// supplied [timeLimit] duration.
/// Throws a [PermissionDeniedException] when trying to request the device's
/// location when the user denied access.
Future<Position> getCurrentPosition({
  LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  bool forceAndroidLocationManager = false,
  Duration timeLimit,
}) =>
    GeolocatorPlatform.instance.getCurrentPosition(
      desiredAccuracy: desiredAccuracy,
      forceAndroidLocationManager: forceAndroidLocationManager,
      timeLimit: timeLimit,
    );

/// Fires whenever the location changes inside the bounds of the
/// [desiredAccuracy].
///
/// This event starts all location sensors on the device and will keep them
/// active until you cancel listening to the stream or when the application
/// is killed.
///
/// ```
/// StreamSubscription<Position> positionStream = Geolocator()
///     .GetPostionStream()
///     .listen((Position position) => {
///       // Handle position changes
///     });
///
/// // When no longer needed cancel the subscription
/// positionStream.cancel();
/// ```
///
/// You can control the precision of the location updates by supplying the
/// [desiredAccuracy] parameter (defaults to "best"). The [distanceFilter]
/// parameter controls the minimum distance the device needs to move before
/// the update is emitted (default value is 0 indicator no filter is used).
/// On Android you can force the use of the Android LocationManager instead
/// of the FusedLocationProvider by setting the [forceAndroidLocationManager]
/// parameter to true. Using the [timeInterval] you can control the amount of
/// time that needs to pass before the next position update is send. The
/// [timeLimit] parameter allows you to specify a timeout interval (by
/// default no time limit is configured).
///
/// Throws a [TimeoutException] when no location is received within the
/// supplied [timeLimit] duration.
/// Throws a [PermissionDeniedException] when trying to request the device's
/// location when the user denied access.
Stream<Position> getPositionStream({
  LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  int distanceFilter = 0,
  bool forceAndroidLocationManager = false,
  int timeInterval = 0,
  Duration timeLimit,
}) =>
    GeolocatorPlatform.instance.getPositionStream(
      desiredAccuracy: desiredAccuracy,
      distanceFilter: distanceFilter,
      forceAndroidLocationManager: forceAndroidLocationManager,
      timeInterval: timeInterval,
      timeLimit: timeLimit,
    );

/// Opens the App settings page.
///
/// Returns [true] if the location settings page could be opened, otherwise
/// [false] is returned.
Future<bool> openAppSettings() => GeolocatorPlatform.instance.openAppSettings();

/// Opens the location settings page.
///
/// Returns [true] if the location settings page could be opened, otherwise
/// [false] is returned.
Future<bool> openLocationSettings() =>
    GeolocatorPlatform.instance.openLocationSettings();
