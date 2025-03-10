import 'package:flutter_screenutil/flutter_screenutil.dart';

    extension ScreenUtils on num {
      double get height => ScreenUtil().setHeight(this);
      double get width => ScreenUtil().setWidth(this);
      double get sp => ScreenUtil().setSp(this);
      double get radius => ScreenUtil().radius(this);
    }