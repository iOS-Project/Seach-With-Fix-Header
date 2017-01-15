//
//  HeaderView.swift
//  Search
//
//  Created by Lun Sovathana on 1/14/17.
//  Copyright © 2017 Lun Sovathana. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //setupView()
    }
    
    func setupView() {
        print("awake")
        let v  = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! UIView
        self.addSubview(v)
        v.frame = self.bounds
    }
}
