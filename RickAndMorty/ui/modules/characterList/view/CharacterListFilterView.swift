//
//  CharacterListFilterView.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 4/2/23.
//

import SwiftUI

struct CharacterListFilterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var filterData: CharacterFilterData
    var action: (CharacterFilterData) -> ()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(Localizable.CharacterName.value)) {
                    TextField("", text: $filterData.name)
                        .disableAutocorrection(true)
                        .foregroundColor(Color.ui.Black)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                        .frame(maxWidth: .infinity)
                }
                
                Section(header: Text(Localizable.CharacterStatus.value)) {
                    Picker("", selection: $filterData.status) {
                        ForEach(StatusEnum.allCases, id: \.self) { status in
                            Text(status.value)
                                .tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text(Localizable.CharacterSpecies.value)) {
                    TextField("", text: $filterData.species)
                        .disableAutocorrection(true)
                        .foregroundColor(Color.ui.Black)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                        .frame(maxWidth: .infinity)
                }
                
                Section(header: Text(Localizable.CharacterType.value)) {
                    TextField("", text: $filterData.type)
                        .disableAutocorrection(true)
                        .foregroundColor(Color.ui.Black)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                        .frame(maxWidth: .infinity)
                }
                
                Section(header: Text(Localizable.CharacterGender.value)) {
                    Picker("", selection: $filterData.gender) {
                        ForEach(GenderEnum.allCases, id: \.self) { gender in
                            Text(gender.value)
                                .tag(gender)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    HStack {
                        Button(Localizable.CharacterFilterRemove.value) {
                            self.action(CharacterFilterData())
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .background(Color.ui.WhiteBroken)
                        .foregroundColor(Color.ui.WhiteSmock)
                        .cornerRadius(5)
                        
                        Spacer()
                        
                        Button(Localizable.CharacterFilterApply.value) {
                            self.action(filterData)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .padding()
                        .background(Color.ui.Orange)
                        .foregroundColor(Color.ui.White)
                        .cornerRadius(5)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
            }
            .navigationBarTitle(Localizable.CharacterFilter.value, displayMode: .inline)
            .navigationBarItems(leading:
                                    Image(systemName: "xmark")
                .foregroundColor(Color.ui.Primary)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

#if DEBUG
struct CharacterListFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListFilterView(filterData: CharacterFilterData()) { filterData in
            
        }
    }
}
#endif
