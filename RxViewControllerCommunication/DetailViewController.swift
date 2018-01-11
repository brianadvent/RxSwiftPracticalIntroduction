//
//  DetailViewController.swift
//  RxViewControllerCommunication
//
//  Created by Brian Advent on 09.01.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import RxSwift

/*protocol CharacterDelegate {
    func didSelectCharacter (_ name:String)
}*/

class DetailViewController: UIViewController {
   
    
    // var delegate:CharacterDelegate?
    
    private let selectedCharacterVariable = Variable("User")
    var selectedCharacter:Observable<String> {
        return selectedCharacterVariable.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func characterSelected(_ sender: UIButton) {
        guard let characterName = sender.titleLabel?.text else {return}
        
        selectedCharacterVariable.value = characterName
        
        /*if let delegateObject = delegate {
            delegateObject.didSelectCharacter(characterName)
        }*/
        
    }
    
    
}
