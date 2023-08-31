//
//  MockProductsListView.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import avito_trainee_assignment

// MARK: - MockProductsListView
final class MockProductsListView: ProductsListViewInput {
    var showLoadingCalled = false
    var showProductsCalled = false
    var showErrorCalled = false

    func showProducts() {
        showProductsCalled = true
    }
    
    func showError() {
        showErrorCalled = true
    }
    
    func showLoading() {
        showLoadingCalled = true
    }
}
