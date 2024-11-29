//
//  NotificationManager.swift
//  Alarma
//
//  Created by alumno on 29/11/24.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    //permitir la app el uso de notificaciones
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error al solicitar permiso \(error.localizedDescription)")
            } else if granted {
                print("Permiso concedido")
            } else {
                print("Permiso denegado")
            }
        }
    }
    
    func scheduleNotification(date: Date, title: String, body: String) {
        //Notification Content
        let content = UNMutableNotificationContent()
        content.sound = .default
        content.title = title
        content.body = body
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: date), repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error al programar la notificacion \(error.localizedDescription)")
            } else {
                print("Notificacion programada exitosamente para \(date)")
            }
        }
        
    }
}
