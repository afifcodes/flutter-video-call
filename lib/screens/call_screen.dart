import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_call/utils/system_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool isCamOn = true;
  bool isMicOn = true;
  bool isVolOn = true;

  String them =
      'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';
  String me =
      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

  //
  // @idnflutter
  // afifudinx.vercel.app/flutter
  //

  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'End-to-End Encrypted',
          style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Center(
                child: Icon(
              Ionicons.person_add_outline,
              color: Colors.grey[900],
              size: 16,
            )),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(me), fit: BoxFit.cover)),
            child: Center(
              child: Text(
                isVolOn ? '' : 'Audio is muted',
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 24, top: 64),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.5)
              ], stops: const [
                0.1,
                0.9
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(99)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        callButton(
                            onTap: () {
                              setState(() {
                                isCamOn = !isCamOn;
                              });
                            },
                            icon: Icon(isCamOn
                                ? Ionicons.videocam_outline
                                : Ionicons.videocam_off_outline)),
                        callButton(
                            onTap: () {
                              setState(() {
                                isMicOn = !isMicOn;
                              });
                            },
                            icon: Icon(isMicOn
                                ? Ionicons.mic_outline
                                : Ionicons.mic_off_outline)),
                        callButton(
                            onTap: () {
                              setState(() {
                                isVolOn = !isVolOn;
                              });
                            },
                            icon: Icon(isVolOn
                                ? Ionicons.volume_high_outline
                                : Ionicons.volume_mute_outline)),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: const Icon(
                            Ionicons.call,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 96, bottom: 124),
            padding: const EdgeInsets.all(24),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 144,
                width: 96,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(them), fit: BoxFit.cover),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 24,
                      )
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: isCamOn ? 0 : 4, sigmaY: isCamOn ? 0 : 4),
                    child: Center(
                      child: Icon(
                        Ionicons.mic_off_circle,
                        color: isMicOn ? Colors.transparent : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget callButton({onTap, icon}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
      child: icon,
    ),
  );
}
