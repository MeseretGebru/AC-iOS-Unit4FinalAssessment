//
//  FileManagerHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FileManagerHelper {
    private init() {}
    let SettingPath = "Setting.plist"
    static let manager = FileManagerHelper()
    
    //Saving Images To Disk
    func saveImage(with locationName: String, image: UIImage) {
        let imageData = UIImagePNGRepresentation(image)
        let imagePathName = locationName
        let url = dataFilePath(withPathName: imagePathName)
        do {
            try imageData?.write(to: url)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getImage(with locationName: String) -> UIImage? {
        do {
            let imagePathName = locationName
            let url = dataFilePath(withPathName: imagePathName)
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
    private var mySettingArr = [Setting]() {
        didSet {
            
            //removeDupes()
            saveSettingInfo()
        }
    }
    
//    func removeDupes() {
//        var imageURLSet = Set<String>()
//        var noDupeArr = [Favorite]()
//        for image in pictureArr {
//            let (inserted, _) = imageURLSet.insert(image.pictureName)
//            if inserted {
//                noDupeArr.append(image)
//            }
//        }
//        if pictureArr.count != noDupeArr.count { pictureArr = noDupeArr }
//    }
    
    func addNew(newSetting: Setting) {
        mySettingArr.append(newSetting)
    }
    
    func getAllSettings() -> [Setting] {
        return mySettingArr
    }
    
    private func saveSettingInfo() {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let encodedData = try propertyListEncoder.encode(mySettingArr)
            let imageURL = dataFilePath(withPathName: SettingPath)
            try encodedData.write(to: imageURL, options: .atomic)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadImages() {
        let propertyListDecoder = PropertyListDecoder()
        do {
            let imageURL = dataFilePath(withPathName: SettingPath)
            let encodedData = try Data(contentsOf: imageURL)
            let savedImages = try propertyListDecoder.decode([Setting].self, from: encodedData)
            mySettingArr = savedImages
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    //USE THIS ONE
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    //THIS IS ONLY FOR THE ABOVE METHOD
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //print(paths[0])
        return paths[0]
    }
}
