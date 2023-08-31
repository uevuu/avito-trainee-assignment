//
//  MockProductView.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import avito_trainee_assignment

// MARK: - MockProductView
final class MockProductView: ProductViewInput {
    var showLoadingCalled = false
    var showDetailCalled = false
    var showErrorCalled = false
    
    func showDetail(_ advertisementDetail: AdvertisementDetail) {
        showDetailCalled = true
    }
    
    func showError() {
        showErrorCalled = true
    }
    
    func showLoading() {
        showLoadingCalled = true
    }
}
