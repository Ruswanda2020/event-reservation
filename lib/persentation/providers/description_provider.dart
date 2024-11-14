import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'description_provider.g.dart';

@riverpod
String codeConDescription(Ref ref) => '''
Join us for Code Con, the ultimate event for developers! This exciting gathering brings together IT professionals from all over the world to explore the latest trends and innovations in the tech industry.

During Code Con, you'll have the opportunity to attend a variety of talks and workshops that cater to your interests. From cutting-edge technologies to practical skills development, you'll find inspiring insights and practical knowledge that will help you stay ahead in your career.
''';
