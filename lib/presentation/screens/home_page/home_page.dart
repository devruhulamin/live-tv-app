import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mojo_live_tv/core/enums/tv_channels_url.dart';
import 'package:mojo_live_tv/presentation/blocs/channel_bloc.dart';
import 'package:mojo_live_tv/presentation/screens/home_page/category_chip.dart';
import 'package:mojo_live_tv/presentation/screens/tv_view_page/channels_grid_view.dart';
import 'package:mojo_live_tv/shared/widgets/loading_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ChannelBloc>().add(LoadChannelByCategory(channelsEnums: TvChannelsEnums.entertainment));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChannelBloc, ChannelBlocState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen.instance().show(context: context);
        } else {
          LoadingScreen.instance().hide();
        }
      },
      builder: (context, state) {
        if (state is FailedToLoadChannel) {
          return Scaffold(
            body: Center(
              child: Text(state.errorMessage),
            ),
          );
        }
        if (state is SuccessFullyLoaddedChannel) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home "),
            ),
            body: Column(
              children: [
                const Expanded(
                  child: CategoryChip(),
                ),
                Expanded(flex: 12, child: ChannelsGridView(channels: state.channelsList)),
              ],
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text("Something went wrong"),
          ),
        );
      },
    );
  }
}
