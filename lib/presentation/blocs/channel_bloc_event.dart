part of 'channel_bloc.dart';

sealed class ChannleEvent {
  final TvChannelsEnums channelsEnums;

  ChannleEvent({required this.channelsEnums});
}

class LoadChannelByCategory extends ChannleEvent {
  LoadChannelByCategory({required super.channelsEnums});
}
