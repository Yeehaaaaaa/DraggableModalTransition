//
//  DragModalAnimatedTansitioning.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 01/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import UIKit

class DragModalAnimatedTansitioning: NSObject, UIViewControllerAnimatedTransitioning {

  enum TransitionType {
    case presenting
    case dismissing
  }

  let transitionType: TransitionType

  init(transitionType: TransitionType) {
    self.transitionType = transitionType

    super.init()
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let inView   = transitionContext.containerView
    let toVc   = transitionContext.viewController(forKey: .to)!
    let fromVc = transitionContext.viewController(forKey: .from)!

    let toView = toVc.view!
    let fromView = fromVc.view!

    let frame = inView.bounds

    switch transitionType {
    case .presenting:
      toView.frame.origin.y += frame.size.height
      inView.addSubview(toView)

      UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
        toView.frame = frame
      }, completion: { finished in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        // - On remet le controller en dessous du ToViewController
        // - https://stackoverflow.com/questions/24338700/from-view-controller-disappears-using-uiviewcontrollercontexttransitioning
        UIApplication.shared.keyWindow!.insertSubview(fromView, at: 0)
      })
    case .dismissing:
      toView.frame = frame
      inView.insertSubview(toView, belowSubview: fromView)

      UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
        fromView.frame.origin.y += frame.size.height
      }, completion: { finished in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      })
    }
  }

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
}
