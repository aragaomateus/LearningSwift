import Foundation

class Parser :  NSObject, XMLParserDelegate {
    var currentElement: String?
    var currentText: String?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        currentText = ""
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentText? += string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if let element = currentElement, let text = currentText, !text.isEmpty {
            print("Element: \(element), Text: \(text)")
        }
        currentElement = nil
        currentText = nil
    }
}

let endpoint = "http://export.arxiv.org/api/query?search_query=all&sortBy=submittedDate&sortOrder=descending"

guard let url:URL = URL(string:endpoint) else {
    fatalError("Invalid response 1 ")
}



do {
    let (data,response) = try await URLSession.shared.data(from:url)

    guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{
    fatalError("Invalid Response 2")
    }

    if let dataString = String(data:data,encoding:.utf8){
        let beginning = String(dataString.prefix(100))
        let parser = Parser()
        let xmlParser2 = XMLParser(data: data)
        xmlParser2.delegate = parser

        xmlParser2.parse() 

    }else{
        print("cant be converted")
    }

}catch {
    print(error)
}
