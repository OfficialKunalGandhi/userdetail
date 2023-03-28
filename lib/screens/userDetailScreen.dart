import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:userdetail/utils/appText.dart';
import 'package:userdetail/utils/space.dart';
import 'package:userdetail/widget/customText.dart';

import '../models/usersModel.dart';
import '../utils/appColor.dart';

class UserDetailScreen extends StatelessWidget {
  UsersModel usersModel;

  UserDetailScreen({Key? key, required this.usersModel}) : super(key: key);
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppText.userDetail),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  CustomText(text: AppText.name, fontWeight: FontWeight.w700),
                  CustomText(text: usersModel.name ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.phoneNo,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.phone ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.email,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.email ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.website,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.website ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.companyDetails,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  )
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.companyName,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.company!.name ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.companyBs,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.company!.catchPhrase ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.companyCatchPhrase,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.company!.catchPhrase ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.address,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  )
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.suite,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.address!.suite ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.city,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.address!.city ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.street,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.address!.street ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              Wrap(
                children: [
                  CustomText(
                    text: AppText.zipCode,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(text: usersModel.address!.zipcode ?? "", color: AppColor.lightBlack),
                ],
              ),
              10.sp.sHeight,
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 250.sp,
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            double.parse(usersModel.address!.geo!.lat!), double.parse(usersModel.address!.geo!.lng!)),
                        zoom: 1.33),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
