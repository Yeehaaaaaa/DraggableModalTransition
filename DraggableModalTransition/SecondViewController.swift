//
//  SecondViewController.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 01/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  var statusBarHidden = false {
    didSet {
      UIView.animate(withDuration: 0.2) { () -> Void in
        self.setNeedsStatusBarAppearanceUpdate()
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    self.statusBarHidden = true
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

  }

  override var prefersStatusBarHidden: Bool {
    return statusBarHidden
  }

  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .slide
  }

  deinit {
    print("DEINIT")
  }

  @IBAction func DismissTapped(_ sender: Any) {

    self.dismiss(animated: true, completion: nil)
  }
}
