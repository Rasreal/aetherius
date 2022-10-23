/*
 * Copyright 2019 Florent37
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * The source code used herein has been modified and added to.
 */

import 'dart:io';
import 'dart:math' as math;
//import 'package:aetherius_cloud/home/homeDownloads.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

export 'package:assets_audio_player/assets_audio_player.dart';
export 'package:assets_audio_player/assets_audio_player.dart';

import 'package:dio/dio.dart';
//import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../backend/backend.dart';
import '../flutter_flow/audio_download_player.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioDownloadPlayer extends StatefulWidget {
  const AudioDownloadPlayer({
    required this.function,
    required this.trackUrl,
    required this.trackName,
    required this.audio,
    required this.titleTextStyle,
    required this.playbackDurationTextStyle,
    required this.fillColor,
    required this.playbackButtonColor,
    required this.activeTrackColor,
    required this.elevation,
  });
  final Function function;
  final String trackUrl;
  final String trackName;
  final Audio audio;
  final TextStyle titleTextStyle;
  final TextStyle playbackDurationTextStyle;
  final Color fillColor;
  final Color playbackButtonColor;
  final Color activeTrackColor;
  final double elevation;

  @override
  _AudioDownloadPlayerState createState() => _AudioDownloadPlayerState();
}

class _AudioDownloadPlayerState extends State<AudioDownloadPlayer> {
  AssetsAudioPlayer? _assetsAudioPlayer;
  bool downloading = false;
  bool downloaded = false;
  Future<Directory?>? _downloadsDirectory;
  @override
  void initState() {
    super.initState();
    openPlayer();
  }

  void _requestDownloadsDirectory() {
    setState(() {
      _downloadsDirectory = getDownloadsDirectory();
    });
  }

  void updateUI() {
    setState(() {
      //You can also make changes to your state here.
    });
  }

  Icon downloadBtn(bool downloading, bool downloaded) {
    if (downloading == false && downloaded == true) {
      return Icon(Icons.done);
    } else if (downloading == false && downloaded == false) {
      return Icon(Icons.download);
    } else if (downloading == true) {
      return Icon(Icons.stop_circle_rounded);
    } else
      return Icon(Icons.download);
  }

  Future openPlayer() async {
    _assetsAudioPlayer ??=
        AssetsAudioPlayer.withId(generateRandomAlphaNumericString());
    if (_assetsAudioPlayer?.playlist != null) {
      _assetsAudioPlayer!.playlist!.replaceAt(0, (oldAudio) => widget.audio);
    } else {
      await _assetsAudioPlayer!.open(
        Playlist(audios: [widget.audio]),
        autoStart: false,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
      );
    }
  }

  @override
  void dispose() {
    _assetsAudioPlayer?.dispose();
    super.dispose();
  }

  Duration currentPosition(RealtimePlayingInfos infos) => infos.currentPosition;
  Duration duration(RealtimePlayingInfos infos) => infos.duration;

  String playbackStateText(RealtimePlayingInfos infos) {
    final currentPositionString = durationToString(currentPosition(infos));
    final durationString = durationToString(duration(infos));
    return '$currentPositionString/$durationString';
  }

