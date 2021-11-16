//
//  ViewController.swift
//  WebServices
//
//  Created by khalid ali on 09/04/1443 AH.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getimg()

    }
    func getimg(){
        var itunesURL = URLComponents()
        itunesURL.scheme = "https"
        itunesURL.host = "api.spyse.com"
        itunesURL.path = "/v4/data/domain/google.com"
        
        let itunesRequestURL = itunesURL.url!
        let itunesRequest = URLRequest(url: itunesRequestURL)
        
        let urlSession = URLSessionConfiguration.default
        urlSession.allowsCellularAccess = false
        urlSession.httpShouldSetCookies = false
        
        let itunesSession = URLSession(configuration: urlSession)
        
        let fetchDataTask = itunesSession.dataTask(with: itunesRequest) {
            (data: Data!, response: URLResponse?, err: Error?) in
            print(String(data: data, encoding: .utf8))
        }
        fetchDataTask.resume()

        
}

}
