//
//  animation.swift
//  Data Security
//
//  Created by NAYANJYOTI RABHA on 15/05/20.
//  Copyright © 2020 NAYANJYOTI RABHA. All rights reserved.
//

import Foundation
import JavaScriptCore


var jsContext = JSContext()


// Specify the path to the jssource.js file.
if let jsSourcePath = Bundle.main.path(forResource: "jssource", ofType: "js") {
    do {
        // Load its contents to a String variable.
        let jsSourceContents = try String(contentsOfFile: jsSourcePath)

        // Add the Javascript code that currently exists in the jsSourceContents to the Javascript Runtime through the jsContext object.
        self.jsContext.evaluateScript(jsSourceContents)
    }
    catch {
        print(error.localizedDescription)
    }
}
