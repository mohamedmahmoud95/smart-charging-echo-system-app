import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../data/model/app_user.dart';



class ProfilePicAndName extends StatefulWidget {
  const ProfilePicAndName({Key? key}) : super(key: key);

  @override
  State<ProfilePicAndName> createState() => _ProfilePicAndNameState();
}

class _ProfilePicAndNameState extends State<ProfilePicAndName> {

  ImageProvider<Object> getImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty)
    {
      debugPrint("image is empty");
      return const AssetImage('assets/images/no_image.png');
    }
    else if (imageUrl.startsWith('assets/')) {
      return AssetImage(imageUrl);
    } else if (imageUrl.startsWith('data:image/svg+xml;base64,')) {
      String base64Svg = imageUrl.replaceFirst('data:image/svg+xml;base64,', '');
      Uint8List bytes = base64Decode(base64Svg);
      String decodedSvg = utf8.decode(bytes);
      return MemoryImage(Uint8List.fromList(utf8.encode(decodedSvg)));
    } else if (imageUrl.startsWith('data:image/')) {
      List<String> parts = imageUrl.split(',');
      if (parts.length == 2) {
        String base64String = parts[1];
        return MemoryImage(const Base64Decoder().convert(base64String));
      } else {
        return const AssetImage('assets/images/no_image.png');
      }
    } else {
      // Check if it's a file path and use FileImage
      if (imageUrl.startsWith('file://')) {
        return FileImage(File(imageUrl));
      } else {
        // If it's not a file path, assume it's a network URL
        return NetworkImage(imageUrl);
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 79,
            backgroundColor: Colors.grey.shade200,
            child: CircleAvatar(
              radius: 77,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: 75,
                // foregroundImage: getImage('${CurrentAppUserData.currentAppUser.profilePicture}'),
                child: SizedBox(height:100,child: Image(image: getImage('${currentAppUser.profilePicture}'))),
              ),
            ),
          ),
          const SizedBox( height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentAppUser.name!,
               style: Theme.of(context).textTheme.bodyLarge,
               // style: getLocaleBasedTextStyle(context, arabicBodyMediumTextStyle),
              ),
              // const SizedBox(width: 5,),
              // Text(
              //   CurrentAppUserData.currentAppUser.lastName!,
              //   style: getLocaleBasedTextStyle(context, arabicBodyMediumTextStyle),
              // ),
            ],
          ),

          Text(
            currentAppUser.email!,
            style: Theme.of(context).textTheme.bodyLarge,
            // style: getLocaleBasedTextStyle(context, arabicBodySmallTextStyle.copyWith(fontSize: 15)),
          ),

          const SizedBox( height: 10,),


        ],
      ),
    );
  }
}