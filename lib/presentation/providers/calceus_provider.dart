
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calceusProvider = StateNotifierProvider<CalceusNotifier, CalceusState>((ref)=> CalceusNotifier());


class CalceusState{
  final String assetImago;
  final double mensura;

    CalceusState({
      this.assetImago='assets/imagines/azul.png',
      this.mensura= 9.0,
    });

    CalceusState copyWith({
      String? assetImago,
      double? mensura,
    }){
      return CalceusState(
        assetImago: assetImago ?? this.assetImago,
        mensura: mensura ?? this.mensura
      );
    }
}

class CalceusNotifier extends StateNotifier<CalceusState>{ 

  CalceusNotifier():super(CalceusState());

  void ponereAssetImago(String valorem){
    state = state.copyWith(assetImago: valorem);
  }
  void ponereMensura(double valorem){
    state = state.copyWith(mensura: valorem);
  }
}

