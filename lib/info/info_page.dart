import 'package:flutter/material.dart';
import 'package:memory_game/shared/utils.dart' as utils;

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.blueColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: utils.blueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: utils.blueColor),
                child: Container(
                    width: double.infinity,
                    height: 225,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 55,
                            backgroundColor: utils.redColor,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/box.png'),
                              radius: 50.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            'Memories',
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  decoration: const BoxDecoration(color: utils.blueColor),
                  child: Container(
                      width: double.infinity,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            const Text(
                              '¿Qué es?',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: utils.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Es un juego de memoria que consiste en encontrar las parejas de cartas que se muestran en la pantalla. El objetivo es encontrar todas las parejas de cartas antes de que el tiempo termine.',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: utils.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '¿Retos?',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: utils.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Esta app es la resolucion al reto del mes mayo. Únete a los retos de código semanales y mensuales para mejorar tus habilidades by Mouredev',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: utils.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])))),
            ],
          ),
        ),
      ),
    );
  }
}
