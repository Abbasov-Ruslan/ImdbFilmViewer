//
//  Film.swift
//  RouterCoordianatorTraining
//
//  Created by Ruslan Abbasov on 22.09.2022.
//

import Foundation

public struct FilmInformation {

  // MARK: - Instance Properties
  public let date: Date
}

public class FilmInformationBuilder {

  // MARK: - Instance Properties
  public var date = Date()

  // MARK: - Builder Methods
  public func build() -> FilmInformation {
    return FilmInformation(date: date)
  }
}
