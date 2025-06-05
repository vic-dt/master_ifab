import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final vigiliaLocusProvider = StreamProvider.autoDispose<(double, double)>((ref) async *{

 
  bool serviceEnabled;
  LocationPermission permission;

  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
   
    throw 'Location services are disabled.';
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      
      throw'Location permissions are denied';
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    throw 'Location permissions are permanently denied, we cannot request permissions.';
  } 

  
  // return await Geolocator.getCurrentPosition();

  // final locus = await Geolocator.getCurrentPosition();
  
  // return(locus.latitude, locus.longitude);

  await for (final locus in Geolocator.getPositionStream()){
    yield (locus.latitude, locus.longitude);
  };


});