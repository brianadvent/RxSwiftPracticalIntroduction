//
//  ViewController.swift
//  RxViewControllerCommunication
//
//  Created by Brian Advent on 09.01.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import RxSwift

class MasterViewController: UIViewController { //, CharacterDelegate {

    @IBOutlet weak var greetingsLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func selectCharacter(_ sender: Any) {
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //detailVC.delegate = self
        
        detailVC.selectedCharacter
        .subscribe(onNext: { [weak self] character in
            self?.greetingsLabel.text = "Hello \(character)"
        }).disposed(by: disposeBag)
       
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func didSelectCharacter(_ name: String) {
        self.greetingsLabel.text = "Hello \(name)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

