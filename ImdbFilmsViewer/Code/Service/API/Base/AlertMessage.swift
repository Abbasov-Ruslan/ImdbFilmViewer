//
//  AlertMessage.swift
//  ImdbFilms
//
//  Created by Ruslan Abbasov on 13.10.2022.
//

class AlertMessage: Error {

    // MARK: - Vars & Lets

    var title = ""
    var body = ""

    // MARK: - Intialization

    init(title: String, body: String) {
        self.title = title
        self.body = body
    }

}
