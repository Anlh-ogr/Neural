import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final textLogin = TextEditingController();
  final textPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false; 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    textLogin.dispose();
    textPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: textLogin,
                  decoration: const InputDecoration(
                    labelText: 'Tên đăng nhập',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Vui lòng nhập tên đăng nhập' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: textPass,
                  decoration: const InputDecoration(
                    labelText: 'Mật khẩu',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Vui lòng nhập mật khẩu' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              // TODO: Xử lý đăng nhập ở đây
                              Future.delayed(const Duration(seconds: 1), () {
                                setState(() {
                                  isLoading = false;
                                });
                                // Hiển thị thông báo thành công (demo)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Đăng nhập thành công!')),
                                );
                              });
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Đăng nhập'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}