import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async'; //importa el Timer


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

  SMINumber? _numLook;
  
  //1) Crear variables para FocusNode
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  //3.1 Timer para detener la mirada al dejar de escribir
  Timer? _typingDebounce;


    //2) Listeners
  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        if (_isHandsUp != null) {
          //No tapes los ojos al ver el email
          _isHandsUp!.change(false);
          //2.2 Mirada neutral
          _numLook?.value = 50.0;
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
                      _isChecking = _controller!.findSMI('isChecking');
                      _isHandsUp = _controller!.findSMI('isHandsUp');
                      _trigSuccess = _controller!.findSMI('trigSuccess');
                      _trigFail = _controller!.findSMI('trigFail');
                      //2.3 Vincular numlock
                      _numLook = _controller!.findSMI('numLook');
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
                      //2.4 Implementar Numlock
                      //Ajuste de limites de 0 a 100
                      //80 como medida de calibracion
                      final look = (value.length / 80.0*100.00).clamp(0.0, 100.0); //clamp es el rango (abrazadera)
                      _numLook?.value = look;

                      //3.3 Debounce: si vuelve a escribir, reinicia el contador
                      //cancelar cualquier timer activo
                      _typingDebounce?.cancel();
                      //iniciar un nuevo timer
                      _typingDebounce = Timer(const Duration(seconds: 3), () {
                        //si se cierra la pantalla, quita el contador
                        if (!mounted) return;
                        //Mirada neutra
                        _isChecking?.change(false);
                      });

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
    _passwordFocusNode.dispose();\
    _typingDebounce?.cancel(); //Cancelar el timer si esta activo
    super.dispose();
  }
  
}
