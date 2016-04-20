import Foundation
import Docopt

let doc : String = "pikter - Picture on iTerm\n" +
"\n" +
"Usage:\n" +
"  pikter <filePath>\n" +
"  pikter (-h | --help)\n" +
"\n" +
"Options:\n" +
"  -h, --help\n"


func getTerminalInput() -> [String: AnyObject] {
    var args = Process.arguments
    args.removeAtIndex(0) // arguments[0] is always the program_name
    return Docopt.parse(doc, argv: args)
}


func main() {
    let terminalInput = getTerminalInput()

    guard let filePath = terminalInput["<filePath>"] as? String else {
        return
    }

    do {
        try printImage(path: filePath)
    } catch ImagePrintingError.InvalidFilePath(let path) {
        print("Can't resolve a file from input path: \"\(path)\"")
    } catch {
        print(error)
    }
}

main()
