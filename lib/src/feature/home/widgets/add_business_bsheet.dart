import 'package:city17/src/constant/app_constants.dart';
import 'package:city17/src/core/component/custom_textfield.dart';
import 'package:city17/src/core/component/get_address.dart';
import 'package:city17/src/core/extension/context_ext.dart';
import 'package:city17/src/feature/home/model/address_model.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_color.dart';

class AddBusinessBS extends StatefulWidget {
  final double bottompanding;
  const AddBusinessBS({super.key, required this.bottompanding});

  @override
  State<AddBusinessBS> createState() => _AddBusinessBSState();
}

class _AddBusinessBSState extends State<AddBusinessBS> {
  late TextEditingController _nameContoller;
  late TextEditingController _businesscatorycontroller;
  late TextEditingController _addresscontroller;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _nameContoller = TextEditingController();
    _businesscatorycontroller = TextEditingController();
    _addresscontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameContoller.dispose();
    _addresscontroller.dispose();
    _businesscatorycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottompanding),
      padding: const EdgeInsets.all(16),
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
              Text(
                'Add a display location',
                style: context.myTextTheme.titleMedium,
              ),
              const SizedBox(height: myPadding / 2),
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

              const SizedBox(height: myPadding / 2),
              CustomTextfield(
                controller: _addresscontroller,
                hinttext: 'Business Address',
                bagroundColor: AppColors.secondarycolor,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
              ),

            

              const SizedBox(height: myPadding / 2),
              CustomTextfield(
                controller: _businesscatorycontroller,
                hinttext: 'Business Category',
                bagroundColor: AppColors.secondarycolor,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Category is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),


              ElevatedButton(onPressed: ()async{


               
               
               
     final AddressModel? address = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => const GetAddressBS(),
                      enableDrag: false,
                      clipBehavior: Clip.hardEdge,
                    );

                    if (address != null) {
                      setState(() {
                       // _address = address;
                      });
                    }
              }, child: const Text('press me')),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add',
                      style: context.myTextTheme.bodyMedium?.copyWith(
                        color: AppColors.accentTextcolor,
                      ),
                    ),
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
