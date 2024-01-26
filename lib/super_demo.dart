import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

/// Example of a horizontal rule component that is not directly selectable.
///
/// The user can select around the horizontal rule, but cannot select it, specifically.
class SuperDemo extends StatefulWidget {
  const SuperDemo({super.key});

  @override
  State<SuperDemo> createState() => _SuperDemoState();
}

class _SuperDemoState extends State<SuperDemo> {
  late MutableDocument _doc;
  late MutableDocumentComposer _composer;
  late Editor _docEditor;

  @override
  void initState() {
    super.initState();
    _doc = _createDocument();
    _composer = MutableDocumentComposer();
    _docEditor =
        createDefaultDocumentEditor(document: _doc, composer: _composer);
  }

  @override
  void dispose() {
    _doc.dispose();
    super.dispose();
  }

  MutableDocument _createDocument() {
    return MutableDocument(
      nodes: [
        ParagraphNode(
          id: Editor.createNodeId(),
          text: AttributedText(
            text: "Hello World!",
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SuperEditor(
      editor: _docEditor,
      document: _doc,
      composer: _composer,
      stylesheet: defaultStylesheet.copyWith(
        documentPadding:
            const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      ),
    );
  }
}
