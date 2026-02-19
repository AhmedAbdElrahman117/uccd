import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: image!,
        width: double.infinity,
        fit: BoxFit.contain,
        errorWidget: (context, url, error) {
          return const SizedBox(
            width: double.infinity,
            height: 200,
            child: Center(
              child: Icon(Icons.broken_image),
            ),
          );
        },
        placeholder: (context, url) {
          return Skeletonizer(
            enabled: true,
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
// Image.network(
//         image!,

//       ),
// Container(
//       width: double.infinity,
//       height: MediaQuery.sizeOf(context).height * 0.3,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.amber,
//         image: const DecorationImage(
//           fit: BoxFit.contain,
//           image: NetworkImage(
//               'https://zmoejgvxfufurmezwagi.supabase.co/storage/v1/object/public/uccd%20posts/posts/33.jpg'),
//         ),
//       ),
//     );
