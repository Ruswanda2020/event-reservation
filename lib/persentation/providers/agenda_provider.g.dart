// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$agendaHash() => r'eaf8df5aa3ec636b1cbcfc7f79acb6844cfb379e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [agenda].
@ProviderFor(agenda)
const agendaProvider = AgendaFamily();

/// See also [agenda].
class AgendaFamily extends Family<String> {
  /// See also [agenda].
  const AgendaFamily();

  /// See also [agenda].
  AgendaProvider call({
    int day = 1,
  }) {
    return AgendaProvider(
      day: day,
    );
  }

  @override
  AgendaProvider getProviderOverride(
    covariant AgendaProvider provider,
  ) {
    return call(
      day: provider.day,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'agendaProvider';
}

/// See also [agenda].
class AgendaProvider extends AutoDisposeProvider<String> {
  /// See also [agenda].
  AgendaProvider({
    int day = 1,
  }) : this._internal(
          (ref) => agenda(
            ref as AgendaRef,
            day: day,
          ),
          from: agendaProvider,
          name: r'agendaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$agendaHash,
          dependencies: AgendaFamily._dependencies,
          allTransitiveDependencies: AgendaFamily._allTransitiveDependencies,
          day: day,
        );

  AgendaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.day,
  }) : super.internal();

  final int day;

  @override
  Override overrideWith(
    String Function(AgendaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AgendaProvider._internal(
        (ref) => create(ref as AgendaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        day: day,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _AgendaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AgendaProvider && other.day == day;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, day.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AgendaRef on AutoDisposeProviderRef<String> {
  /// The parameter `day` of this provider.
  int get day;
}

class _AgendaProviderElement extends AutoDisposeProviderElement<String>
    with AgendaRef {
  _AgendaProviderElement(super.provider);

  @override
  int get day => (origin as AgendaProvider).day;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
