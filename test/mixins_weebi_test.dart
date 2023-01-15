import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:models_weebi/abstractions.dart';

typedef MobxTicketsStoreCreator<T extends AbstractStore> = T Function(
    BuildContext context);

class MobxTest {
  final MobxTicketsStoreCreator m;
  final BuildContext c;
  MobxTest(this.m, this.c);
}

void main() {
  test('adds one to input values', () {
    //final BuildContext context = BuildContext;
    //final mm = MobxTest((c) => c.ticketsStore, context);
  });
}
