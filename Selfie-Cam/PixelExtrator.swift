//
//  PixelExtrator.swift
//  Selfie-Cam
//
//  Created by Milos Stosic on 6/1/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class PixelExtractor {
    
    let image: CGImage
    let context: CGContext?
    
    var width: Int {
        get {
            return image.width
        }
    }
    
    var height: Int {
        get {
            return image.height
        }
    }
    
    init(img: CGImage) {
        image = img
      //  print(img.width ,img.height)
        context = PixelExtractor.createBitmapContext(img: img)
        
        
    }
    
    class func createBitmapContext(img: CGImage) -> CGContext {
        
        // Get image width, height
        let pixelsWide = img.width
        let pixelsHigh = img.height
        
        let bitmapBytesPerRow = pixelsWide * 4
        let bitmapByteCount = bitmapBytesPerRow * Int(pixelsHigh)
        
        // Use the generic RGB color space.
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // Allocate memory for image data. This is the destination in memory
        // where any drawing to the bitmap context will be rendered.
        let bitmapData = malloc(bitmapByteCount)
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)
        let size = CGSize(width: CGFloat(pixelsWide), height: CGFloat(pixelsHigh))
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // create bitmap
        let context = CGContext(data: bitmapData, width: pixelsWide, height: pixelsHigh, bitsPerComponent: 8,
                                bytesPerRow: bitmapBytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        
       // print(pixelsWide,pixelsHigh)
        // draw the image onto the context
        let rect = CGRect(x: 0, y: 0, width: pixelsWide, height: pixelsHigh)
  //      CGContextDrawImage(context, rect, img)
        context?.draw(img, in: rect)
       // context?.draw(context as! CGImage, in: rect, byTiling: img as! Bool)
        return context!
    }
    //izvlaci piksele za fotografije iz galerije
    func colorAt(x: Int, y: Int)->UIColor {
     
        assert(0<=x && x<width)
        assert(0<=y && y<height)
        
        let uncastedData = context!.data
      //  let data = UnsafePointer<UInt8>(uncastedData)
        let data = uncastedData?.assumingMemoryBound(to: UInt8.self)
        
        let offset = 4 * (y * width + x)
        
        let alpha: UInt8 = data![offset]
        let red: UInt8 = data![offset+1]
        let green: UInt8 = data![offset+2]
        let blue: UInt8 = data![offset+3]
        
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
        
        return color
            }

    //izvlaci boje za slike slikane kamerom
    func colorAtSelfie(x: Int, y: Int)->UIColor {
        
        assert(0<=x && x<width)
        assert(0<=y && y<height)
        
        let uncastedData = context!.data
        //  let data = UnsafePointer<UInt8>(uncastedData)
        let data = uncastedData?.assumingMemoryBound(to: UInt8.self)
        
        let offset = 4 * (y * width + x)
        
        let alpha: UInt8 = data![offset]
        let red: UInt8 = data![offset+1]
        let green: UInt8 = data![offset+2]
        let blue: UInt8 = data![offset+3]
        
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
        
        return color
    }

}
