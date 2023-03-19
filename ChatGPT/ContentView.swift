//
//  ContentView.swift
//  ChatGPT
//
//  Created by Карина on 19.03.2023.
//

import SwiftUI

struct PetPortalView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image("dog")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 50)
                
                NavigationLink(destination: PetList()) {
                    Text("View Your Pets")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: AddPet()) {
                    Text("Add a Pet")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("Pet Portal")
        }
    }
}

struct PetList: View {
    var body: some View {
        List(pets) { pet in
            NavigationLink(destination: PetDetail(pet: pet)) {
                VStack(alignment: .leading) {
                    Text(pet.name)
                        .font(.title2)
                    
                    Text(pet.type)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("My Pets")
    }
}

struct AddPet: View {
    @State private var name = ""
    @State private var type = ""
    @State private var imageName = ""
    @State private var description = ""
    
    var body: some View {
        Form {
            Section(header: Text("Pet Information")) {
                TextField("Name", text: $name)
                TextField("Type", text: $type)
                TextField("Image Name", text: $imageName)
                TextField("Description", text: $description)
            }
            
            Section {
                Button(action: {
                    let newPet = Pet(name: name, type: type, imageName: imageName, description: description)
                    pets.append(newPet)
                }) {
                    Text("Add Pet")
                }
            }
        }
        .navigationTitle("Add a Pet")
    }
}

struct PetDetail: View {
    let pet: Pet
    
    var body: some View {
        VStack {
            Image(pet.imageName)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(pet.description)
                .padding()
            
            Spacer()
        }
        .navigationTitle(pet.name)
    }
}

struct Pet: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let imageName: String
    let description: String
}

var pets = [    Pet(name: "Buddy", type: "Dog", imageName: "dog", description: "Buddy is a friendly dog who loves to play fetch."),    Pet(name: "Whiskers", type: "Cat", imageName: "cat", description: "Whiskers is a curious cat who loves to explore."),    Pet(name: "Polly", type: "Parrot", imageName: "parrot", description: "Polly is a talkative parrot who can mimic human speech."),]

struct PetPortalView_Previews: PreviewProvider {
    static var previews: some View {
        PetPortalView()
    }
}
