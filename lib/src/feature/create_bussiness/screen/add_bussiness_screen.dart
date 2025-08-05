import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/component/custom_textfield.dart';
import 'package:city17/src/core/component/get_address.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/utils/flutter_toast_utils.dart';
import 'package:city17/src/feature/create_bussiness/cubit/cubit/add_bussiness_cubit.dart';
import 'package:city17/src/feature/create_bussiness/model/add_bussiness_model.dart';
import 'package:city17/src/feature/home/bussiness_cubit/bussiness_cubit.dart';
import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:city17/src/feature/location_setting/enum/business_category_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/app_color.dart';

class AddBussinessScreen extends StatefulWidget {
  final double bottompanding;
  const AddBussinessScreen({super.key, required this.bottompanding});

  @override
  State<AddBussinessScreen> createState() => _AddBussinessScreenState();
}

class _AddBussinessScreenState extends State<AddBussinessScreen> {
  late TextEditingController _nameContoller;

  BusinessCategoryEnum? selectedcategory;
  AddressModel? _address;

  bool isFormValidate = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _nameContoller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameContoller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottompanding),
      padding: const EdgeInsets.all(myPadding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: AppColors.bottombarcolor,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add a display location',
                    style: context.myTextTheme.titleMedium,
                  ),

                  CloseButton(onPressed: () => Navigator.pop(context)),
                ],
              ),

              const SizedBox(height: myPadding / 1.5),
              CustomTextfield(
                controller: _nameContoller,
                onChanged: (_) => validateForm(),
                hinttext: 'Business Name',
                bagroundColor: AppColors.secondarycolor,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Business name is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: myPadding / 1.5),

              DropdownButtonFormField(
                value: selectedcategory,
                hint: Text(
                  'Selected Category',
                  style: context.myTextTheme.titleMedium?.copyWith(
                    fontSize: 13,
                  ),
                ),
                focusColor: AppColors.secondarycolor,
                dropdownColor: AppColors.primarycolor,
                borderRadius: BorderRadius.circular(myPadding),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(myPadding),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: myPadding / 2,
                    vertical: myPadding / 2,
                  ),

                  fillColor: AppColors.secondarycolor,
                  filled: true,
                ),
                items: BusinessCategoryEnum.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.title),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedcategory = value;
                    validateForm();
                  });
                },
              ),

              const SizedBox(height: myPadding / 1.5),

              GestureDetector(
                onTap: () async {
                  final AddressModel? address = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const GetAddressBS(),
                    enableDrag: false,
                    clipBehavior: Clip.hardEdge,
                  );

                  if (address != null) {
                    setState(() {
                      _address = address;
                    });
                    validateForm();
                  }
                },

                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: myPadding),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(myPadding),
                    color: AppColors.secondarycolor,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _address?.formattedAddress ?? 'Select Address',
                    style: context.myTextTheme.titleMedium?.copyWith(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),

              const SizedBox(height: myPadding),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocConsumer<AddBussinessCubit, AddBussinessState>(
                    listener: (context, state) {
                      if (state is AddBussinessLoaded &&
                          (state.hasError ?? false)) {
                        ToastUtils.errorToast(state.message.toString());
                      }

                      if (state is AddBussinessLoaded &&
                          (state.loaded ?? false)) {
                        ToastUtils.succesToast('Bussiness Create Successfuly');

                        BlocProvider.of<BussinessCubit>(
                          context,
                        ).getBussinesData();
                        Navigator.of(context).pop();
                      }
                    },
                    builder: (context, state) {
                      final isloading =
                          state is AddBussinessLoaded && state.loading == true;
                      return TextButton(
                        onPressed: isFormValidate && !isloading
                            ? () {
                                final name = _nameContoller.text.trim();
                                final address = _address;
                                final category = selectedcategory;

                                context.read<AddBussinessCubit>().addBussiness(
                                  AddBussinessModel(
                                    name: name,
                                    address: address,
                                    category: category,
                                  ),
                                );
                              }
                            : null,
                        child: isloading
                            ? const CupertinoActivityIndicator(
                                color: AppColors.accentTextcolor,
                              )
                            : Text(
                                'Add',
                                style: context.myTextTheme.bodyMedium?.copyWith(
                                  color: isFormValidate
                                      ? AppColors.accentTextcolor
                                      : AppColors.secondarycolor,
                                ),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateForm() {
    final formvalidate = _formkey.currentState!.validate();
    final address = _address != null;
    final selectedCategoryValid = selectedcategory != null;

    setState(() {
      isFormValidate = (formvalidate && address && selectedCategoryValid);
    });
  }
}
