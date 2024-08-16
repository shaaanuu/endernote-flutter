import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const Color markdownHeadingColor = Color(0xFFcdd6f4);
const Color markdownParagraphColor = Color(0xFFbac2de);
const Color markdownCodeColor = Color(0xFF11111b);

MarkdownStyleSheet mdTheme() => MarkdownStyleSheet(
      h1: const TextStyle(
        color: markdownHeadingColor,
        fontWeight: FontWeight.bold,
      ),
      h2: const TextStyle(
        color: markdownHeadingColor,
        fontWeight: FontWeight.bold,
      ),
      h3: const TextStyle(
        color: markdownHeadingColor,
        fontWeight: FontWeight.bold,
      ),
      h4: const TextStyle(
        color: markdownHeadingColor,
        fontWeight: FontWeight.bold,
      ),
      h5: const TextStyle(
        color: markdownHeadingColor,
        fontWeight: FontWeight.bold,
      ),
      h6: const TextStyle(
        color: markdownHeadingColor,
        fontWeight: FontWeight.bold,
      ),
      p: const TextStyle(
        color: markdownParagraphColor,
      ),
      codeblockDecoration: BoxDecoration(
        color: markdownCodeColor,
        borderRadius: BorderRadius.circular(5),
      ),
      code: const TextStyle(
        color: markdownParagraphColor,
        backgroundColor: markdownCodeColor,
      ),
      blockquoteDecoration: BoxDecoration(
        color: markdownCodeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      horizontalRuleDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          top: BorderSide(
            width: 5.0,
            color: Color(0xFFb4befe),
          ),
        ),
      ),
      a: const TextStyle(color: Color(0xFF89b4fa)),
    );
