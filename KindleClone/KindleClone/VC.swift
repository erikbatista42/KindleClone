//
//  ViewController.swift
//  KindleClone
//
//  Created by Erik Batista on 7/3/17.
//  Copyright © 2017 swift.lang.eu. All rights reserved.
//

import UIKit


class VC: UITableViewController {
    
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Kindle"
        setupBooks()
        fetchBooks()
        
        tableView.register(BookCell.self ,forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        
    }
    
    func fetchBooks() {
    print("Fetching books...")
        if  let url = URL(string: "http://jsonprettyprint.com/json-pretty-printer.php") {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let err = error {
                    print("failed to fetch json books",err)
                    return
                }
//                print(response)
//                print(data)
                guard let data = data else { return }
             guard let dataAsString = String(data: data, encoding: .utf8)
            else { return }
                print(dataAsString)
            }).resume()
            
            print("have we fetched our books yet?")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
//        print(book?.title)
//        return
        
        let layout = UICollectionViewFlowLayout()
        let bookPagerController = BookPagerController(collectionViewLayout: layout)
        
        bookPagerController.book = selectedBook
        
        let navController = UINavigationController(rootViewController: bookPagerController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell

        let book = books?[indexPath.row]
        cell.book = book
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count {
            return count
        }
        return 0
    }
    
    
    
    func setupBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This is text for second page")
        
        
        let pages = [page1,page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)
        
        
        
        
        let book2 =  Book(title: "Einstein: His life and Universe", author: "Walter Isaacson", image: #imageLiteral(resourceName: "einstein"), pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4")
            ])
        
        self.books = [book, book2]

    }
}

