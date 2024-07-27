import 'package:bloc/bloc.dart';
import 'package:mojo_live_tv/core/enums/tv_channels_url.dart';
import 'package:mojo_live_tv/data/repositories/tv_channel_repo.dart';
import 'package:mojo_live_tv/domain/models/m3u8_models.dart';

part 'channel_bloc_event.dart';
part 'channel_bloc_state.dart';

class ChannelBloc extends Bloc<ChannleEvent, ChannelBlocState> {
  final TvChannelRepo tvChannelRepo;

  ChannelBloc({required this.tvChannelRepo}) : super(LoadingChannelState(isLoading: true)) {
    on<LoadChannelByCategory>(onLoadChannels);
  }
  void onLoadChannels(ChannleEvent event, Emitter<ChannelBlocState> emit) async {
    try {
      emit(LoadingChannelState(isLoading: true));
      final channels = await tvChannelRepo.getTvChannel(event.channelsEnums);
      if (channels == null) {
        emit(FailedToLoadChannel(errorMessage: "Opps Failed to load Channels Data", isLoading: false));
      }
      emit(SuccessFullyLoaddedChannel(channelsList: channels ?? [], isLoading: false));
    } catch (e) {
      emit(FailedToLoadChannel(errorMessage: "Error : $e", isLoading: false));
    }
  }
}
