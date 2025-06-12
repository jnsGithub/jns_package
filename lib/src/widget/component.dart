import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class BottomFooter extends StatelessWidget {
  final String companyName;
  final String ceoName;
  final String businessNumber;
  final String address;
  final String serviceCenterNumber;
  final String communicationSaleNumber;
  final String email;
  final Color? backgroundColor;
  final Color? dividerColor;
  final double? dividerHeight;

  /// 하단 푸터
  /// - [companyName]: 회사명
  /// - [ceoName]: 대표자명
  /// - [businessNumber]: 사업자 등록번호
  /// - [address]: 주소
  /// - [serviceCenterNumber]: 고객센터 번호
  /// - [communicationSaleNumber]: 통신판매번호
  /// - [email]: 이메일
  /// - (선택)[backgroundColor]: 배경색
  /// - (선택)[dividerColor]: 구분선 색상
  /// - (선택)[dividerHeight]: 구분선 굵기
  const BottomFooter({
    required this.companyName,
    required this.ceoName,
    required this.businessNumber,
    required this.address,
    required this.serviceCenterNumber,
    required this.communicationSaleNumber,
    required this.email,
    this.backgroundColor,
    this.dividerColor,
    this.dividerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        border: Border(
          top: BorderSide(
            color: dividerColor ?? Colors.grey,
            width: dividerHeight ?? 1,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text(companyName),
          const SizedBox(height: 10 ,),
          Text('대표 ${companyName} | 사업자 등록번호 ${businessNumber}',style: const TextStyle(
              fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff757575)
          ),),
          const SizedBox(height: 10 ,),
          Text(address ,style: const TextStyle(
              fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff757575)
          ),),
          const SizedBox(height: 10 ,),
          Text('고객센터 ${serviceCenterNumber} | ${communicationSaleNumber}',style: const TextStyle(
              fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff757575)
          ),),
          const SizedBox(height: 10 ,),
          Text('이메일 ${email}',style: const TextStyle(
              fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff757575)
          ),),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double? radius;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  /// 확인 버튼
  /// - [width]: 버튼 너비
  /// - [height]: 버튼 높이
  /// - [onPressed]: 버튼 클릭 시 실행 함수
  /// - (선택)[radius]: 버튼 모서리 둥글기
  /// - (선택)[color]: 버튼 색상
  /// - (선택)[textColor]: 버튼 텍스트 색상
  /// - (선택)[fontWeight]: 버튼 텍스트 굵기
  /// - (선택)[fontSize]: 버튼 텍스트 크기
  ConfirmButton({
    required this.text,
    required this.width,
    required this.height,
    this.radius,
    required this.onPressed,
    this.color,
    this.textColor,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue,
        maximumSize: Size(width, height),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 16,
          color: textColor ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
      ),
    );
  }
}

class ServiceCenterView extends StatelessWidget {
  final String email;
  final String phoneNumber;
  final Color? backgroundColor;
  final Color? mainColor;
  ServiceCenterView({
    required this.email,
    required this.phoneNumber,
    this.backgroundColor,
    this.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('문의하기'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 80),child: Column(
            children: [
              Text('모든 문의는 아래'),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('이메일',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  Text(' 또는 '),
                  Text('대표번호',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  Text('로 연락주시면'),
                ],
              ),
              SizedBox(height: 10,),
              Text('도움드리겠습니다'),
            ],
          ),),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
                color: backgroundColor ?? Color(0xffF7F7FA),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mail,color: mainColor ?? Colors.black,),
                Text('  ${email}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          const SizedBox(height: 22,),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
                color: backgroundColor ?? Color(0xffF7F7FA),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_iphone,color: mainColor ?? Colors.black,),
                Text('  ${phoneNumber}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MaterialIconButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: (){},
    );
  }
}
