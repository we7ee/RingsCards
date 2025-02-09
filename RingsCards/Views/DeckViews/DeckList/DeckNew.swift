//
//  DeckNew.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.09.23.
//

import SwiftUI
import SwiftData

struct DeckNew: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) var modelContext
    @State var deckName: String = ""

    var body: some View {
        Form {
            Section {
                TextField("New Deck Name", text: $deckName)
            }

            Section {
                HStack {
                    Spacer()
                    Button("Create Deck", action: {
                        modelContext.insert(Deck(name: deckName, date_creation: Date(), slots: ["": 0]))

                        self.presentationMode.wrappedValue.dismiss()
                    })
                    Spacer()
                }
            }
        }
        .navigationTitle("New Deck")
    }
}

#Preview {
    DeckNew()
}
