import 'dart:io';

import 'package:aetherius_cloud/flutter_flow/audio_player_frg.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../libr_dummy_page_copy/downloads_page.dart';

String localPath = '';

class TrackPlayerPage222Widget extends StatefulWidget {
  const TrackPlayerPage222Widget({
    Key? key,
    this.track,
  }) : super(key: key);

  final TracksRecord? track;

  @override
  _TrackPlayerPage222WidgetState createState() =>
      _TrackPlayerPage222WidgetState();
}

class _TrackPlayerPage222WidgetState extends State<TrackPlayerPage222Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool downloading = false;
  bool downloaded = false;
  double percent = 0;

  String localPath = '';
  String localPath2 = '';

  double percentCirc = 0;

  Widget downloadBtn(bool downloading, bool downloaded) {
    if (downloading == false && downloaded == true) {
      return Icon(
        Icons.cloud_download_outlined,
        color: Color(0xFF464646),
        size: 30,
      );
    } else if (downloading == false && downloaded == false) {
      return Icon(
        Icons.cloud_download_outlined,
        color: Color(0xFF464646),
        size: 30,
      );
    } else if (downloading == true) {
      return CircularPercentIndicator(
        radius: 12.0,
        lineWidth: 3.5,
        percent: percentCirc,
        center: Text("%"),
        progressColor: Colors.red,
      );
      return Icon(
        Icons.cloud_download_outlined,
        color: Color(0xFF464646),
        size: 30,
      );
    } else
      return Icon(
        Icons.cloud_download_outlined,
        color: Color(0xFF464646),
        size: 30,
      );
  }

  String checkTrack() {
    if (widget.track!.name == "Man's Mind") {
      if (FFAppState().downloaded == true) {
        return FFAppState().audioTemp1;
      } else {
        return widget.track!.linkUrl!;
      }
    } else if (widget.track!.name == "The Devic Kingdom") {
      if (FFAppState().downloaded2 == true) {
        return FFAppState().audioTemp2;
      } else {
        return widget.track!.linkUrl!;
      }
    } else {
      if (FFAppState().downloaded3 == true) {
        return FFAppState().audioTemp3;
      } else {
        return widget.track!.linkUrl!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 45,
                borderWidth: 1,
                buttonSize: 55,
                icon: downloadBtn(downloading, downloaded), //Icon(
                //   Icons.cloud_download_outlined,
                //   color: Color(0xFF464646),
                //   size: 30,
                // ),
                onPressed: () async {
                  String trackUrl = widget.track!.linkUrl!;
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                  ].request();
                  if (statuses[Permission.storage]!.isGranted) {
                    Directory? dir1;
                    if (Platform.isIOS) {
                      //dir1 = await getApplicationDocumentsDirectory();

                      dir1 = await getLibraryDirectory();
                    } else {
                      dir1 = await getExternalStorageDirectory();
                    }

                    String src = dir1!.path;

                    print(src);
                    String savePath =
                        dir1.path + "/${widget.track!.name}" + ".m4a";

                    savePath = savePath.replaceAll(" ", "_");
                    print(savePath);
                    localPath = savePath;
                    localPath2 = savePath.replaceAll(".m4a", "");

                    File a = File.fromUri(Uri.parse(localPath));
                    //
                    print(a.absolute);

                    //savePath = "assets/audios/";

                    if (downloading == false && downloaded == false) {
                      try {
                        await Dio().download(trackUrl, savePath,
                            onReceiveProgress: (received, total) {
                          setState(() {
                            downloading = true;
                          });
                          percent = (received / total * 100);
                          percentCirc = (received / total);
                          //print(percentCirc);

                          if (total != -1) {
                            if (percent == 12 ||
                                percent == 24 ||
                                percent == 36 ||
                                percent == 48 ||
                                percent == 60 ||
                                percent == 72 ||
                                percent == 84)
                              print(
                                  (received / total * 100).toStringAsFixed(0) +
                                      "%");
                            //you can build progressbar feature too
                          }
                        });
                        setState(() {
                          if (widget.track!.name == "Man's Mind") {
                            FFAppState().downloaded = true;
                            FFAppState().audioTemp1 = localPath;
                          } else if (widget.track!.name ==
                              "The Devic Kingdom") {
                            FFAppState().downloaded2 = true;
                            FFAppState().audioTemp2 = localPath;
                          } else {
                            FFAppState().downloaded3 = true;
                            FFAppState().audioTemp3 = localPath;
                          }

                          FFAppState().downloaded = true;
                          FFAppState().audioTemp1 = localPath;

                          downloading = false;
                          downloaded = true;
                        });
                        Uri uri = Uri.parse(savePath);
                        String localUri = uri.toString();
                        print(localUri);

                        bool bb = await a.exists();
                        print("File eists: " + bb.toString());
                        print("File is saved to download folder.");
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
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.favorite,
                  color: valueOrDefault<Color>(
                    widget.track!.fav == true
                        ? Color(0xFFF32929)
                        : Color(0xBDFFFFFF),
                    Colors.white,
                  ),
                  size: 30,
                ),
                onPressed: () async {
                  // setState(() async {
                  //   if (widget.track!.fav == false) {
                  //     final tracksUpdateData = createTracksRecordData(
                  //       fav: true,
                  //     );
                  //
                  //     await widget.track!.update(tracksUpdateData);
                  //     widget.track.reference
                  //   } else {
                  //     final tracksUpdateData = createTracksRecordData(
                  //       fav: false,
                  //     );
                  //     await widget.track!.reference.update(tracksUpdateData);
                  //   }
                  // });
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Color(0xFFE2E2E2),
                  size: 25,
                ),
                onPressed: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Do you want to delete this track?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    setState(() {
                      if (widget.track!.name == "Man's Mind") {
                        FFAppState().downloaded = false;
                      } else if (widget.track!.name == "The Devic Kingdom") {
                        FFAppState().downloaded2 = false;
                      } else {
                        FFAppState().downloaded3 = false;
                      }
                    });
                  }
                  print('IconButton pressed ...');
                },
              ),
            ],
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.network(
                                    widget.track!.img!,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 48, 0, 0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.track!.name,
                                  'Track Name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'SF pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                              child: Text(
                                widget.track!.speaker!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'SF pro',
                                      color: Color(0xFFB4B4B4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            if (widget.track!.albumRef != null)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Text(
                                  'From the ${widget.track!.category}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'SF pro',
                                        color: Color(0xFFCBCBCB),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            Text(
                              '${widget.track!.category} ${widget.track!.length}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'SF pro',
                                    color: Color(0xFFB4B4B4),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Text(
                              widget.track!.recommendation!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'SF pro',
                                    color: Color(0xFF909090),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 41, 0, 0),
                              child: ReadMoreText(
                                widget.track!.description!,
                                trimLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'SF pro',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      useGoogleFonts: false,
                                    ),
                                colorClickableText: Colors.blue,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'read more',
                                trimExpandedText: ' read less ',
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 13, 0, 42),
                              child: ReadMoreText(
                                widget.track!.listeningNotes!,
                                trimLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'SF pro',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      useGoogleFonts: false,
                                    ),
                                colorClickableText: Colors.blue,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'read more',
                                trimExpandedText: ' read less ',
                              ),
                            ),
                            AudioPlayerFRG(
                              audio: Audio.network(
                                FFAppState().downloaded == true
                                    ? FFAppState().audioTemp1
                                    : widget.track!.linkUrl!,
                                metas: Metas(
                                  id: 'sample3.mp3-7e0u3r41',
                                ),
                              ),
                              titleTextStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                              playbackDurationTextStyle:
                                  FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF9D9D9D),
                                        fontSize: 12,
                                      ),
                              fillColor: Colors.black,
                              playbackButtonColor: Colors.white,
                              activeTrackColor: Color(0xFF57636C),
                              elevation: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
