//
//  SetpViewController.swift
//  lightMaze
//
//  Created by aby on 2019/11/15.
//  Copyright © 2019 aby. All rights reserved.
//

import UIKit
import SwiftUI

protocol SetpViewModelFactory {
    func makeSetpViewModel() -> SetpViewModel
}

class SetpViewController: UIViewController {

    let viewModel: SetpViewModel
    let hostVC: UIHostingController<SetpContentView>
    init(viewModelFactory: SetpViewModelFactory) {
        self.viewModel = viewModelFactory.makeSetpViewModel()
        self.hostVC = UIHostingController.init(rootView: SetpContentView(viewModel: self.viewModel))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("cannot init from coder")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = UIView.init()
        addFullScreen(childViewController: self.hostVC)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
