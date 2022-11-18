import '../../app.dart';

class KochureButton extends StatelessWidget {
  const KochureButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.width,
    this.inActiveBtn,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final double? width;
  final bool? inActiveBtn;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: width,
        decoration: inActiveBtn == true
            ? BoxDecoration(
                color: BrandColors.colorLightGray.withOpacity(0.4),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              )
            : BoxDecoration(
                gradient: RadialGradient(colors: [
                  BrandColors.colorPrimary,
                  BrandColors.colorPrimaryMaterial.shade300,
                  BrandColors.colorPrimary,
                  BrandColors.colorPrimaryMaterial.shade600,
                  BrandColors.colorPrimary,
                ], stops: const [
                  0.1,
                  0.35,
                  0.5,
                  0.75,
                  0.95,
                ], radius: 10),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: BrandColors.colorGreen,
                  width: 2,
                )),
        child: Text(
          text,
          style: TextStyle(
            color: inActiveBtn == true
                ? BrandColors.colorPrimary
                : BrandColors.quickactionsBg,
            fontWeight:
                inActiveBtn == true ? AppFontWeight.bold : AppFontWeight.bold,
          ),
          textScaleFactor: 1.6,
        ),
      ),
    );
  }
}
