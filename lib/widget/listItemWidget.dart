import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:userdetail/screens/userDetailScreen.dart';
import 'package:userdetail/utils/appText.dart';
import 'package:userdetail/widget/customText.dart';

import '../models/usersModel.dart';
import '../utils/appColor.dart';

class ListItemWidget extends StatelessWidget {
  UsersModel usersModel;
   ListItemWidget({Key? key,required this.usersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
onTap: (){
  Get.to(UserDetailScreen(usersModel: usersModel));
},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:10.sp,vertical: 5.sp),
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [BoxShadow(
            color: Colors.black12,
            blurRadius: 10
          )]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(children: [CustomText(text: AppText.name,fontWeight: FontWeight.w700),CustomText(text:usersModel.name ?? "",color: AppColor.lightBlack),],),
            Wrap(children: [CustomText(text:AppText.phoneNo,fontWeight: FontWeight.w700,),CustomText(text:usersModel.phone ?? "",color: AppColor.lightBlack),],),
            Wrap(children: [CustomText(text:AppText.email,fontWeight: FontWeight.w700,),CustomText(text:usersModel.email ?? "",color: AppColor.lightBlack),],),
            Wrap(children: [CustomText(text:AppText.website,fontWeight: FontWeight.w700,),CustomText(text:usersModel.website ?? "",color: AppColor.lightBlack),],)
          ],
        ),

      ),
    );
  }
}
