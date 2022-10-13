//
//  FilmInformationCoordantor.swift
//  RouterCoordianatorTraining
//
//  Created by Ruslan Abbasov on 22.09.2022.
//

import UIKit

public class FilmInformationBuilderCoordinator: Coordinator {

    public let builder = FilmInformationBuilder()
    public var children: [Coordinator] = []
    public let router: Router

    public init(router: Router) {
      self.router = router
    }

    // MARK: - Instance Methods
    public func present(animated: Bool,
                        onDismissed: (() -> Void)?) {
      let viewController =
        FilmInformationViewController.instantiate(delegate: self)
      router.present(viewController,
                     animated: animated,
                     onDismissed: onDismissed)
    }
}

extension FilmInformationBuilderCoordinator:
  FilmInformationViewControllerDelegate {

    public func homeViewControllerDidPressShowFilmInformation(_ viewController: FilmInformationViewController) {
        let viewController =
          FilmInformationViewController.instantiate(
            delegate: self)
        router.present(viewController, animated: true)

  }
}
