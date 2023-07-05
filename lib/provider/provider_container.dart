import 'package:hooks_riverpod/hooks_riverpod.dart';

/// If I do need a provider outside of an ConsumerWidget, I have no
/// ref object, so I need the ProviderContainer to ask for it
final ProviderContainer providerContainer = ProviderContainer();
