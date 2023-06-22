//
//  CircularAvatarImageView.swift
//  FIRSTAPP
//
//  Created by Imesh Madusanka on 2023-03-07.
//

import UIKit


class CircularAvatarImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.size.width/2
        clipsToBounds = true
    }
    
    func loadImageFromURL(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
