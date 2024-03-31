//
//  ContentView.swift
//  LiveApp
//
//  Created by student on 31/03/2024.
//

import SwiftUI

var subjects = subjectList



struct ContentView: View {
    @State private var textField: String = ""
    @State private var showModal: Bool = false // Controls the visibility of the modal
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(subjects, id: \.self) { subject in
                        NavigationLink(destination: Text(subject)) {
                            Image(systemName: "book")
                            Text(subject)
                        }
                        .padding()
                    }
                }
                .navigationTitle("Subjects")
                
                // Button to show the modal for adding a new subject
                Button("Add New Item") {
                    showModal = true
                }
                .padding()
                .sheet(isPresented: $showModal) {
                    // Modal view for adding a new subject
                    VStack {
                        TextField("Enter subject name", text: $textField)
                            .padding()
                        
                        Button("Add") {
                            if !textField.trimmingCharacters(in: .whitespaces).isEmpty {
                                subjects.append(textField)
                                textField = ""
                                showModal = false // Dismiss the modal
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
            }
        }
    }
}
