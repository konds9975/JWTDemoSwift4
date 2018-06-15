//
//  ViewController.swift
//  JWTDemo
//
//  Created by Hitendra Bhoir on 15/06/18.
//  Copyright © 2018 Hitendra Bhoir. All rights reserved.
//

import UIKit
import JWT

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestDict : Dictionary<String, Any> = ["email":"testinkswi1@gmail.com","name":"Jon","last_name":"Bravo"]
        
        print("Before JWT encodeing : \(requestDict)")
        
        
        if let token = self.encodeDataInJWT(payload: requestDict)
        {
            print("After JWT encodeing")
            print("Generated Secreate JWT Token : \(token)")
            //You Can send your generated token to api request
            
            
            
            
            
            //Decodeing Token Process
            if let response = self.decodingDataInJWT(token:token)
            {
                print(response)
                print(response["email"] as? String ?? "No Email")
                print(response["name"] as? String ?? "No Name")
                print(response["last_name"] as? String ?? "No Last Name")
               
            }
            else
            {
                print("Decoding failed!")
            }
        
        }
        else
        {
            print("Token genration failed!")
        }
    }

    
    //MARK:- For encode the dictionary into JWT Token
    func encodeDataInJWT(payload: Dictionary<String, Any>) -> String?
    {
        let jwt  = JWT.encode(claims: payload, algorithm: .hs256("secreteKey".data(using: .utf8)!))
        return jwt
    }
    
    
    //MARK:- For decode the JWT token into Dictionary or ClaimSet
    
    //How to access ClaimSet as Any Type of data
    //let email =  claimset["email"] as? String
    
    func decodingDataInJWT(token:String!) -> ClaimSet?
    {
        do
        {
            let claimSet : ClaimSet = try JWT.decode(token, algorithm: .hs256("secreteKey".data(using: .utf8)!))
            return claimSet
         }
        catch
        {
            print(error)
        }
        return nil
    }

}

