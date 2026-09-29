import 'package:flutter/material.dart';
import '../models/action_item.dart';
import 'quick_action_tile.dart';
import 'section_title.dart';

class FrequentlyUsedSection extends StatelessWidget {
  final List<ActionItem> items;
  const FrequentlyUsedSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Frequently Used'),
        SizedBox(height: 20),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, _) => SizedBox(width: 16),
            itemBuilder: (context, index) =>
                QuickActionTile(item: items[index]),
          ),
        ),
      ],
    );
  }
}
