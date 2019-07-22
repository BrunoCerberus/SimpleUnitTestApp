//
//  MockMusic.swift
//  SimpleUnitTestAppTests
//
//  Created by Bruno Lopes de Mello on 18/07/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import Foundation
@testable import SimpleUnitTestApp

class MockMusic: Music {
    override func fetchMusic(completion: @escaping ([[String : Any]]?, Error?) -> Void) {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "JSON", ofType: "txt") {
            if let data = try? Data.init(contentsOf: URL(fileURLWithPath: path)) {
                let parsedData = self.parseJSON(data: data)
                completion(parsedData, nil)
            }
        }
    }
}
