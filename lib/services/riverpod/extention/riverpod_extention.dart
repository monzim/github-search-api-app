import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart'
    show AutoDisposeRef, Ref;

extension ProviderHelperExtention on Ref {
  String get formatHash =>
      '0x${runtimeType.hashCode.toRadixString(32).padLeft(8, '0')}-${hashCode.toRadixString(23)}';
}

extension RiverpodCache on AutoDisposeRef<Object?> {
  void cachefor(Duration duration) {
    final live = keepAlive();
    Timer(duration, () {
      live.close();
    });
  }

  void periodicRefresh(Duration duration) {
    Timer(duration, () {
      invalidateSelf();
    });
  }
}
