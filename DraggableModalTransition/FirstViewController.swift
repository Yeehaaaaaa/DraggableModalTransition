//
//  ViewController.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 01/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  var interactionController = DraggableModalPercentDrivenInteractiveTransition()

  override func viewDidLoad() {
    super.viewDidLoad()

//    self.interactionController.setupDragModalAnimation(self, segueIdentifier: "goToSecond")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    self.view.frame.size.height = self.view.frame.size.height - 49
  }

  @IBAction func ShowTapped(_ sender: Any) {

    self.performSegue(withIdentifier: "goToSecond", sender: nil)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    switch (segue.identifier, segue.destination) {

    case ("goToSecond"?, let viewController as SecondViewController):

      self.interactionController.setupSecond(viewController: viewController)

    default:
      break
    }
  }
}
