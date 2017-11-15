//: [Previous](@previous)
//: ### Handle Errors
//: The errors referred to by "error handling" are outside of a developer's control. They are unlike compiler warnings or errors warnings which are avoidable.
//:
func exampleFunction() {
    //let unusedConstant = 2 /* this constant is unused and will generate a compiler warning
    //print("\(5/0)") /* dividing by zero will generate a compiler error */
}
//: The errors in "error handling" can happen even when code is correct. Consider Apple's `String` initializer that accepts a `URL` (a path to a file) and attempts to read its contents into a string:
//:
//: **```init(contentsOf url: URL, encoding enc: String.Encoding) throws```**
//:
//: It is possible that the contents of the URL cannot be read into a string because of issues outside the developer's control. For example, the URL (path) may refer to a location that doesn't exist. This doesn't make the initializer invalid, but it does mean that it is prone to, and could generate, an error. Hence, the `throw` keyword. `throw` informs a developer that a function (or initializer) can generate an error and that it must be called according to Swift's error handling rules.
//:

//: To call a function that throws errors, a `do`-`catch` statement may be used. The `do`-`catch` statement is composed of two blocks: `do` and `catch`. The `do` block safely executes error-prone code, but it requires all error-prone calls to use the `try` keyword. If an error is thrown by any function in the `do` block, then the `catch` block is executed.
import Foundation

// read the contents of a text file into a string; should run without error
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "txt") {
    // run error-prone code
    do {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        print(content)
    } catch {
        print("ERROR: oh no! there was a problem")
    }
}

// read the contents of an image file into a string; should generate error
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    // run error-prone code
    do {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        print(content)
    } catch {
        print("ERROR: oh no! there was a problem")
    }
}
//: The `catch` block implicitly defines an `Error` constant called "error" that can be used to determine more information about the cause of the problem.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    do {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        print(content)
    } catch {
        print("\(error)") // notice, error is implicitly defined
    }
}
//: For readability, the "error" constant can be explicitly defined using `catch let error`.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    do {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        print(content)
    } catch let error {
        print("\(error)") // error is defined and available for use in the catch block
    }
}
//: In the examples above, `catch` handles any error thrown in the `do` block; some languages refer to this as a "catch all". However, in many cases, it's helpful to catch specific errors and handle them uniquely. Below, specific errors are caught and handled based on an error code. An error code is an integer which can be used to help identify a specific error.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    // create a url that does not exist
    let erroneousURL = fileURL.appendingPathComponent("unknown-path")
    
    do {
        let content = try String(contentsOf: erroneousURL, encoding: .utf8)
        print(content)
    } catch CocoaError.fileReadInapplicableStringEncoding {
        print("cannot read file into a string")
    } catch CocoaError.fileReadUnknown {
        print("file unknown, cannot read")
    } catch {
        print("\(error)")
    }
}
//: - Callout(Watch Out!):
//: If you catch an error by specifying an error code, then the "error" constant is not avaiable. Don't worry, if the error code is known, then the "error" constant is probably not needed.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    // create a url that does not exist
    let erroneousURL = fileURL.appendingPathComponent("unknown-path")
    
    do {
        let content = try String(contentsOf: erroneousURL, encoding: .utf8)
        print(content)
    } catch CocoaError.fileReadInapplicableStringEncoding {
        // uncomment the print statement to see Xcode complain
        //print("\(error)") /* the error constant does not exist */
        print("cannot read file into a string")
    } catch CocoaError.fileReadUnknown {
        print("file unknown, cannot read")
    } catch {
        print("\(error)")
    }
}
//: Alternatively, errors can be caught by type using the `catch is` syntax. By default, all errors extend from `NSError` which provides helpful information for troubleshooting. For example, `NSError` has a string property called "domain" which helps classifies the origin of an error. Also, an error's domain suggests if an error can be casted into a more specific type like `CocoaError`, `POSIXError`, or `MachError`. See [Apple's documentation on error objects, domains, and codes](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ErrorHandlingCocoa/ErrorObjectsDomains/ErrorObjectsDomains.html) to learn more.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    // create a url that does not exist
    let erroneousURL = fileURL.appendingPathComponent("unknown-path")
    
    do {
        let content = try String(contentsOf: erroneousURL, encoding: .utf8)
        print(content)
    } catch is CocoaError {
        print("this error is a CocoaError")
    } catch {
        print("\(error)")
    }
}
//: - Callout(Watch Out!):
//: It is redundant to check if an error is a `NSError`, and it will cause a compiler warning. Remember, all errors automatically extend from `NSError`.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    // create a url that does not exist
    let erroneousURL = fileURL.appendingPathComponent("unknown-path")
    
    do {
        let content = try String(contentsOf: erroneousURL, encoding: .utf8)
        print(content)
    }
    // uncomment the section below to see Xcode warn about catching an error as `NSError`
    /*
    catch is NSError {
        print("this error is an NSError")
    }
    */
    catch {
        print("\(error)")
    }
}
//: To catch and cast an error by type, combine `catch let error` with a type cast. In the example below, an error is casted into `CocoaError` which exposes common error codes generated by core Apple frameworks.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    // create a url that does not exist
    let erroneousURL = fileURL.appendingPathComponent("unknown-path")
    
    do {
        let content = try String(contentsOf: erroneousURL, encoding: .utf8)
        print(content)
    } catch let error as CocoaError { /* handle if error can be casted into a `CocoaError` */
        switch error.errorCode {
        case CocoaError.fileReadInapplicableStringEncoding.rawValue:
            print("cannot read file into a string")
        case CocoaError.fileReadUnknown.rawValue:
            print("file unknown, cannot read")
        default:
            print("cocoa error with code: \(error.errorCode)")
        }
    } catch {
        print("\(error)")
    }
}
//: Because Swift functions cannot expliclty specify the errors they throw, it can be difficult, or near impossible, to predict the types of errors to catch. In these cases, try casting the error to an `NSError` and print its error code, domain, and any additional information that may be helpful. If the error is generated by an Apple API, then try using a service like [OSStatus.com](https://www.osstatus.com) or Google, to find more information about the error.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "png") {
    // create a url that does not exist
    let erroneousURL = fileURL.appendingPathComponent("unknown-path")
    
    do {
        let content = try String(contentsOf: erroneousURL, encoding: .utf8)
        print(content)
    } catch let error as NSError { /* handle if error can be casted into an `NSError` */
        print("error description: \(error.localizedDescription)")
        print("error domain: \(error.domain)")
        print("error code: \(error.code)")
        print("error user info: \(error.userInfo)")        
    } catch {
        print("\(error)")
    }
}
//: - Callout(Watch Out!):
//: Multiple error-prone functions or initializers may be called within a `do` block. But, this makes identifying the cause of the error more difficult.
//:
if let fileURL = Bundle.main.url(forResource: "swift", withExtension: "txt") {
    
    let directoryWithFileURL = fileURL.deletingLastPathComponent()
    let badURL1 = directoryWithFileURL.appendingPathComponent("unknown-file-1")
    let badURL2 = directoryWithFileURL.appendingPathComponent("unknown-file-2")
    
    do {
        var content = ""
        
        content = try String(contentsOf: badURL1, encoding: .utf8)
        print(content)
        
        content = try String(contentsOf: badURL2, encoding: .utf8)
        print(content)
    } catch {
        print("it will take more information to determine the cause of error...")
    }
}
//: [Next](@next)
