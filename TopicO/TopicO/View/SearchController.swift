//
//  SearchController.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct SearchController<Result: View>: UIViewControllerRepresentable {
    
    @Binding var searchText: String
    
    private var content: (_ searchText:String)->Result
    private var searchBarPlaceholder: String

    init(_ searchBarPlaceholder: String = "", searchedText: Binding<String>,
         resultView: @escaping (_ searchText:String) -> Result) {
        self.content = resultView
        self._searchText = searchedText
        self.searchBarPlaceholder = searchBarPlaceholder
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let contentViewController = UIHostingController(rootView: SearchResultView(result: $searchText, content: content))
        let navigationController = UINavigationController(rootViewController: contentViewController)

        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = context.coordinator
        searchController.obscuresBackgroundDuringPresentation = false // for results
        searchController.searchBar.placeholder = searchBarPlaceholder

        contentViewController.title = "\\(Title)" // for customization
        contentViewController.navigationItem.searchController = searchController
        contentViewController.navigationItem.hidesSearchBarWhenScrolling = true
        contentViewController.definesPresentationContext = true

        searchController.searchBar.delegate = context.coordinator

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<SearchController>) {
        //

    }
}
extension SearchController {
    
    func makeCoordinator() -> SearchController<Result>.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UISearchResultsUpdating, UISearchBarDelegate {
        var parent: SearchController
        init(_ parent: SearchController){self.parent = parent}

        // MARK: - UISearchResultsUpdating
        func updateSearchResults(for searchController: UISearchController) {
            self.parent.searchText = searchController.searchBar.text!
        }

        // MARK: - UISearchBarDelegate
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.parent.searchText = ""
        }

        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            self.parent.searchText = ""
            return true
        }
    }
}

// "nofity" the result content about the searchText
struct SearchResultView<Content: View>: View {
    
    @Binding var searchText: String
    
    private var content: (_ searchText:String)->Content
    
    init(result searchText: Binding<String>, @ViewBuilder content: @escaping (_ searchText:String) -> Content) {
        self._searchText = searchText
        self.content = content
    }
    
    var body: some View {
        content(searchText)
    }
}
