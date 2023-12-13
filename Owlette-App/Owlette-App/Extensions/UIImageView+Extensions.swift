//
//  UIImageView+Extensions.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/6/23.
//

import UIKit

extension UIImageView {
    func setImage(from imageURL: URL) async throws {
        do {
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            let image = UIImage(data: data) ?? UIImage()
            self.image = image
        } catch {
            print("Error loading image: \(error)")
            self.image = UIImage(named: "person.fill")
        }
    }
}
