import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/config/config.dart';

final estTenebrisModusProvider = StateProvider((ref)=>false);

final colorumIndexProvider= Provider((ref)=>colorum);

final electusColorProvider = StateProvider((ref)=>0);