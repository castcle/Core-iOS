//  Copyright (c) 2021, Castcle and/or its affiliates. All rights reserved.
//  DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
//
//  This code is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License version 3 only, as
//  published by the Free Software Foundation.
//
//  This code is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
//  version 3 for more details (a copy is included in the LICENSE file that
//  accompanied this code).
//
//  You should have received a copy of the GNU General Public License version
//  3 along with this work; if not, write to the Free Software Foundation,
//  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
//
//  Please contact Castcle, 22 Phet Kasem 47/2 Alley, Bang Khae, Bangkok,
//  Thailand 10160, or visit www.castcle.com if you need additional information
//  or have any questions.
//
//  ImageHelper.swift
//  Core
//
//  Created by Castcle Co., Ltd. on 8/11/2564 BE.
//

import Foundation
import UIKit

public enum ImageType: String {
    case avatar
    case cover
}

public class ImageHelper {
    public static let shared = ImageHelper()
    
    public func downloadImage(from url: String, iamgeName: String, type: ImageType) {
        if let url = URL(string: url) {
            self.getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.saveImageToDocumentDirectory(imageData: data, imageName: iamgeName, type: type)
                }
            }
        }
    }

    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    public func saveImageToDocumentDirectory(imageData: Data, imageName: String, type: ImageType) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileName = "\(type.rawValue)_\(imageName).png"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            try imageData.write(to: fileURL)
            print("file saved")
        } catch {
            print("error saving file:", error)
        }
    }

    public func loadImageFromDocumentDirectory(nameOfImage : String, type: ImageType) -> UIImage {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath = paths.first {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("\(type.rawValue)_\(nameOfImage).png")
            let image = UIImage(contentsOfFile: imageURL.path)
            return image!
        }
        
        if type == .avatar {
            return UIImage.Asset.userPlaceholder
        } else {
            return UIImage.Asset.placeholder
        }
    }
}
