import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phandal_frontend/utils/utils.dart';

class FlashMessageScreen {
  final String message;
  final int statusCode;

  const FlashMessageScreen({required this.message, required this.statusCode});

  static show(
    BuildContext context,
    String message,
    int statusCode,
  ) {
    bool isSuccess = statusCode == 201;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                height: 90,
                decoration: BoxDecoration(
                  color: Color(isSuccess
                      ? toIntColor('#34D399')
                      : toIntColor('#EF4444')),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 50),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isSuccess
                                ? "Success!"
                                : "Oops! (Status:$statusCode)",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const Spacer(),
                          Text(
                            message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  'assets/icons/bubbles.svg',
                  height: 55,
                  width: 40,
                  colorFilter: ColorFilter.mode(
                      Color(
                        isSuccess
                            ? toIntColor('#047857')
                            : toIntColor('#991B1B'),
                      ),
                      BlendMode.srcIn),
                ),
              ),
            ),
            Positioned(
              top: -10,
              left: 15,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/fail.svg',
                    height: 40,
                    colorFilter: ColorFilter.mode(
                        Color(
                          isSuccess
                              ? toIntColor('#047857')
                              : toIntColor('#991B1B'),
                        ),
                        BlendMode.srcIn),
                  ),
                  isSuccess
                      ? const Icon(
                          Icons.check,
                          size: 20,
                        )
                      : const Icon(
                          Icons.close,
                          size: 20,
                        )
                ],
              ),
            )
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
