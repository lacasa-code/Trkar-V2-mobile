import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trkar/core/router/router.gr.dart';
import '../../../core/extensions/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/themes/screen_utility.dart';

class ProfileHeaderItem extends StatelessWidget {
  const ProfileHeaderItem({
    Key? key,
    this.userImage,
    this.emailAddress,
    this.userName,
  }) : super(key: key);
  final String? userImage;
  final String? userName;
  final String? emailAddress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: ScreenUtil().setHeight(90),
      // width: ScreenUtil().setWidth(90),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListTile(
          // leading: Container(
          //   decoration: BoxDecoration(
          //     // TODO :remove comment
          //     // border: Border.all(width: 2,color: Theme.of(context).primaryColor),
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       image: userImage == null
          //           ? const AssetImage('assets/images/profile2.png')
          //           : NetworkImage(
          //               userImage ?? '',
          //             ) as ImageProvider,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          onTap: () {
            context.router.push(
              const EditProfileScreen(),
            );
          },
          leading: CircleAvatar(
            backgroundColor: MainStyle.lightGreyColor,
            radius: ScreenUtil().radius(35),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: ScreenUtil().radius(34),
                backgroundImage: userImage == null
                    ? const AssetImage('assets/images/profile2.png')
                    : NetworkImage(
                        userImage ?? '',
                      ) as ImageProvider,
              ),
            ),
          ),
          title: Text(
            '${'hi'.translate}, $userName',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(13),
                ),
          ),
          subtitle: Text(
            emailAddress ?? '',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(12),
                ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: ScreenUtil().radius(15),
            color: Theme.of(context).primaryIconTheme.color,
          ),
        ),
      ),
    );
    /** return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(35)),
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(60)),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: ScreenUtil().setHeight(120),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/profile_cover.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -ScreenUtil().setHeight(85),
            child: Column(
              children: [
                Container(
                  height: ScreenUtil().setHeight(80),
                  width: ScreenUtil().setWidth(80),
                  decoration: BoxDecoration(
                    // TODO :remove comment
                    // border: Border.all(width: 2,color: Theme.of(context).primaryColor),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: userImage == null
                          ? const AssetImage('assets/images/profile2.png')
                          : NetworkImage(
                              userImage ?? '',
                            ) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                   userName??'',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  emailAddress??'',
                  style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
            // child: CircleAvatar(
            //    backgroundImage: AssetImage(
            //     'assets/icons/woman3.png',
            //   ),
            // ),
          )
        ],
      ),
    );*/
  }
}
