//
//  ListCardView.swift
//  ToDos
//
//  Created by Hemant on 30/08/24.
//

import SwiftUI
import SwiftData

struct ListCardView: View {
    @Bindable var reminderList: ReminderList
    @State private var linkIsActive = false
    
    var body: some View {
        NavigationStack {
            Button {
                linkIsActive = true
            } label: {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        listIcon
                        Spacer()
                        Text("\(reminderList.reminder.count)")
                            .font(.system(.title, design: .rounded, weight: .bold))
                            .padding(.trailing)
                    }
                    Text(reminderList.name)
                        .font(.system(.body, design: .rounded, weight: .bold))
                        .foregroundColor(.secondary)
                }
                .padding(5)
                .padding(.horizontal, 5)
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(10)
            }
            .buttonStyle(.plain)
            .navigationDestination(isPresented: $linkIsActive) {
                ReminderListView(reminderList: reminderList)
            }
        }
    }
    
    var listIcon: some View {
        ZStack {
            Circle()
                .frame(width: 27)
            Image(systemName: reminderList.iconName)
                .font(.footnote)
                .foregroundColor(.white)
                .bold()
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ReminderList.self, configurations: config)
        let example = ReminderList(name: "Today", iconName: "sun.max.fill", reminder: [Reminder(name: "Walk the dog")])
        
        return ListCardView(reminderList: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create a model container.")
    }
}
