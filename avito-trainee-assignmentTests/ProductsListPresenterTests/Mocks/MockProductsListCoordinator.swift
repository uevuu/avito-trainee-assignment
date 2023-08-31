//
//  MockProductsListCoordinator.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import avito_trainee_assignment

// MARK: - MockProductsListCoordinator
final class MockProductsListCoordinator: ProductsListPresenterOutput {
    var goToProductInfoModule = false
    
    func goToProductInfoModule(id: String) {
        goToProductInfoModule = true
    }
}
