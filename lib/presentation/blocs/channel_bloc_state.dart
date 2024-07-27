// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'channel_bloc.dart';

sealed class ChannelBlocState {
  final bool isLoading;

  ChannelBlocState({required this.isLoading});
}

class LoadingChannelState extends ChannelBlocState {
  LoadingChannelState({required super.isLoading});
}

class FailedToLoadChannel extends ChannelBlocState {
  final String errorMessage;

  FailedToLoadChannel({required this.errorMessage, required super.isLoading});
}

class SuccessFullyLoaddedChannel extends ChannelBlocState {
  List<Channel> channelsList;
  SuccessFullyLoaddedChannel({
    required this.channelsList,
    required super.isLoading,
  });
}
