//
//  BaseViewModel.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 2.11.2023.
//

import Foundation

enum FetchingStatus {
    case none, failed, success, loading
}

class BaseViewModel: ObservableObject {
    
    @Published var loadingStatus: FetchingStatus = .none
    
    
}
