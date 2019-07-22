//
//  ViewController.swift
//  SimpleUnitTestApp
//
//  Created by Bruno Lopes de Mello on 18/07/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import UIKit

class TipCalc {
    var defPerc = 75.0
    
    func calcTip(ammount: Double, tipPerc: Double) -> Double {
        
        return ammount * tipPerc/100.0
    }
}

class Music {
    var cache : [[String:Any]]?
    var fetchDate : Date?
    
    func refresh() {
        cache = nil
        fetchDate = nil
        fetchMusic { (newData, error) in
            if newData != nil {
                self.fetchDate = Date()
            }
        }
    }
    
    func fetchMusic(completion : @escaping ([[String:Any]]?, Error?)->Void) {
        guard cache == nil else { completion(cache, nil); return }
        
        let dt = URLSession.shared.dataTask(with: URL.init(string: "https://orangevalleycaa.org/api/music")!) { (data, response, error) in
            completion(self.parseJSON(data: data!), error)
        }
        dt.resume()
    }
    
    func parseJSON(data : Data) -> [[String:Any]]? {
        cache = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]
        return cache
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tfinput: UITextField!
    @IBOutlet weak var lboutput: UILabel!
    @IBOutlet weak var btncalc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func doBtnCalc(_ sender: Any) {
        if let value = Double(tfinput.text ?? "0.0") {
            let tc = TipCalc()
            let tip = tc.calcTip(ammount: value, tipPerc: 50.0)
            lboutput.text = "tip: \(tip)"
        }
    }
    
}

