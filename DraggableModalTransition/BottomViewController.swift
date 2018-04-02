//
//  BottomViewController.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 02/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import Foundation
import UIKit

class BottomViewController: UIViewController {

  var interactionController = DraggableModalPercentDrivenInteractiveTransition()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.interactionController.setupDragModalAnimation(self, segueIdentifier: "goToModal")
  }

  deinit {
    print("DEINIT")
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    switch (segue.identifier, segue.destination) {

    case ("goToModal"?, let viewController as ModalViewController):

      self.interactionController.setupSecond(viewController: viewController)

    default:
      break
    }
  }
}

extension BottomViewController {

  static func instantiateAddPannierViewController(_ vc: UIViewController) {

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let popupVC = storyboard.instantiateViewController(withIdentifier: "bottom")

    vc.addChildViewController(popupVC)
    popupVC.view.frame = vc.view.frame
    vc.view.addSubview(popupVC.view)
    popupVC.didMove(toParentViewController: vc)
  }
}
