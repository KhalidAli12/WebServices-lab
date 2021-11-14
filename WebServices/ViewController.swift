//
//  ViewController.swift
//  WebServices
//
//  Created by khalid ali on 09/04/1443 AH.
//

import UIKit

struct charecter : Codable {
    var fact : String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getimg()

    }
    func getimg(){
        var dogurl = URLComponents()
          dogurl.scheme = "https"
        dogurl.host = "dog-facts-api.herokuapp.com"
        dogurl.path = "/api/v1/resources/dogs/all"
        
        let urlRequest = URLRequest(url: dogurl.url!)
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            do {
                let jsonDecder = JSONDecoder()
                let characters = try jsonDecder.decode([charecter].self, from: data!)
                print(characters)
            } catch {
                print("Error fetcing the data: \(error)")
            }
            
        }
        task.resume()
    }
  
    


}

