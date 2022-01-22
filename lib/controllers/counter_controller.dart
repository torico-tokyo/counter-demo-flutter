import 'package:hooks_riverpod/hooks_riverpod.dart';

// カウンター
final countState = StateProvider<int>((ref) => 0);

// カウンターの値を追加するリスト
final countListState = StateProvider<List<int>>((ref) => []);

// countListState の平均値を求める
final averageProvider = Provider<double>((ref) {
  final productList = ref.watch(countListState);
  return productList.isNotEmpty
      ? productList.fold<int>(0, (v, e) => v + e) / productList.length
      : 0.0;
});

final counterController =
    Provider.autoDispose((ref) => CounterController(ref.read));

class CounterController {
  final Reader _read;

  CounterController(this._read);

  // カウンターを増加
  void countUp() {
    _read(countState.notifier).update((s) => s + 1);
  }

  // 現在のカウンターの値を countList に追加するアクション
  void addToCountList() {
    _read(countListState.notifier).update((s) => [...s, _read(countState)]);
  }
}
