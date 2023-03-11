import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receptyUser/features/components/_video_player.dart';

class PlayVideo extends StatefulWidget {
  final String? video;
  const PlayVideo({Key? key, this.video}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{

        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
        ]);
        return true;
      },
      child: Scaffold(
        body: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: MyVideoPlayer(
              playAble: true,
              isLocal: false,
              mediumId: widget.video?? '',
            )),
      ),
    );
  }
}
