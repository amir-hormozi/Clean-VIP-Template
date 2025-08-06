//
//  MapViewController.swift
//  Clean-VIP-Template
//
//  Created by Amir Hormozi on 10/2/23.
//

import Foundation

enum ANSIColor: String {
    case black   = "\u{1B}[30m"
    case red     = "\u{1B}[31m"
    case green   = "\u{1B}[32m"
    case yellow  = "\u{1B}[33m"
    case blue    = "\u{1B}[34m"
    case magenta = "\u{1B}[35m"
    case cyan    = "\u{1B}[36m"
    case white   = "\u{1B}[37m"
    case reset   = "\u{1B}[0m"

    func colorize(_ text: String) -> String {
        return self.rawValue + text + ANSIColor.reset.rawValue
    }
}

let fileManager = FileManager.default

let scriptDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)

let templateDestinationDirectoryName = "Templates"

guard let sudoUser = ProcessInfo.processInfo.environment["SUDO_USER"] else {
    print(ANSIColor.red.colorize("❌ This script must be run with 'sudo'."))
    print("Try: sudo swift Installer.swift")
    exit(1)
}

let userHomeDirectoryURL = URL(fileURLWithPath: "/Users/\(sudoUser)")
let xcodeDirectoryURL = userHomeDirectoryURL.appendingPathComponent("Library/Developer/Xcode")
let destinationURL = xcodeDirectoryURL.appendingPathComponent(templateDestinationDirectoryName)


print(ANSIColor.cyan.colorize("🚀 Starting Xcode templates installation..."))

do {
    print("✅ Checking destination path: \(destinationURL.path)")
    try fileManager.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
} catch {
    print(ANSIColor.red.colorize("❌ Error creating destination directory: \(error.localizedDescription)"))
    exit(1)
}


do {
    let sourceFiles = try fileManager.contentsOfDirectory(at: scriptDirectoryURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
    let templateFolders = sourceFiles.filter { $0.pathExtension == "xctemplate" }

    if templateFolders.isEmpty {
        print(ANSIColor.yellow.colorize("⚠️ No templates with the .xctemplate extension were found to install."))
        exit(0)
    }

    print(ANSIColor.yellow.colorize("🔍 Found \(templateFolders.count) template(s) to install:"))

    for sourceTemplateURL in templateFolders {
        let templateName = sourceTemplateURL.lastPathComponent
        let destinationTemplateURL = destinationURL.appendingPathComponent(templateName)

        print("    - Installing '\(templateName)'...")

        if fileManager.fileExists(atPath: destinationTemplateURL.path) {
            print(ANSIColor.yellow.colorize("      - Old version found. Removing..."))
            try fileManager.removeItem(at: destinationTemplateURL)
        }

        try fileManager.copyItem(at: sourceTemplateURL, to: destinationTemplateURL)
        print(ANSIColor.green.colorize("      - ✅ Successfully installed!"))
    }

} catch {
    print(ANSIColor.red.colorize("\n❌ An error occurred: \(error.localizedDescription)"))
    exit(1)
}

print(ANSIColor.green.colorize("\n🎉 All done! All templates have been installed successfully."))
print("Restart Xcode to see your new templates. Enjoy! 😎")
