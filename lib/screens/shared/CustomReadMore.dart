import 'package:flutter/material.dart';

class CustomReadMore extends StatefulWidget {
  final String text;
  final int initialLines;
  final int expendedLines;
  final TextStyle style;

  CustomReadMore(
      {this.text, this.initialLines, this.expendedLines, this.style});

  @override
  _CustomReadMoreState createState() => _CustomReadMoreState();
}

class _CustomReadMoreState extends State<CustomReadMore> {
  bool isExpanded = false;

  void _toggleExpanded() => setState(() {
        isExpanded = !isExpanded;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> listWidgets = <Widget>[
      _textWidget(),
      SizedBox(
        height: 20.0,
      ),
      _shouldShowReadMore()
    ];

    return listWidgets;
  }

  _shouldShowReadMore() => LayoutBuilder(builder: (context, size) {
        final span = TextSpan(
          text: widget.text,
          style: widget.style,
        );

        final tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
          maxLines:
              this.isExpanded ? widget.expendedLines : widget.initialLines,
        );

        tp.layout(maxWidth: size.maxWidth);

        if (tp.didExceedMaxLines || tp.maxLines == widget.expendedLines) {
          return InkWell(
            onTap: () => _toggleExpanded(),
            child: _readMoreTextWidget(),
          );
        } else {
          return SizedBox(
            height: 1,
          );
        }
      });

  Widget _textWidget() => Text(
        widget.text,
        maxLines: this.isExpanded ? widget.expendedLines : widget.initialLines,
      );

  Widget _readMoreTextWidget() => Text(
        this.isExpanded ? 'Read Less ...' : 'Read More ...',
        style: TextStyle(color: Colors.grey),
      );
}
