import Foundation
import Docopt

let doc : String = "pikter - Picture on iTerm\n" +
"\n" +
"Usage:\n" +
"  pikter <filePath>... [--width=<px>, --height=<px>, --percent=<True>, (-d | --debug)]\n" +
"  pikter (-h | --help)\n" +
"\n" +
"Options:\n" +
"  -h, --help\n"


enum PikterApplicationError: ErrorType {
    case MissingFilePath
}


func getTerminalInput() -> [String: AnyObject] {
    var args = Process.arguments
    args.removeAtIndex(0) // arguments[0] is always the program_name
    return Docopt.parse(doc, argv: args)
}


func getFilePaths(terminalInput: [String: AnyObject]) throws -> [String] {
    var filePaths: [String]
    if let _filePaths = terminalInput["<filePath>"] as? [String] {
        filePaths = _filePaths
    } else {
        guard let filePath = terminalInput["<filePath>"] as? String else {
            throw PikterApplicationError.MissingFilePath
        }
        filePaths = [filePath]
    }
    return filePaths
}


func main() {
    let terminalInput = getTerminalInput()
    var filePaths: [String]
    do {
        filePaths = try getFilePaths(terminalInput)
    } catch PikterApplicationError.MissingFilePath {
        print("Missing file path")
        return
    } catch {
        print("Error when getting file paths: \(error)")
        return
    }

    var isDebug: Bool = false

    if let inputDebug = terminalInput["--debug"] as? Int {
        isDebug = inputDebug == 1
    }

    if isDebug {
        print("--In Debug Mode--")
    }


    var width: Int?
    var height: Int?

    if let inputWidth = terminalInput["--width"] as? String {
        width = Int(inputWidth)
    }
    if let inputHeight = terminalInput["--height"] as? String {
        height = Int(inputHeight)
    }

    if isDebug {
        print(terminalInput)
        print("width: \(width), height: \(height)")
    }

    for filePath in filePaths {
        do {
            try printImage(path: filePath, width: width, height: height, isDebug: isDebug)
        } catch ImagePrintingError.InvalidFilePath(let path) {
            print("Can't resolve a file from input path: \"\(path)\"")
        } catch {
            print(error)
        }
    }

}

main()
