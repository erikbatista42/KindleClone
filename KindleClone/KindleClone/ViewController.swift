//
//  ViewController.swift
//  KindleClone
//
//  Created by Erik Batista on 7/3/17.
//  Copyright © 2017 swift.lang.eu. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let author: String
    let pages: [Page]
    
    init(title: String, author: String, pages: [Page]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}

class Page {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        //Can provide custom code starting here
        
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This is text for second page")
        

        let pages = [page1,page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)
        
//        let firstPage = book.pages[0]
//        
//        if page2.number < 3 {
//            print(page2.text)
//        }
//        book.pages[0]
//        book.pages[1]
        
        
        let book2 =  Book(title: "Bill Gates: A Biography", author: "Michael Becraft", pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4")
            ])
        for books in [book, book2] {
            print(books.title)
            for pages in books.pages {
                print(pages.text)
            }
        }
        
    }

}

