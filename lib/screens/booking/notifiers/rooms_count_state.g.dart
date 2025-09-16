// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_count_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$roomsCountStateHash() => r'f605cc3f52d844bf6641cf1748ded64bdd8c640b';

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

abstract class _$RoomsCountState extends BuildlessNotifier<int> {
  late final int index;

  int build(int index);
}

/// See also [RoomsCountState].
@ProviderFor(RoomsCountState)
const roomsCountStateProvider = RoomsCountStateFamily();

/// See also [RoomsCountState].
class RoomsCountStateFamily extends Family<int> {
  /// See also [RoomsCountState].
  const RoomsCountStateFamily();

  /// See also [RoomsCountState].
  RoomsCountStateProvider call(int index) {
    return RoomsCountStateProvider(index);
  }

  @override
  RoomsCountStateProvider getProviderOverride(
    covariant RoomsCountStateProvider provider,
  ) {
    return call(provider.index);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'roomsCountStateProvider';
}

/// See also [RoomsCountState].
class RoomsCountStateProvider
    extends NotifierProviderImpl<RoomsCountState, int> {
  /// See also [RoomsCountState].
  RoomsCountStateProvider(int index)
    : this._internal(
        () => RoomsCountState()..index = index,
        from: roomsCountStateProvider,
        name: r'roomsCountStateProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$roomsCountStateHash,
        dependencies: RoomsCountStateFamily._dependencies,
        allTransitiveDependencies:
            RoomsCountStateFamily._allTransitiveDependencies,
        index: index,
      );

  RoomsCountStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  int runNotifierBuild(covariant RoomsCountState notifier) {
    return notifier.build(index);
  }

  @override
  Override overrideWith(RoomsCountState Function() create) {
    return ProviderOverride(
      origin: this,
      override: RoomsCountStateProvider._internal(
        () => create()..index = index,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  NotifierProviderElement<RoomsCountState, int> createElement() {
    return _RoomsCountStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomsCountStateProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomsCountStateRef on NotifierProviderRef<int> {
  /// The parameter `index` of this provider.
  int get index;
}

class _RoomsCountStateProviderElement
    extends NotifierProviderElement<RoomsCountState, int>
    with RoomsCountStateRef {
  _RoomsCountStateProviderElement(super.provider);

  @override
  int get index => (origin as RoomsCountStateProvider).index;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
