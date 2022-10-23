import 'package:aetherius_cloud/flutter_flow/audio_download_player.dart';
import 'package:aetherius_cloud/index.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryPageWidget extends StatefulWidget {
  const LibraryPageWidget({Key? key}) : super(key: key);

  @override
  _LibraryPageWidgetState createState() => _LibraryPageWidgetState();
}

class _LibraryPageWidgetState extends State<LibraryPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'Start listening for free',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<TracksRecord>>(
                              stream: queryTracksRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<TracksRecord> listViewTracksRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewTracksRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewTracksRecord =
                                        listViewTracksRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: AudioDownloadPlayer(
                                        function: () {
                                          context.pushNamed(
                                            'trackPlayer222',
                                            queryParams: {
                                              'track': serializeParam(
                                                listViewTracksRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'track': listViewTracksRecord,
                                            },
                                          );
                                        },
                                        trackUrl: listViewTracksRecord.linkUrl!,
                                        trackName: listViewTracksRecord.name!,
                                        audio: Audio.network(
                                          listViewTracksRecord.linkUrl!,
                                          metas: Metas(
                                            id: 'sample3.mp3-3gg0gzim',
                                            title: listViewTracksRecord.name,
                                          ),
                                        ),
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context)
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
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
