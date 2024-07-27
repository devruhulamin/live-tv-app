import 'package:flutter/material.dart';
import 'package:mojo_live_tv/core/enums/tv_channels_url.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: ListView.separated(
        itemCount: TvChannelsEnums.values.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final name = TvChannelsEnums.values[index].name.toUpperCase();
          return RawChip(label: Text(name));
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
