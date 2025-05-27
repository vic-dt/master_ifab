
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeXYZ {
  final double x;
  final double y;
  final double z;

  GyroscopeXYZ(this.x, this.y, this.z);
}

final gyroscopeProvider = StreamProvider<GyroscopeXYZ>((ref) async * {

final gyroscopeEventus= gyroscopeEventStream();
});