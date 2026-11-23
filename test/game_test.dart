import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tahmin_ustasi/oyun_tahmin_ustasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tahminUstasiConfig.title.length, 33);
    expect(tahminUstasiConfig.tagline.length, 33);
    for (final s in tahminUstasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(tahminUstasiConfig.gameId, tahminUstasiId);
    expect(tahminUstasiRules.gameId, tahminUstasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tahminUstasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tahminUstasiId, optionalMechanics: tahminUstasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tahminUstasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
