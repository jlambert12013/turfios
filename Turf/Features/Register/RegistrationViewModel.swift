//
//  RegistrationViewModel.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import Foundation
import Combine

enum RegistrationState {
    case successful
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func register()
    var service: RegistrationService  { get }
    var state: RegistrationState { get }
    var userDetails: Registration  { get }
    init(service: RegistrationService)
}


final class RegistrationViewModelImpl: RegistrationViewModel {
    let service: RegistrationService
    var state: RegistrationState = .na
    var userDetails: Registration = Registration.new
    
    init(service: RegistrationService) {
        self.service = service
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func register() {
        
        service
            .register(with: userDetails)
            .sink { [weak self] res in
                
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions)
        
    }
}

