
import 'package:flutter/material.dart';


class DropDownWidget extends StatelessWidget {
  final List<DropdownMenuItem<Object?>>? items;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final double? height;
  final String? topLabel;
  final bool? obscureText;
  final FormFieldSetter<Object>? onSaved;
  final ValueChanged<Object?>? onChanged;
  final FormFieldValidator<Object>? validator;
  final TextInputType? keyboardType;
  final Key? kKey;
  final TextEditingController? kController;
  final String? kInitialValue;
  final Object? value;
  final Function()? onTap;

  DropDownWidget({
    this.hintText,
    this.prefixIcon,
    this.height = 48.0,
    this.topLabel = "",
    this.obscureText = false,
    required this.onSaved,
    this.keyboardType,
    this.errorText,
    this.onChanged,
    this.validator,
    this.kKey,
    this.kController,
    this.kInitialValue, required this.items, this.value, this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.topLabel!, overflow: TextOverflow.ellipsis,maxLines: 1,),
        SizedBox(height: 4.0),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            //color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: DropdownButtonFormField<Object?>(
            items: this.items,
            key: this.kKey,
            onTap: onTap,
            value:this.value ,
            onSaved: this.onSaved,
            onChanged: this.onChanged,
            validator: this.validator,
            decoration: InputDecoration(
                prefixIcon: this.prefixIcon,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(74, 77, 84, 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  //gapPadding: 16,
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                errorStyle: TextStyle(height: 0, color: Colors.transparent),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  //gapPaddings: 16,
                  borderSide: BorderSide(
                    color: Theme.of(context).errorColor,
                  ),
                ),
                hintText: this.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white54),
                errorText: this.errorText),
                
          ),
        )
      ],
    );
  }
}
