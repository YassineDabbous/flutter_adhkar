import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

enum MyPlayerState { stopped, playing, paused }
//enum MyPlayingRouteState { speakers, earpiece }

class PlayBtn extends StatefulWidget {
  final String url;

  const PlayBtn({Key? key, required this.url}) : super(key: key);

  @override
  _PlayBtnState createState() => _PlayBtnState();
}

class _PlayBtnState extends State<PlayBtn> {
  late AudioPlayer _audioPlayer;
  MyPlayerState _playerState = MyPlayerState.stopped;
  //AudioPlayer? _audioPlayerState;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerErrorSubscription;
  StreamSubscription? _playerStateSubscription;

  get _isPlaying => _playerState == MyPlayerState.playing;
  get _isPaused => _playerState == MyPlayerState.paused;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.url == null
        ? const Icon(Icons.play_arrow, color: Colors.grey)
        : FittedBox(
            fit: BoxFit.fill,
            child: Stack(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onLongPress: _isPlaying || _isPaused ? () => _stop() : null,
                    onTap: _toggle,
                    child: Icon(_isPlaying ? Icons.stop : Icons.play_arrow, color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
  }

  void _toggle() {
    debugPrint(widget.url);
    _isPlaying ? _stop() : _play();
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

    _playerCompleteSubscription = _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
    });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      debugPrint('audioPlayer error : $msg');
      setState(() {
        _playerState = MyPlayerState.stopped;
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        //_audioPlayerState = state;
      });
    });

    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        //_audioPlayerState = state;
      });
    });
  }

  Future<int> _play() async {
    final result = await _audioPlayer.play(widget.url);
    if (result == 1) setState(() => _playerState = MyPlayerState.playing);

    // default playback rate is 1.0
    // this should be called after _audioPlayer.play() or _audioPlayer.resume()
    // this can also be called everytime the user wants to change playback rate in the UI
    _audioPlayer.setPlaybackRate(1.0);

    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = MyPlayerState.paused);
    return result;
  }

  Future<int> _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _playerState = MyPlayerState.stopped;
      });
    }
    return result;
  }

  void _onComplete() {
    setState(() => _playerState = MyPlayerState.stopped);
  }
}
