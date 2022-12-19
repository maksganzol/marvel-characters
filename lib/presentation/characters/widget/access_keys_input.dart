import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/models/access_keys.dart';
import 'package:marvel_characters/presentation/characters/widget/cta_button.dart';

class AccessKeysInput extends StatefulWidget {
  const AccessKeysInput._({
    required this.currentKeys,
    required this.onKeysSet,
  });

  final AccessKeys? currentKeys;
  final ValueSetter<AccessKeys> onKeysSet;

  static Future<void> show(
    BuildContext context, {
    required AccessKeys? currentKeys,
    required ValueSetter<AccessKeys> onKeysSet,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      useRootNavigator: true,
      builder: (context) => Wrap(
        children: [
          AccessKeysInput._(
            currentKeys: currentKeys,
            onKeysSet: onKeysSet,
          ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _AccessKeysInputState();
}

class _AccessKeysInputState extends State<AccessKeysInput> {
  late final TextEditingController _publicKeyController;
  late final TextEditingController _privateKeyController;

  AccessKeys get _accessKeys => AccessKeys(
        publicKey: _publicKeyController.text,
        privateKey: _privateKeyController.text,
      );

  @override
  void initState() {
    super.initState();
    _publicKeyController = TextEditingController(
      text: widget.currentKeys?.publicKey ?? '',
    );
    _privateKeyController = TextEditingController(
      text: widget.currentKeys?.privateKey ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 48, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Public key'),
          TextFormField(controller: _publicKeyController),
          const SizedBox(height: 16),
          const Text('Private key'),
          TextFormField(
            controller: _privateKeyController,
            obscureText: true,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: CtaButton(
              onPressed: () {
                context.router.pop();
                widget.onKeysSet(_accessKeys);
              },
              label: 'Save',
            ),
          )
        ],
      ),
    );
  }
}
