import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/app/controllers/category_controller.dart';
import 'package:foodie/app/modules/otp/otp_view.dart';
import 'package:foodie/app/src/app_colors.dart';
import 'package:get/get.dart';
import '../../src/app_spacings.dart';

class MenuView extends StatefulWidget {
  MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final TextEditingController _phoneController = TextEditingController();
      final controller = Get.put(CategoryController());

  final RxString _errorMessage = ''.obs;
  final RxBool _isEnableContinue = false.obs;

  void _validatePhoneNumber() {
    String phoneNumber = _phoneController.text;

    final RegExp phoneRegex = RegExp(r'^(099\d{8}|99\d{8})$');
if (phoneRegex.hasMatch(phoneNumber)) {
      _errorMessage.value = '';
      _isEnableContinue.value = true;
      print(_isEnableContinue.value);
    } else {
      _isEnableContinue.value = false;
      _errorMessage.value = 'Please enter a valid phone number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.redColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.d),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.xs,
                ),
                child: Center(
                  child: Text(
                    "Welcome to Cheese O’Tea. ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/banner.png",
                  width: MediaQuery.of(context).size.width,
                  height: 155,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.d),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return GestureDetector(
                    onTap: () {
                      controller.fetchFoods(category.name);
                    },
                    child: Column(
                      children: [
                        Image.network(category.thumbnail, height: 50),
                        Text(category.name),
                      ],
                    ),
                  );
                },
              ),
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Passion Yogurt"),
                                  SizedBox(
                                    height: AppSpacing.xs,
                                  ),
                                  Text("5,000 Ks"),
                                  SizedBox(
                                    height: AppSpacing.d,
                                  ),
                                  Text(
                                    "Natural fermented yogurt from pure fresh milk and passion fruit....",
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Image.asset(
                                "assets/images/product.png",
                                width: 83,
                                height: 90,
                              ),
                            )
                          ],
                        ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, state) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: SizedBox(
                                          width: 238,
                                          height: 295,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 4,
                                                right: 4,
                                                child: IconButton(
                                                  icon: SvgPicture.asset(
                                                    'assets/icons/icon_circle_close.svg',
                                                    width: 32,
                                                    height: 32,
                                                  ),
                                                  onPressed: () {
                                                    _phoneController.text='';
                                                    _errorMessage.value = '';
                                                    //_isEnableContinue.value = false;
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: AppSpacing.l),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                   Obx(() => TextFormField(
                                                          controller:
                                                              _phoneController,
                                                          onChanged: (value) {
                                                            _validatePhoneNumber();
                                                          },
                                                          keyboardType:
                                                              TextInputType.phone,
                                                          decoration: InputDecoration(
                                                            errorText: _errorMessage.value,
                                                            hintText: "Phone",
                                                            prefixIcon: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          AppSpacing
                                                                              .xs,
                                                                      horizontal:
                                                                          AppSpacing
                                                                              .l),
                                                              child: SvgPicture.asset(
                                                                "assets/icons/icon_phone.svg",
                                                                width: 20,
                                                                height: 20,
                                                              ),
                                                            ),
                                                            border:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: AppColors
                                                                      .strokeColor),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                Radius.circular(2),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                   ),
                                                    
                                                    Obx(() => ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              _isEnableContinue.value
                                                                  ? AppColors
                                                                      .redColor
                                                                  : AppColors
                                                                      .strokeColor,
                                                        ),
                                                        onPressed: _isEnableContinue.value
                                                            ? () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              OtpView(
                                                                                phoneNumber:
                                                                                    _phoneController.text,
                                                                              )),
                                                                );
                                                              }
                                                            : null,
                                                        child: const Text(
                                                          "CONTINUE",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .whiteColor),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.redColor),
                            child: const Text(
                              "Order Now",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        thickness: 1,
                        color: AppColors.strokeColor,
                      ),
                  itemCount: 3)
            ],
          ),
        ),
      ),
    );
  }
}
