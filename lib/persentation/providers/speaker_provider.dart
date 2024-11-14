import 'package:code_con_fe/data/domain/entities/speaker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'speaker_provider.g.dart';

@riverpod
List<Speaker> speakers(Ref ref) => [
      Speaker(
        name: 'Koen Van Looveren',
        title: 'Senior Developer',
        affiliation: 'Google',
        photoUrl: 'assets/pngs/koen_van_looveren.png',
      ),
      Speaker(
        name: 'Mary Cruz',
        title: 'Software Engineer',
        affiliation: 'Facebook',
        photoUrl: 'assets/pngs/mary_cruz.png',
      ),
      Speaker(
        name: 'Lawrence Smith',
        title: 'Tech Lead',
        affiliation: 'Amazon',
        photoUrl: 'assets/pngs/lawrence_smith.png',
      ),
      Speaker(
        name: 'Jessamine Mumtaz',
        title: 'CTO',
        affiliation: 'Microsoft',
        photoUrl: 'assets/pngs/jessamine_mumtaz.png',
      ),
      Speaker(
        name: 'Amir Khan',
        title: 'Software Architect',
        affiliation: 'IBM',
        photoUrl: 'assets/pngs/amir_khan.png',
      ),
      Speaker(
        name: 'Lynn Chang',
        title: 'Software Architect',
        affiliation: 'Alibaba',
        photoUrl: 'assets/pngs/lynn_chang.png',
      ),
    ];
