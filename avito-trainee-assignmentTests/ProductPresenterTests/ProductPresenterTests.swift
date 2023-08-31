//
//  ProductPresenterTests.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import XCTest
@testable import avito_trainee_assignment

// MARK: - ProductPresenterTests
final class ProductPresenterTests: XCTestCase {
    var presenter: ProductPresenter!
    var view: MockProductView!
    var coordinator: MockProductCoordinator!
    var advertisementDetailNetworkService: MockAdvertisementDetailNetworkService!

    override func setUpWithError() throws {
        view = MockProductView()
        advertisementDetailNetworkService = MockAdvertisementDetailNetworkService()
        coordinator = MockProductCoordinator()
        presenter = ProductPresenter(
            output: coordinator,
            advertisementId: "testId",
            advertisementDetailNetworkService: advertisementDetailNetworkService
        )
        presenter.view = view
    }

    func testLoadDataSuccess() {
        presenter.loadData()
        
        let exp = XCTestExpectation(description: #function)
        XCTAssertTrue(view.showLoadingCalled)
        
        DispatchQueue.main.async { [self] in
            XCTAssertTrue(view.showDetailCalled)
            XCTAssertFalse(view.showErrorCalled)
            exp.fulfill()
        }
        
        wait(for: [exp])
    }
    
    func testLoadDataFailure() {
        advertisementDetailNetworkService.success = false
        presenter.loadData()
        
        let exp = XCTestExpectation(description: #function)
        XCTAssertTrue(view.showLoadingCalled)

        DispatchQueue.main.async { [self] in
            XCTAssertFalse(view.showDetailCalled)
            XCTAssertTrue(view.showErrorCalled)
            exp.fulfill()
        }
        
        wait(for: [exp])
    }
        
    func testGoToPreviousModule() {
        XCTAssertFalse(coordinator.goToPreviousModuleCalled)
        presenter.backToPreviousModule()
        XCTAssertTrue(coordinator.goToPreviousModuleCalled)
    }
}
