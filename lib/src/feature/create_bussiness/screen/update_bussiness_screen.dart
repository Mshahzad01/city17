import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/component/custom_textfield.dart';
import 'package:city17/src/core/component/get_address.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/core/utils/flutter_toast_utils.dart';
import 'package:city17/src/feature/create_bussiness/cubit/cubit/add_bussiness_cubit.dart';
import 'package:city17/src/feature/create_bussiness/model/update_bussiness_model.dart';
import 'package:city17/src/feature/home/bussiness_cubit/bussiness_cubit.dart';
import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:city17/src/feature/home/model/business_model.dart';
import 'package:city17/src/feature/location_setting/enum/business_category_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/app_color.dart';

class UpdateBussinessScreen extends StatefulWidget {
  final double bottompanding;

  final BusinessModel bussinessDate;
  const UpdateBussinessScreen({
    super.key,
    required this.bottompanding,
    required this.bussinessDate,
  });

  @override
  State<UpdateBussinessScreen> createState() => _UpdateBussinessScreenState();
}

class _UpdateBussinessScreenState extends State<UpdateBussinessScreen> {
  late TextEditingController _nameContoller;

  BusinessCategoryEnum? selectedcategory;
  AddressModel? _address;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _nameContoller = TextEditingController(text: widget.bussinessDate.name);
    _address = widget.bussinessDate.address;
    selectedcategory = widget.bussinessDate.category;
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

                  BlocConsumer<AddBussinessCubit, AddBussinessState>(
                    listener: (context, state) {
                      if (state is DeleteBussinessState &&
                          (state.deleted ?? false)) {
                        ToastUtils.succesToast('Bussiness Delete Successfuly');
                      }
                      if (state is DeleteBussinessState &&
                          (state.hasError ?? false)) {
                        ToastUtils.errorToast(state.message.toString());
                      }
                    },
                    builder: (context, state) {
                      final isloading =
                          state is DeleteBussinessState &&
                          state.loading == true;

                      return TextButton(
                        onPressed: () async {
                          await context
                              .read<AddBussinessCubit>()
                              .deleteBussiness(widget.bussinessDate.id);

                          BlocProvider.of<BussinessCubit>(
                            context,
                          ).getBussinesData();
                          Navigator.pop(context);
                        },
                        child: isloading
                            ? const CupertinoActivityIndicator(
                                color: AppColors.errorTextcolor,
                              )
                            : Text(
                                'Delete',
                                style: context.myTextTheme.titleMedium
                                    ?.copyWith(
                                      color: AppColors.warningTextcolor,
                                    ),
                              ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: myPadding / 1.5),
              CustomTextfield(
                controller: _nameContoller,
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
                focusColor: AppColors.secondarycolor,
                dropdownColor: AppColors.primarycolor,
                borderRadius: BorderRadius.circular(myPadding),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,

                    borderRadius: BorderRadius.circular(myPadding),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
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
                      if (state is UpdateBussinessState &&
                          (state.hasError ?? false)) {
                        ToastUtils.errorToast(state.message.toString());
                      }

                      if (state is UpdateBussinessState &&
                          (state.loaded ?? false)) {
                        ToastUtils.succesToast(
                          'Bussiness BussinessUpdate Successfuly',
                        );

                        BlocProvider.of<BussinessCubit>(
                          context,
                        ).getBussinesData();
                        Navigator.pop(context);
                      }
                      if (state is DeleteBussinessState &&
                          (state.deleted ?? false)) {
                        ToastUtils.succesToast('Bussiness Delete Successfuly');
                      }
                      if (state is DeleteBussinessState &&
                          (state.hasError ?? false)) {
                        ToastUtils.errorToast(state.message.toString());
                      }
                    },
                    builder: (context, state) {
                      final isloding =
                          state is UpdateBussinessState &&
                          (state.loading ?? false);
                      return TextButton(
                        onPressed: () {
                          final formvalidate = _formkey.currentState!
                              .validate();
                          final address = _address != null;
                          final selectedCategoryValid =
                              selectedcategory != null;

                          if (formvalidate &&
                              address &&
                              selectedCategoryValid) {
                            final name = _nameContoller.text.trim();
                            final address = _address;
                            final category = selectedcategory;
                            final bussinessId = widget.bussinessDate.id;

                            context.read<AddBussinessCubit>().updateBussiness(
                              UpdateBussinessModel(
                                name: name,
                                address: address,
                                category: category!,
                                businessId: bussinessId,
                                createdAt: DateTime.now(),
                              ),
                            );
                          } else {
                            ToastUtils.errorToast(
                              'Please fill all Required field',
                            );
                          }
                        },
                        child: isloding
                            ? const CupertinoActivityIndicator(
                                color: AppColors.accentTextcolor,
                              )
                            : Text(
                                'Update',
                                style: context.myTextTheme.bodyMedium?.copyWith(
                                  color: AppColors.accentTextcolor,
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
}
