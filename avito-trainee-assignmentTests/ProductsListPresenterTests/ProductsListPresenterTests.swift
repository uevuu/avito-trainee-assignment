//
//  ProductsListPresenterTests.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import XCTest
@testable import avito_trainee_assignment

// MARK: - ProductsListPresenterTests
final class ProductsListPresenterTests: XCTestCase {
    var presenter: ProductsListPresenter!
    var view: MockProductsListView!
    var coordinator: MockProductsListCoordinator!
    var advertisementsNetworkService: MockAdvertisementsNetworkService!

    override func setUpWithError() throws {
        view = MockProductsListView()
        advertisementsNetworkService = MockAdvertisementsNetworkService()
        coordinator = MockProductsListCoordinator()
        presenter = ProductsListPresenter(
            output: coordinator,
            advertisementsNetworkService: advertisementsNetworkService
        )
        presenter.view = view
    }
    
    func testLoadDataSuccess() {
        presenter.loadData()
        let exp = XCTestExpectation(description: #function)
        
        XCTAssertTrue(view.showLoadingCalled)
        
        DispatchQueue.main.async { [self] in
            XCTAssertTrue(view.showProductsCalled)
            XCTAssertFalse(view.showErrorCalled)
            exp.fulfill()
        }
    }
    
    func testLoadDataFailure() {
        advertisementsNetworkService.success = false
        presenter.loadData()
        let exp = XCTestExpectation(description: #function)
        
        XCTAssertTrue(view.showLoadingCalled)
        
        DispatchQueue.main.async { [self] in
            XCTAssertFalse(view.showProductsCalled)
            XCTAssertTrue(view.showErrorCalled)
            exp.fulfill()
        }
    }
    
    func testGoToProductInfoModule() {
        XCTAssertFalse(coordinator.goToProductInfoModule)
        presenter.loadData()
        presenter.tapOnProduct(at: IndexPath(item: 0, section: 0))
        XCTAssertTrue(coordinator.goToProductInfoModule)
    }
    
    func testGetAdvertisementsCount() {
        XCTAssertEqual(presenter.getAdvertisementsCount(), 0)
        presenter.loadData()
        XCTAssertEqual(presenter.getAdvertisementsCount(), 3)
    }
}