  @override
  Widget build(BuildContext context) =>
      _assetsAudioPlayer!.builderRealtimePlayingInfos(
          builder: (context, infos) => PlayerBuilder.isPlaying(
              player: _assetsAudioPlayer!,
              builder: (context, isPlaying) {
                final childWidget = Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: widget.fillColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      widget.function();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.audio.metas.title ??
                                        widget.trackName,
                                    style: widget.titleTextStyle,
                                  ),
                                  Text(
                                    playbackStateText(infos),
                                    style: widget.playbackDurationTextStyle,
                                  )
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(34),
                              child: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                  onPressed: _assetsAudioPlayer!.playOrPause,
                                  icon: Icon(
                                    (isPlaying)
                                        ? Icons.pause_circle_filled_rounded
                                        : Icons.play_circle_fill_rounded,
                                    color: widget.playbackButtonColor,
                                    size: 34,
                                  ),
                                  iconSize: 34,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    Map<Permission, PermissionStatus> statuses =
                                        await [
                                      Permission.storage,
                                      //add more permission to request here.
                                    ].request();
                                    // Directory? dirr = await getDownloadsDirectory();
                                    // String dirr2 = dirr!.path;
                                    if (statuses[Permission.storage]!
                                        .isGranted) {
                                      Directory? dir1;
                                      // var dir = await DownloadsPathProvider
                                      //     .downloadsDirectory;
                                      if (Platform.isIOS) {
                                        dir1 =
                                            await getApplicationDocumentsDirectory();
                                      } else {
                                        dir1 =
                                            await getExternalStorageDirectory();
                                      }

                                      String src = dir1!.path;

                                      print(src);
                                      String savePath =
                                          dir1.path + "/${widget.trackName}";
                                      print(savePath);
                                      //output:  /storage/emulated/0/Download/banner.png
                                      if (downloading == false &&
                                          downloaded == false) {
                                        try {
                                          await Dio().download(
                                              widget.trackUrl, savePath,
                                              onReceiveProgress:
                                                  (received, total) {
                                            setState(() {
                                              downloading = true;
                                            });
                                            int percent =
                                                (received / total * 100)
                                                    .toInt();
                                            if (total != -1) {
                                              if (percent == 12 ||
                                                  percent == 24 ||
                                                  percent == 36 ||
                                                  percent == 48 ||
                                                  percent == 60 ||
                                                  percent == 72 ||
                                                  percent == 84)
                                                print((received / total * 100)
                                                        .toStringAsFixed(0) +
                                                    "%");
                                              //you can build progressbar feature too
                                            }
                                          });
                                          setState(() {
                                            downloading = false;
                                            downloaded = true;
                                          });
                                          print(
                                              "File is saved to download folder.");
                                        } on DioError catch (e) {
                                          print(e.message);
                                        }
                                      } else {
                                        // await Dio().delete(savePath);
                                        // setState(() {
                                        //   downloading = !downloading;
                                        // });
                                      }
                                    } else {
                                      print("No permission to read and write.");
                                    }
                                  },
                                  icon: downloadBtn(downloading, downloaded),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        PositionSeekWidget(
                          currentPosition: currentPosition(infos),
                          duration: duration(infos),
                          seekTo: (to) {
                            _assetsAudioPlayer!.seek(to);
                          },
                          activeTrackColor: widget.activeTrackColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
                return Material(
                    color: Colors.transparent,
                    elevation: widget.elevation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: childWidget);
              }));
}

class PositionSeekWidget extends StatefulWidget {
  const PositionSeekWidget({
    required this.currentPosition,
    required this.duration,
    required this.seekTo,
    required this.activeTrackColor,
  });

  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;
  final Color activeTrackColor;

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  late Duration _visibleValue;
  bool listenOnlyUserInteraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInteraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor: const Color(0xFFC9D0D5),
          trackShape: const FlutterFlowRoundedRectSliderTrackShape(),
          trackHeight: 6.0,
          thumbShape: SliderComponentShape.noThumb,
          overlayColor: const Color(0xFF57636C).withAlpha(32),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
        ),
        child: Slider(
          min: 0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: math.min(1.0, percent) *
              widget.duration.inMilliseconds.toDouble(),
          onChangeEnd: (newValue) => setState(() {
            listenOnlyUserInteraction = false;
            widget.seekTo(_visibleValue);
          }),
          onChangeStart: (_) =>
              setState(() => listenOnlyUserInteraction = true),
          onChanged: (newValue) => setState(
              () => _visibleValue = Duration(milliseconds: newValue.floor())),
        ),
      );
}

