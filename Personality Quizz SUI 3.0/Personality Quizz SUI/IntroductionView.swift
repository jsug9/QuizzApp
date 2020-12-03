//
//  ContentView.swift
//  Personality Quizz SUI
//
//  Created by Augusto Galindo Alí on 8/18/20.
//  Copyright © 2020 Augusto Galindo Ali. All rights reserved.
//

import SwiftUI

struct IntroductionView: View {
    @State var isActive : Bool = false
    
    @State var selectAQuizz = "Selected Quizz"
    @State var myQuizzes = [animalQuizz, narutoQuizz, rockQuizz, onePieceQuizz, bleachQuizz, peruQuizz]
    @State var quizzIndex = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose Quizz")) {
                    Picker(
                        selection: $quizzIndex,
                        label: HStack {
                            Text("Select Quizz")
                    }) {
                        ForEach(0..<myQuizzes.count) {
                            Text(myQuizzes[$0].fullName)
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    
                    ZStack {
                        NavigationLink(destination: QuestionView(rootIsActive: $isActive, questions: myQuizzes[quizzIndex].questions.shuffled(), totalQuestions: myQuizzes[quizzIndex].questions.count, title: myQuizzes[quizzIndex].shortName), isActive: $isActive) {
                                EmptyView()
                        }.disabled(true)
                        Button("Begin Personality Quiz") {
                            myQuizzes[quizzIndex].questions.shuffle()
                            self.isActive.toggle()
                            
                        }
                    }
                }
            }
            .navigationTitle(Text("Personality Quizz"))
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
