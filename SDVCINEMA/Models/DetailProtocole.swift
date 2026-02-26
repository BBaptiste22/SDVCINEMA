//
//  MediaProtocole.swift
//  SDVCINEMA
//
//  Created by Etudiant on 25/02/2026.
//

protocol DetailPresentable {
    var id: Int { get }
    var detailTitle: String { get }
    var detailOverview: String { get }
    var detailPosterPath: String { get }
    var detailDate: String { get }
}
