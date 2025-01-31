import 'package:flutter/material.dart';

class Dialog extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final Color? titleTextColor;
  final String? subTitle;
  final double? subTitleFontSize;
  final Color? subTitleTextColor;
  final Function onPressedOK;
  final Function onPressedCancel;
  final double? radius;
  final Color? cancelColor;
  final Color? okColor;
  final bool? isSingleButton;
  final Color? backgroundColor;
  final Color? dividerColor;

  /// 커스텀 다이얼로그
  /// - [title]: 타이틀
  /// - [titleFontSize]: 타이틀 폰트 사이즈
  /// - (선택)[titleTextColor]: 타이틀 텍스트 색상
  /// - (선택)[subTitle]: 서브 타이틀
  /// - (선택)[subTitleFontSize]: 서브 타이틀 폰트 사이즈
  /// - (선택)[subTitleTextColor]: 서브 타이틀 텍스트 색상
  /// - [onPressedOK]: 확인 버튼 클릭 시
  /// - [onPressedCancel]: 취소 버튼 클릭 시
  /// - (선택)[cancelColor]: 취소 버튼 텍스트 색상
  /// - (선택)[okColor]: 확인 버튼 텍스트 색상
  /// - (선택)[radius]: 다이얼로그 둥근 모서리
  /// - (선택)[isSingleButton]: 확인 버튼만 있는 다이얼로그
  /// - (선택)[backgroundColor]: 다이얼로그 배경색
  /// - (선택)[dividerColor]: 버튼 구분선 색상
  Dialog({
    required this.title,
    required this.titleFontSize,
    this.titleTextColor,
    this.subTitle,
    this.subTitleFontSize,
    this.subTitleTextColor,
    required this.onPressedOK,
    required this.onPressedCancel,
    this.cancelColor,
    this.okColor,
    this.radius,
    this.isSingleButton,
    this.backgroundColor,
    this.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      backgroundColor: backgroundColor ?? Colors.white,
      contentPadding: const EdgeInsets.only(top: 30, bottom: 30),
      actionsPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
              color: titleTextColor ?? Colors.black,
            ),),
          if(subTitle != null)
            SizedBox(height: 10),
          if(subTitle != null)
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.5,
                  fontSize: subTitleFontSize ?? 16,
                  fontWeight: FontWeight.w600,
                  color: subTitleTextColor ?? Colors.black
              ),),
        ],
      ),
      actions: [
        Container(
          width: size.width,
          height: 48.1,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: dividerColor ?? const Color(0xffe0e0e0),
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              if(isSingleButton == null || isSingleButton == true)
                Expanded(
                  child: InkWell(
                    onTap: () => onPressedCancel(),
                    child: Container(
                      height: 48.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: dividerColor ?? const Color(0xffe0e0e0),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        '취소',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: cancelColor ?? const Color(0xff303030),
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: InkWell(
                  onTap: () => onPressedOK(),
                  child: Container(
                    height: 48.1,
                    alignment: Alignment.center,
                    child: Text(
                      '확인',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: okColor ?? const Color(0xffFF0000),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
