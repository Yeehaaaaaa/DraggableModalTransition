//
//  MyTabBarController.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 02/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class MyTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    self.viewControllers = self.setupControllers()

    // - Add tag on each UITabBarItem
    if let items = self.tabBar.items {
      for (index, tab) in items.enumerated() {
        tab.tag = index
      }
    }

//    self.view.addSubview(self.customView)
//
//    self.customView.snp.makeConstraints { make in
//      make.bottom.equalTo(self.view.snp.bottom).offset(-self.getTabBarHeight())
//      make.leading.equalTo(self.view.snp.leading).offset(0)
//      make.trailing.equalTo(self.view.snp.trailing).offset(0)
//    }

    BottomViewController.instantiateAddPannierViewController(self)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

  }

  fileprivate func setupControllers() -> [UIViewController] {

    var listVC = [UIViewController]()

    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    let firstController = storyboard.instantiateViewController(withIdentifier: "first")
    listVC.append(firstController)

    let secondController = storyboard.instantiateViewController(withIdentifier: "second")
    listVC.append(secondController)

    return listVC
  }

  func getTabBarHeight() -> CGFloat {
    return self.tabBar.frame.size.height
  }
}
