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


func printImage(data data: NSData, name: String="Unnamed") {
    let fileContent = data.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
    print("\u{001B}]1337;File=inline=1;")
    print(":")
    print(fileContent)
    print("\u{7}")
}


func printImage(path path: String) {
    let imageData = NSData(contentsOfFile: path)!
    printImage(data:imageData)
}


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

    printImage(path: filePath)
}


main()
