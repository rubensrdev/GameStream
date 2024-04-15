//
//  SaveData.swift
//  GameStream
//
//  Created by Ruben on 15/4/24.
//

import Foundation

class SaveData {
    
    var correo: String = ""
    var contraseña: String = ""
    var nombre: String = ""
    /**
     Guardado de datos de usuario en UserDefaults
     */
    func guardar(correo: String, contraseña: String, nombre: String) -> Bool {
        UserDefaults.standard.set([correo, contraseña, nombre], forKey: "datosDeUsuario")
        print("Datos guardados...")
        return true
    }
    
    /**
     Recuperación de los datos de usuario guardados en UserDefault
     */
    func recuperarDatos() -> [String] {
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosDeUsuario")!
        print("Datos de usuario recuperados --> \(datosUsuario)")
        return datosUsuario
    }
    
    /**
     Validación de datos introducidos vs guardados en UserDefaults
     */
    func validar(correo: String, contraseña: String) -> Bool {
        var validacionCorrecta = false
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        if UserDefaults.standard.object(forKey: "datosDeUsuario") != nil {
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosDeUsuario")![0]
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosDeUsuario")![1]
            condicionValidacionDeDatos(correo, correoGuardado, contraseña, contraseñaGuardada, &validacionCorrecta)
        }
        
        return validacionCorrecta
    }
    
    /**
     Comparación de datos de usuario
     */
    fileprivate func condicionValidacionDeDatos(_ correo: String, _ correoGuardado: String, _ contraseña: String, _ contraseñaGuardada: String, _ validacionCorrecta: inout Bool) {
        if correo == correoGuardado && contraseña == contraseñaGuardada {
            print("validación de datos correcta")
            validacionCorrecta = true
        }
    }
    
}
