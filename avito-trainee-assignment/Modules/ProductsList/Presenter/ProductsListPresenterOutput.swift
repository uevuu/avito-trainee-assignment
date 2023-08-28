//
//  ProductsListPresenterOutput.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 28.08.2023.
//

import Foundation

// MARK: - ProductsListPresenterOutput
protocol ProductsListPresenterOutput: AnyObject {
    func goToProductInfoModule(id: String)
}
