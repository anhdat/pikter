/*
Key             Description of value

name        base-64 encoded filename. Defaults to "Unnamed file".
size        File size in bytes. Optional; this is only used by the progress indicator.
width       Width to render. See notes below.
height      Height to render. See notes below.
preserveAspectRatio     If set to 0, then the image's inherent aspect ratio will not be respected;
                        otherwise, it will fill the specified width and height as much as possible
                        without stretching. Defaults to 1.
inline                  If set to 1, the file will be displayed inline. Otherwise, it will be
                        downloaded with no visual representation in the terminal session.
                        Defaults to 0.

The width and height are given as a number followed by a unit, or the word "auto".

N: N character cells.
Npx: N pixels.
N%: N percent of the session's width or height.
auto: The image's inherent size will be used to determine an appropriate dimension.
*/
import Foundation


enum ImagePrintingError: ErrorType {
    case InvalidFilePath(path: String)
}


func printImage(data data: NSData,
    name: String="Unnamed",
    height: Int?=nil, width: Int?=nil,
    isPercent: Bool=false,
    preserveAspectRatio: Bool=true,
    isDebug: Bool=false
    ) {
    let fileContent = data.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
    if !isDebug {
        print("\u{001B}]1337;File=inline=1;" )
    }

    let unit = isPercent ? "%" : "px"

    if let height = height {
        print("height=\(height)", unit, ";", terminator:"", separator:"")
        if width == nil {
            print("width=auto;", terminator:"")
        }
    }
    if let width = width {
        print("width=\(width)", unit, ";", terminator:"", separator:"")
        if height == nil {
            print("height=auto;", terminator:"")
        }
    }
    print("preserveAspectRatio=true")
    print(":")
    if !isDebug {
        print(fileContent)
        print("\u{7}")
    }
}


func printImage(path path: String,
    height: Int?=nil, width: Int?=nil,
    isPercent: Bool=false,
    preserveAspectRatio: Bool=true,
    isDebug: Bool=false
    ) throws {
    guard let imageData = NSData(contentsOfFile: path) else {
        throw ImagePrintingError.InvalidFilePath(path: path)
    }
    printImage(data: imageData,
        width: width, height: height,
        isPercent: isPercent,
        isDebug: isDebug
        )
}