String durationToString(Duration duration) {
  String twoDigits(int n) => (n >= 10) ? '$n' : '0$n';

  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour).toInt());
  final twoDigitSeconds = twoDigits(
      duration.inSeconds.remainder(Duration.secondsPerMinute).toInt());
  final oneDigitHour =
      twoDigits(duration.inHours.remainder(Duration.hoursPerDay).toInt());
  if (oneDigitHour == "00") {
    return '$twoDigitMinutes:$twoDigitSeconds';
  } else
    return '$oneDigitHour:$twoDigitMinutes:$twoDigitSeconds';
}

// class FlutterFlowRoundedRectSliderTrackShape extends SliderTrackShape
//     with BaseSliderTrackShape {
//   /// Create a slider track that draws two rectangles with rounded outer edges.
//   const FlutterFlowRoundedRectSliderTrackShape();
//
//   @override
//   void paint(
//     PaintingContext context,
//     Offset offset, {
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required Animation<double> enableAnimation,
//     required TextDirection textDirection,
//     required Offset thumbCenter,
//     bool isDiscrete = false,
//     bool isEnabled = false,
//     double additionalActiveTrackHeight = 0,
//   }) {
//     assert(context != null);
//     assert(offset != null);
//     assert(parentBox != null);
//     assert(sliderTheme != null);
//     assert(sliderTheme.disabledActiveTrackColor != null);
//     assert(sliderTheme.disabledInactiveTrackColor != null);
//     assert(sliderTheme.activeTrackColor != null);
//     assert(sliderTheme.inactiveTrackColor != null);
//     assert(sliderTheme.thumbShape != null);
//     assert(enableAnimation != null);
//     assert(textDirection != null);
//     assert(thumbCenter != null);
//     // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
//     // then it makes no difference whether the track is painted or not,
//     // therefore the painting  can be a no-op.
//     if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
//       return;
//     }
//
//     // Assign the track segment paints, which are leading: active and
//     // trailing: inactive.
//     final ColorTween activeTrackColorTween = ColorTween(
//         begin: sliderTheme.disabledActiveTrackColor,
//         end: sliderTheme.activeTrackColor);
//     final ColorTween inactiveTrackColorTween = ColorTween(
//         begin: sliderTheme.disabledInactiveTrackColor,
//         end: sliderTheme.inactiveTrackColor);
//     final Paint activePaint = Paint()
//       ..color = activeTrackColorTween.evaluate(enableAnimation)!;
//     final Paint inactivePaint = Paint()
//       ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
//     final Paint leftTrackPaint = activePaint;
//     final Paint rightTrackPaint = inactivePaint;
//
//     final Rect trackRect = getPreferredRect(
//       parentBox: parentBox,
//       offset: offset,
//       sliderTheme: sliderTheme,
//       isEnabled: isEnabled,
//       isDiscrete: isDiscrete,
//     );
//     const Radius trackRadius = Radius.circular(2.0);
//     const Radius activeTrackRadius = Radius.circular(2.0);
//
//     context.canvas.drawRRect(
//       RRect.fromLTRBAndCorners(
//         thumbCenter.dx - activeTrackRadius.x,
//         trackRect.top,
//         trackRect.right,
//         trackRect.bottom,
//         topRight: trackRadius,
//         bottomRight: trackRadius,
//         topLeft: activeTrackRadius,
//         bottomLeft: activeTrackRadius,
//       ),
//       rightTrackPaint,
//     );
//     context.canvas.drawRRect(
//       RRect.fromLTRBAndCorners(
//         trackRect.left,
//         trackRect.top - (additionalActiveTrackHeight / 2),
//         thumbCenter.dx,
//         trackRect.bottom + (additionalActiveTrackHeight / 2),
//         topLeft: activeTrackRadius,
//         bottomLeft: activeTrackRadius,
//         topRight: trackRadius,
//         bottomRight: trackRadius,
//       ),
//       leftTrackPaint,
//     );
//   }
// }

String generateRandomAlphaNumericString() {
  const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  return String.fromCharCodes(Iterable.generate(
      8, (_) => chars.codeUnits[math.Random().nextInt(chars.length)]));
}
