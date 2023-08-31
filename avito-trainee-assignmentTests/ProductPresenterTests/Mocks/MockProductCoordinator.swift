//
//  MockProductCoordinator.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import avito_trainee_assignment

// MARK: - MockProductCoordinator
final class MockProductCoordinator: ProductPresenterOutput {
    var goToPreviousModuleCalled = false
    
    func goToPreviousModule() {
        goToPreviousModuleCalled = true
    }
}
