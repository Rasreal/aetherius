import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlbumPageWidget extends StatefulWidget {
  const AlbumPageWidget({
    Key? key,
    this.album,
  }) : super(key: key);

  final AlbumRecord? album;

  @override
  _AlbumPageWidgetState createState() => _AlbumPageWidgetState();
}

class _AlbumPageWidgetState extends State<AlbumPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Album',
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget.album!.img,
                              'https://s3.amazonaws.com/media.thecrimson.com/photos/2020/04/02/211518_1343746.jpg',
                            ),
                            width: 220,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Text(
                            widget.album!.name!,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                          child: StreamBuilder<List<TracksRecord>>(
                            stream: queryTracksRecord(
                              queryBuilder: (tracksRecord) =>
                                  tracksRecord.where('albumRef',
                                      isEqualTo: widget.album!.reference),
                            ),
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
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'trackPlayerPage222',
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
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: FlutterFlowAudioPlayer(
                                            audio: Audio.network(
                                              listViewTracksRecord.linkUrl!,
                                              metas: Metas(
                                                id: 'sample3.mp3-k23pb2bl',
                                                title:
                                                    listViewTracksRecord.name,
                                              ),
                                            ),
                                            titleTextStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                                            playbackButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeTrackColor: Color(0xFF57636C),
                                            elevation: 4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
