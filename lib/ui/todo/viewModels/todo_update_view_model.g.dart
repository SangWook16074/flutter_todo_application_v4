// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_update_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoUpdateViewModelHash() =>
    r'9199d8c2a43726d1c7baa1f1e6c70ba2fe224f68';

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

abstract class _$TodoUpdateViewModel
    extends BuildlessAutoDisposeNotifier<TodoUpdateViewState> {
  late final Todo todo;

  TodoUpdateViewState build(Todo todo);
}

/// See also [TodoUpdateViewModel].
@ProviderFor(TodoUpdateViewModel)
const todoUpdateViewModelProvider = TodoUpdateViewModelFamily();

/// See also [TodoUpdateViewModel].
class TodoUpdateViewModelFamily extends Family<TodoUpdateViewState> {
  /// See also [TodoUpdateViewModel].
  const TodoUpdateViewModelFamily();

  /// See also [TodoUpdateViewModel].
  TodoUpdateViewModelProvider call(Todo todo) {
    return TodoUpdateViewModelProvider(todo);
  }

  @override
  TodoUpdateViewModelProvider getProviderOverride(
    covariant TodoUpdateViewModelProvider provider,
  ) {
    return call(provider.todo);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoUpdateViewModelProvider';
}

/// See also [TodoUpdateViewModel].
class TodoUpdateViewModelProvider
    extends
        AutoDisposeNotifierProviderImpl<
          TodoUpdateViewModel,
          TodoUpdateViewState
        > {
  /// See also [TodoUpdateViewModel].
  TodoUpdateViewModelProvider(Todo todo)
    : this._internal(
        () => TodoUpdateViewModel()..todo = todo,
        from: todoUpdateViewModelProvider,
        name: r'todoUpdateViewModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$todoUpdateViewModelHash,
        dependencies: TodoUpdateViewModelFamily._dependencies,
        allTransitiveDependencies:
            TodoUpdateViewModelFamily._allTransitiveDependencies,
        todo: todo,
      );

  TodoUpdateViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todo,
  }) : super.internal();

  final Todo todo;

  @override
  TodoUpdateViewState runNotifierBuild(covariant TodoUpdateViewModel notifier) {
    return notifier.build(todo);
  }

  @override
  Override overrideWith(TodoUpdateViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodoUpdateViewModelProvider._internal(
        () => create()..todo = todo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todo: todo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TodoUpdateViewModel, TodoUpdateViewState>
  createElement() {
    return _TodoUpdateViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoUpdateViewModelProvider && other.todo == todo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TodoUpdateViewModelRef
    on AutoDisposeNotifierProviderRef<TodoUpdateViewState> {
  /// The parameter `todo` of this provider.
  Todo get todo;
}

class _TodoUpdateViewModelProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TodoUpdateViewModel,
          TodoUpdateViewState
        >
    with TodoUpdateViewModelRef {
  _TodoUpdateViewModelProviderElement(super.provider);

  @override
  Todo get todo => (origin as TodoUpdateViewModelProvider).todo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
