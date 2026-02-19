import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //control para mostrar/ocultar la contraseña
  bool _obscureText = true;

  StateMachineController? _controller;
  //SMI: State Machine Input
  SMIBool? _isChecking;
  SMIBool? _isHandsUp;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;
  
  //1) Crear variables para FocusNode
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  //2) Listeners
  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        if (_isHandsUp != null) {
          //No tapes los ojos al ver el email
          _isHandsUp!.change(false);
        }
      }
    });
    _passwordFocusNode.addListener(() {
      _isHandsUp?.change(_passwordFocusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //para obtener el tamaño de la pantalla
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.20),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset(
                  'assets/login_animation.riv',
                  stateMachines: ['Login Machine'],
                  //Al iniciar la animacion
                  onInit: (artboard) {
                    _controller = StateMachineController.fromArtboard(artboard, 'Login Machine');
                    //Verifica que inicio bien
                    if(_controller != null) {
                      artboard.addController(_controller!);
                      _isChecking = _controller!.findSMI('isChecking') as SMIBool;
                      _isHandsUp = _controller!.findSMI('isHandsUp') as SMIBool;
                      _trigSuccess = _controller!.findSMI('trigSuccess') as SMITrigger;
                      _trigFail = _controller!.findSMI('trigFail') as SMITrigger;
                    }
                  },
                ),
              ),
              const SizedBox(height: 10), //para separacion
                TextField(
                  //1.3 asignar el focusNode al TextField
                  focusNode: _emailFocusNode,
                  onChanged: (value) {
                    if (_isHandsUp != null) {
                      //No tapes los ojos al ver el email
                      //_isHandsUp!.change(false);
                    }
                    //Si is Checking no es nulo
                    if (_isChecking != null) {
                      //Activar el modo chismoso
                      _isChecking!.change(true);
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                ),
                const SizedBox(height: 10), //para separacion
                TextField(
                  focusNode: _passwordFocusNode,
                  onChanged: (value) {
                    if (_isChecking != null) {
                      //Tapa los ojos al ver la contraseña
                      //_isChecking!.change(false);
                    }
                    if (_isHandsUp != null) {
                      //Levanta las manos al ver la contraseña
                      _isHandsUp!.change(true);
                    }
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                )
            ],
          ),
        ),
      )
    );
  }

  
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  
}
