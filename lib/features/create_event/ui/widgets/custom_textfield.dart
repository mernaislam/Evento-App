import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final bool? readOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.controller,
    this.readOnly=false,
    this.onTap,
    this.focusNode,
    this.keyboardType=TextInputType.text,
    required this.label,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;


  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: _controller,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
    
    
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        
        labelText: widget.label,
      ),
        readOnly: widget.readOnly ?? false,
        onTap: widget.onTap,
    );
  }
}
