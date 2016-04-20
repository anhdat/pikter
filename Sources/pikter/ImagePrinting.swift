import Foundation


enum ImagePrintingError: ErrorType {
    case InvalidFilePath(path: String)
}


func printImage(data data: NSData, name: String="Unnamed") {
    let fileContent = data.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
    print("\u{001B}]1337;File=inline=1;")
    print(":")
    print(fileContent)
    print("\u{7}")
}


func printImage(path path: String) throws {
    guard let imageData = NSData(contentsOfFile: path) else {
        throw ImagePrintingError.InvalidFilePath(path: path)
    }
    printImage(data:imageData)
}
