//
//  DetailView.swift
//  TopicO
//
//  Created by Marcus Vinicius Vieira Badiale on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    let tag: Tag
    
    var body: some View {
        ZStack{
            
            VStack{
                ZStack{
                    Image(tag.image)
                        .resizable()
                        .frame(width: getImageSize(isWidth: true), height: getImageSize(isWidth: false))
                    Rectangle()
                        .fill(Color(red: 76/255, green: 0/255, blue: 195/255).opacity(0.63))
                        .frame(width: getImageSize(isWidth: true), height: getImageSize(isWidth: false))
                }
                Spacer()
            }
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(tag.name)
                            .font(.custom("Jost", size: 28)).fontWeight(.medium)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                .padding(.horizontal, 26)
                .padding(.vertical, 10)
                
                List {
                    ForEach(0..<tag.questions.count) { i in
                        HStack{
                            Text("\(i + 1).")
                                .font(.custom("Jost", size: 20)).fontWeight(.medium)
                                .lineLimit(0)
                                .foregroundColor(Color(red: 134/255, green: 57/255, blue: 255/255))
                            Text(self.tag.questions[i])
                                .font(.custom("Jost", size: 20)).fontWeight(.regular)
                                .foregroundColor(Color("DarkPurple"))
                        }.padding()
                    }.listRowBackground(Color("Background"))
                }
                .cornerRadius(25)
            }.padding(.top, UIScreen.main.bounds.width * 0.2)
            
        }.edgesIgnoringSafeArea(.all)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
        .navigationBarItems(trailing:
            Button(action: shareAction){
                Image(systemName: "square.and.arrow.up")
                    .imageScale(.large)
                    .foregroundColor(Color.white)
            }
        )
            .onAppear {
                self.saveTagToCoreData(self.tag.id)
            }
    }
    
    
    func saveTagToCoreData(_ tagId: Int) {
        
        let tempTag = TagViewed(context: self.moc)
        tempTag.id = Int64(tagId)
        
        try? self.moc.save()
    }
    
    private func shareAction() {
        
        let itemToShare = [createShareText()]
        
        let ac = UIActivityViewController(activityItems: itemToShare, applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(ac, animated: true, completion: nil)
    }
    
    private func createShareText() -> String {
        var shareText = ""
        shareText = "\(tag.name)\n\n"
        
        for i in 0..<tag.questions.count {
            shareText += "\(i). \(tag.questions[i])\n"
        }
        
        return shareText
    }
    
    func getImageSize(isWidth: Bool) -> CGFloat {
        var size: CGFloat
        
        if isWidth{
            size = UIScreen.main.bounds.width
        } else {
            size = UIScreen.main.bounds.width * 0.65
        }
        
        return size
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(tag: Tag())
    }
}
