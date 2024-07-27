import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mojo_live_tv/data/data_sources/local/local_db_provider.dart';
import 'package:mojo_live_tv/data/data_sources/remote/load_tv_channel_remote.dart';
import 'package:mojo_live_tv/data/repositories/tv_channel_repo.dart';
import 'package:mojo_live_tv/presentation/blocs/channel_bloc.dart';
import 'package:mojo_live_tv/router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repo = TvChannelRepo(
          loadChannelRemote: LoadTvChannelFromRemote(),
          sharedPreferencesService: SharedPreferencesService(),
        );
        return ChannelBloc(tvChannelRepo: repo);
      },
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
