//
//  CoreDataManager.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 01/06/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    private let container: NSPersistentContainer
    
    init(){
        
        container = NSPersistentContainer(name: "KnowVegan")
        setUpDataBase()
    }
    
    private func setUpDataBase(){
        container.loadPersistentStores { (descripcion, error) in
            if let error = error {
                print ("ERROR: \(error)")
                return
            }
            else {
                print ("DATA BASE: \(descripcion)")
            }
        }
    }
    
    /*
    func saveUser(userName: String, userPassword: String){
        let context = container.viewContext
        let contact = UsuarioEntity(context: context)
        
        contact.userName = userName
        contact.userPassword = userPassword
        
        do {
            try context.save()
            print ("contacto guardado: \(contact.userName ?? "No Contact")")
            
        } catch {
            print ("ERROR: \(error)")
        }
    }
    
    
    func readUser() -> [UsuarioEntity] {
        let fetchRequest: NSFetchRequest<UsuarioEntity> = UsuarioEntity.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        } catch {
            print ("ERROR: \(error)")
            return []
        }
        
    }
    
    
    
    
    
    
    
    
    func deleteUser (name: String){
        let fetchRequest: NSFetchRequest<UsuarioEntity>
        fetchRequest = UsuarioEntity.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "userName = %@", name)
        fetchRequest.includesPropertyValues = false
        
        let context = container.viewContext
        
        do{
            let objects = try context.fetch(fetchRequest)
            for objetc in objects {
                context.delete(objetc)
            }
        } catch {
            print ("EEROR: \(error)")
        }
        
        do{
            try context.save()
        }catch {
            
            print ("EEROR: \(error)")
        }
        
    }
    
    
    
    
    
    
    
    */
    
}
