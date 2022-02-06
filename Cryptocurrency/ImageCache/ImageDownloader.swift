//
//  ImageDownloader.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 05/02/22.
// Kepping it simple using knigfisher to load and cache the images

import Kingfisher
import UIKit

final class ImageDownloader
{
    static let shared = ImageDownloader()
    
    func setImage(with imageUrl:String,imageView:UIImageView)
    {
        let url = URL(string: imageUrl)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }
    
}
