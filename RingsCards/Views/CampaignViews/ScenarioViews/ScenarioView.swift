//
//  ScenarioView.swift
//  RingsCards
//
//  Created by Christoph Freier on 29.08.23.
//

import SwiftUI

struct ScenarioView: View {
    var scenario: Scenario

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                    VStack {
                        Text(scenario.name)
                            .font(.title)

                        CircleIcon(image: Image(scenario.nameCanonical))

                        Text(scenario.pack)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)

                Divider()

                Text(scenario.flavorIntro ?? "")
                    .font(.system(size: 18, weight: .light, design: .serif))
                    .italic()

                Divider()

                Text("The \(scenario.name) encounter deck is built with all the cards from the following encounter sets:")

                ForEach(scenario.encounters) { scenario in
                    HStack {
                        CircleIcon(image: Image(scenario.code))
                        Text(scenario.name)
                    }
                }

                ScenarioChart(scenario: scenario)
            }
            .padding()
        }
    }
}

struct ScenarioView_Previews: PreviewProvider {
    static var scenarios = RingsData().scenarios

    static var previews: some View {
            ScenarioView(scenario: scenarios[0])
    }
}
