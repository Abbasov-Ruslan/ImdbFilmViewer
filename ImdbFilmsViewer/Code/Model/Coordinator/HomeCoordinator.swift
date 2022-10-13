//
//  HomeCoordinator.swift
//  RouterCoordianatorTraining
//
//  Created by Ruslan Abbasov on 20.09.2022.
//

import UIKit

public class HomeCoordinator: Coordinator {

  // MARK: - Instance Properties
  public var children: [Coordinator] = []
  public let router: Router

  // MARK: - Object Lifecycle
  public init(router: Router) {
    self.router = router
  }

  // MARK: - Instance Methods
  public func present(animated: Bool,
                      onDismissed: (() -> Void)?) {
    let viewController =
      HomeViewController.instantiate(delegate: self)
    router.present(viewController,
                   animated: animated,
                   onDismissed: onDismissed)
  }
}

// MARK: - HomeViewControllerDelegate
extension HomeCoordinator: HomeViewControllerDelegate {

  public func homeViewControllerDidPressScheduleAppointment(
    _ viewController: HomeViewController) {
    let router =
      ModalNavigationRouter(parentViewController: viewController)
    let coordinator =
      FilmInformationBuilderCoordinator(router: router)
    presentChild(coordinator, animated: true)
  }
}
