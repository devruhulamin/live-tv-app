import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mojo_live_tv/core/enums/tv_channels_url.dart';
import 'package:mojo_live_tv/presentation/blocs/channel_bloc.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip({super.key});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  int _selectedIdx = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: TvChannelsEnums.values.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = TvChannelsEnums.values[index];
          final name = item.name.toUpperCase();
          return RawChip(
            label: Text(name),
            selected: index == _selectedIdx,
            onPressed: () {
              _selectedIdx = index;
              context.read<ChannelBloc>().add(
                    LoadChannelByCategory(
                      channelsEnums: item,
                    ),
                  );

              setState(() {});
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
