//
//  DeckViewHome.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.12.23.
//

import SwiftUI
import SwiftData

struct DeckViewHome: View {
    @Environment(ViewCardModel.self) var viewCardModel
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Pack> { pack in
        pack.isInCollection }) var packs: [Pack]
    @State var editCard = false
    @State var viewCard = false
    @Bindable var deck: Deck

    var body: some View {
        @Bindable var viewCardModel = viewCardModel

        if viewCard {
            CardInfo(deck: deck)

            CardList(
                deck: deck,
                deckView: true,
                campaign: Campaign.emptyCampaign,
                campaignView: false,
                editCard: .constant(true),
                viewCard: $viewCard,
                editBoons: .constant(false),
                filterPack: packs.map { $0.packCode },
                filterDeck: []
            )
            .navigationTitle($deck.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    DeckViewButton(viewCard: $viewCard)
                }

                ToolbarItemGroup(placement: .secondaryAction) {
                    CardFilterButton()
                    CardSortButton()
                }
            }
        } else {
            CardInfo(deck: deck)

            CardList(
                deck: deck,
                deckView: true,
                campaign: Campaign.emptyCampaign,
                campaignView: false,
                editCard: $editCard,
                viewCard: .constant(false),
                editBoons: .constant(false),
                filterPack: [],
                filterDeck: deck.slots.map { String($0.key) }
            )
            .navigationTitle($deck.name)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    DeckViewButton(viewCard: $viewCard)
                    DeckEditButton(editCard: $editCard)
                }
            }
        }
    }
}

#Preview {
    ModelPreview { deck in
        DeckViewHome(deck: deck)
    }
    .modelContainer(previewModelContainer)
    .environment(ViewCardModel())
    .environment(ViewDeckModel())
}
