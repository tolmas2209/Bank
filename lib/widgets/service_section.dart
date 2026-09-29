import 'package:flutter/material.dart';
import '../models/action_item.dart';
import 'section_title.dart';
import 'service_card.dart';

class ServiceSection extends StatelessWidget {
  final List<ActionItem> items;
  const ServiceSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Service'),
        SizedBox(height: 20),
        Row(
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i != 0) SizedBox(width: 16),
              Expanded(child: ServiceCard(item: items[i])),
            ],
          ],
        ),
      ],
    );
  }
}
