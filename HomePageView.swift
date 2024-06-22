import SwiftUI

struct ContentView: View {
    init() {
        // Customizing tab bar item appearance with green color
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().tintColor = UIColor.green
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    
    }
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SkillsView()
                .tabItem {
                    Label("Skills", systemImage: "book.closed")
                }
            CommunityView()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Community")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.green)
    }
}
struct HomePageView: View {
    @State private var searchText = ""
    @State private var isSearchActive = false
    @State private var nextInterviewDate = Date().addingTimeInterval(86400 * 5)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom navigation bar
                HStack {
                    if isSearchActive {
                        backButton
                    }
                    
                    searchBar
                        .padding(.leading, isSearchActive ? 8 : 0)
                    
                    if isSearchActive {
                        Spacer() // Ensures the search bar stretches to fill the space
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemBackground)) // Match the navigation bar's background
                .animation(.easeInOut, value: isSearchActive)
                
                List {
                    Text("Welcome Back Nicholas!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .listRowSeparator(.hidden)
                    
                    
                    Text("Your next interview is in")
                        .font(.title3)
                        .listRowSeparator(.hidden)
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    CountdownView(targetDate: nextInterviewDate)
                        .padding(.bottom, 12)
                    
                    Text("In Progress")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .listRowSeparator(.hidden)
                    // Modules for skills currently being learned
                    NavigationLink(destination: AccModuleView()) {
                                            ModuleViewStarted(title: "Accounting Technical Interview", imageName: "Accounting", description: "Continue studying for accounting technicals", progress: 0.6)
                                        }
                    NavigationLink(destination: IBModuleView()) {
                            ModuleViewStarted(title: "Investment Banking Basics", imageName: "IB", description: "Explore about the IB industry", progress: 0.1)
                                        }
                    
                        .listRowSeparator(.hidden)
                    Text("Discover")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .listRowSeparator(.hidden)
                    ModuleView(title: "Intermediate Data Science", imageName: "DataSci", description: "Techniques and applications of data science", estimatedTime: "20 hours")
                        .listRowSeparator(.hidden)
                    ModuleView(title: "Intro to Private Equity & Venture Capital", imageName: "CS", description: "Prepare yourself for finance technicals", estimatedTime: "40 hours")
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    var backButton: some View {
        Button(action: {
            // Actions to perform when the back button is tapped
            isSearchActive = false
            searchText = ""
            // Hide the keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.green) // Use your app's accent color
        }
    }
    
    var searchBar: some View {
        TextField("Search Skills...", text: $searchText)
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(30)
            .onTapGesture {
                isSearchActive = true
            }
    }
}


struct SkillsView: View {
    @State private var searchText = ""
    @State private var isSearchActive = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Custom navigation bar
                HStack {
                    if isSearchActive {
                        backButton
                    }
                    
                    searchBar
                        .padding(.leading, isSearchActive ? 8 : 0)
                    
                    if isSearchActive {
                        Spacer() // Ensures the search bar stretches to fill the space
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemBackground)) // Match the navigation bar's background
                .animation(.easeInOut, value: isSearchActive)
                
                List {
                    
                    Text("Your Skills")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .listRowSeparator(.hidden)
                    NavigationLink (destination: AccSkillView()) {
                        SkillModuleStarted(title: "Accounting", skill: "Advanced")
                    }
                    NavigationLink (destination: IBModuleView()) {
                        SkillModuleStarted(title: "Investment Banking", skill: "Intermediate")
                    }
                    
                    NavigationLink (destination: IBModuleView()) {
                        SkillModuleStarted(title: "Data Science", skill: "Beginner")
                    }
                    
                    Text("Learn New Skills")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .listRowSeparator(.hidden)
                    NavigationLink (destination: IBModuleView()) {
                        SkillModuleNew(title: "Quantitative Finance", description: "Learn to use mathematical models and statistical analysis to understand and manage financial risk. Includes areas such as financial engineering, algorithmic trading, and risk management.", relevance: 4)
                    }
                    NavigationLink (destination: IBModuleView()) {
                        SkillModuleNew(title: "Corporate Finance", description: "Learn how businesses make financial decisions, including capital investment, financing, and dividend policy. Involves analyzing and valuing investments, and managing financial resources to maximize shareholder value.", relevance: 4)
                    }
                    NavigationLink (destination: IBModuleView()) {
                        SkillModuleNew(title: "Private Equity and Venture Capital", description: "Learn how to invest in privately held companies or startups with the aim of generating returns for investors. PEVC firms provide capital, strategic advice, and operational support to help these companies grow and succeed.", relevance: 2)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    var backButton: some View {
        Button(action: {
            // Actions to perform when the back button is tapped
            isSearchActive = false
            searchText = ""
            // Hide the keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.green) // Use your app's accent color
        }
    }
    
    var searchBar: some View {
        TextField("Search Skills...", text: $searchText)
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(30)
            .onTapGesture {
                isSearchActive = true
            }
    }
}

struct CommunityView: View {
    let topUsers = [
        LeaderboardEntry(name: "Ethan", level: "Level 5", points: 2500, rank: "229."),
        LeaderboardEntry(name: "You", level: "Level 5", points: 2100, rank: "230."),
        LeaderboardEntry(name: "Bob", level: "Level 5", points: 1900, rank: "231.")
    ]

    var body: some View {
        NavigationView { // This allows content to be scrolled if it exceeds the screen size
            VStack { // Only add padding at the top for the title
                List{
                    Text("Communities")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    NavigationLink (destination: IBModuleView()) {
                        ChatModuleNew(title: "Accounting", preview: "Community of current and aspiring accountants")
                    }
                    
                    NavigationLink (destination: IBModuleView()) {
                        ChatModuleNew(title: "Investment Banking", preview: "Interact with investment bankers around the world")
                    }
                    NavigationLink (destination: IBModuleView()) {
                        ChatModuleNew(title: "Data Science", preview: "Delve deeper into data science with others")
                    }
                    CustomButton(title: "Join Others", action: {})
                    
                    Text("Leaderboard")
                        .font(.title2)
                        .bold()
                        .padding()
                    
                    ForEach(topUsers, id: \.name) { entry in
                        LeaderboardRow(entry: entry)
                            .padding(.horizontal)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true) // Ensure the navigation bar does not add extra space
    }
}


struct LeaderboardRow: View {
    let entry: LeaderboardEntry

    var body: some View {
        HStack {
            Text(entry.rank)
                .font(.title2)
                .bold()
            Circle()
                .fill(Color.gray)
                .frame(width: 50, height: 50)
                .overlay(Text(entry.initials).foregroundColor(.white))
            
            VStack(alignment: .leading) {
                Text(entry.name)
                    .font(.headline)
                Text(entry.level)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Text("\(entry.points)")
        }
        .padding(.vertical, 4)
    }
}

struct LeaderboardEntry {
    let name: String
    let level: String
    let points: Int
    let rank: String
    var initials: String {
        return name.components(separatedBy: " ").map { $0.first.map(String.init) ?? "" }.joined()
    }
}

struct AccountView: View {
    // Placeholder for user data
    @State private var username: String = "John Doe"
    @State private var email: String = "johndoe@gmail.com"
    @State private var notificationsOn: Bool = true

    var body: some View {
        NavigationView {
            List {
                // Profile Header
                VStack(alignment: .leading, spacing: 8) {
                    HStack() {
                        Image(systemName: "person.crop.circle") // Replace "profileImage" with your image name in the assets
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                        VStack(alignment: .leading) {
                            Text(username)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text(email)
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("About me:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("I am a sophomore studying finance in Wharton at the University of Pennsylvania. As a finance enthusiast with a passion for the fast-paced world of investment banking, I am dedicated to understanding and contributing to the dynamic field where strategic decision-making and financial acumen are at the forefront.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(25)
                
                // Account Section
                Section(header: Text("Account").font(.headline)) {
                    NavigationLink(destination: Text("Email settings")) {
                        HStack {
                            Text("Email")
                            Spacer()
                            Text(email).foregroundColor(.gray)
                        }
                    }
                    
                    NavigationLink(destination: Text("Password settings")) {
                        Text("Password")
                    }
                }
                .listRowSeparator(.hidden)
                
                // Preferences Section
                Section(header: Text("Preferences").font(.headline)) {
                    Toggle(isOn: $notificationsOn) {
                        Text("Notifications")
                    }
                }
                .listRowSeparator(.hidden)
                
                // Support Section
                Section(header: Text("Support").font(.headline)) {
                    NavigationLink(destination: Text("Terms of Service")) {
                        Text("Terms of service")
                    }
                    
                    NavigationLink(destination: Text("Privacy Policy")) {
                        Text("Privacy policy")
                    }
                }
                .listRowSeparator(.hidden)
                
                CustomButton(
                    title: "Edit profile",
                    action: {
                        // Placeholder for edit profile action
                    }
                )
                .listRowSeparator(.hidden)
                
                CustomButton(
                    title: "Connect LinkedIn Account",
                    action: {
                        // Placeholder for edit profile action
                    }
                )
                .listRowSeparator(.hidden)
                
                // Logout Button
                CustomButton(
                    title: "Log out",
                    action: {
                        // Placeholder for log out action
                    }
                )
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct CountdownView: View {
    let targetDate: Date
    @State private var timeRemaining: (days: Int, hours: Int, minutes: Int, seconds: Int)?
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Update every second
    
    var body: some View {
        VStack {
            if let timeRemaining = timeRemaining {
                HStack {
                    Group {
                        NumberView(number: timeRemaining.days, unit: "days")
                        NumberView(number: timeRemaining.hours, unit: "hours")
                        NumberView(number: timeRemaining.minutes, unit: "minutes")
                        NumberView(number: timeRemaining.seconds, unit: "seconds")
                    }
                    .padding(.horizontal, 5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor(red: 63/255, green: 140/255, blue: 77/255, alpha: 1)))
                .cornerRadius(12)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
            }
        }
        .onReceive(timer) { _ in
            updateTimeRemaining()
        }
        .onAppear(perform: updateTimeRemaining)
        .padding(.horizontal)
    }
    
    private func updateTimeRemaining() {
        let remaining = targetDate.timeIntervalSinceNow
        if remaining > 0 {
            let days = Int(remaining / 86400)
            let hours = Int((remaining / 3600).truncatingRemainder(dividingBy: 24))
            let minutes = Int((remaining / 60).truncatingRemainder(dividingBy: 60))
            let seconds = Int(remaining.truncatingRemainder(dividingBy: 60))
            timeRemaining = (days, hours, minutes, seconds)
        } else {
            timeRemaining = (0, 0, 0, 0)
            timer.upstream.connect().cancel()
        }
    }
}

struct NumberView: View {
    let number: Int
    let unit: String
    
    var body: some View {
        VStack {
            Text("\(number)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(unit)
                .font(.caption)
                .fontWeight(.regular)
        }
    }
}

struct AccModuleView: View {
    @State private var progressValue: Float = 0.6
    // Add more properties as needed

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Accounting Technical Interview")
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                    .bold()

                Image("Accounting") // Use the actual image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                
                // Progress bar
                HStack{
                    Text("Progress")
                        .font(.headline)
                    Text("\(Int(progressValue * 100))%")
                        .font(.headline)
                        .frame(alignment: .trailing)
                }
                
                ProgressView(value: progressValue, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                
                Text("Current Topic:")
                    .font(.title2)
                    .bold()
                
                Text("Advanced Technical Interview Questions")
                
                HStack {
                    Text("Points:")
                        .bold()
                    Text("200")
                        .foregroundStyle(.green)
                }
                
                Spacer()
                
                NavigationLink(destination: NewView()) { // NewView is the destination view
                                    Text("Continue")
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color(UIColor(red: 231/255, green: 244/255, blue: 237/255, alpha: 1)))
                                        .foregroundColor(Color.black)
                                        .cornerRadius(10)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding()
            }
            .padding()
        }
    }
}

struct QuizQuestion {
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
}

struct NewView: View {
    let quizQuestions: [QuizQuestion] = [
        QuizQuestion(
            question: "Which of the following accounting methods is typically used to account for revenue when it is earned, regardless of when cash is received?",
            answers: ["Cash basis accounting", "Accrual basis accounting", "Modified cash basis accounting", "None of the above"],
            correctAnswerIndex: 1
        )
    ]

    @State private var selectedAnswerIndices = Array(repeating: -1, count: 1)
    @State private var isCorrectAnswersShown = false

    var body: some View {
        VStack {
            Text("Accounting Advanced Technical Questions")
                .font(.title)
                .padding(.top)
                .bold()

            List(0..<quizQuestions.count, id: \.self) { index in
                VStack(alignment: .leading, spacing: 20) {
                    Text(quizQuestions[index].question)
                        .font(.headline)
                        .padding(.vertical, 10)

                    ForEach(0..<quizQuestions[index].answers.count, id: \.self) { answerIndex in
                        Button(action: {
                            selectedAnswerIndices[index] = answerIndex
                        }) {
                            HStack {
                                Image(systemName: selectedAnswerIndices[index] == answerIndex ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(selectedAnswerIndices[index] == answerIndex ? .green : .primary)
                                Text(quizQuestions[index].answers[answerIndex])
                                    .padding()
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                        }
                        .disabled(isCorrectAnswersShown)
                        .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove the button style
                    }
                    
                    CustomButton(title: "Check Answer", action: {})
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(15)
                .padding(.vertical, 10)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}


struct IBModuleView: View {
    @State private var progressValue: Float = 0.1 // Assuming 10% progress
    // Add more properties as needed

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Investment Banking Basics")
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                    .bold()

                Image("IB") // Use the actual image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                
                // Progress bar
                HStack{
                    Text("Progress")
                        .font(.headline)
                    Text("\(Int(progressValue * 100))%")
                        .font(.headline)
                        .frame(alignment: .trailing)
                }
                
                ProgressView(value: progressValue, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                
                Text("Current Topic:")
                    .font(.title2)
                    .bold()
                
                Text("IPOs and M&A")
                
                HStack {
                    Text("Points:")
                        .font(.title3)
                        .bold()
                    Text("50")
                        .foregroundStyle(.green)
                        .font(.title3)
                        .bold()
                }
                
                Spacer()
                

                CustomButton(title: "Continue", action: {})
            }
            .padding()
        }
    }
}

struct AccSkillView: View {
    var body: some View {
        List {
            Text("In Progress")
                .font(.title2)
                .fontWeight(.semibold)
                .listRowSeparator(.hidden)
            // Modules for skills currently being learned
            NavigationLink(destination: AccModuleView()) {
                ModuleViewStarted(title: "Accounting Technical Interview", imageName: "Accounting", description: "Continue studying for accounting technicals", progress: 0.6)
            }
                .listRowSeparator(.hidden)
            Text("Other Accounting Modules")
                .font(.title2)
                .fontWeight(.semibold)
                .listRowSeparator(.hidden)
            ModuleViewCompleted(title: "Basics of Accounting", imageName: "DataSci", description: "Techniques and applications of data science")
                .listRowSeparator(.hidden)
            ModuleViewCompleted(title: "Intermediate Accounting", imageName: "AccInt", description: "Prepare yourself for finance technicals")
                .listRowSeparator(.hidden)
            ModuleViewCompleted(title: "Advanced Topics in Accounting", imageName: "AccountingAd", description: "Prepare yourself for finance technicals")
                .listRowSeparator(.hidden)
            ModuleView(title: "Accounting in Industry", imageName: "IB", description: "Learn about an average day for accountants", estimatedTime: "4 hours")
        }
        .listStyle(PlainListStyle())
        }
}


struct ModuleDetailView: View {
    var title: String
    var description: String
    // Add more properties as needed

    var body: some View {
        // Customize your detailed view layout
        VStack {
            Text(title).font(.title)
            Text(description).font(.body)
            // Add more UI elements as needed
        }
        .padding()
        .navigationBarTitle(title, displayMode: .inline)
    }
}


struct CustomButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(UIColor(red: 231/255, green: 244/255, blue: 237/255, alpha: 1)))
                .foregroundColor(Color.black)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ModuleViewStarted: View {
    var title: String
    var imageName: String
    var description: String
    var progress: Float

    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(title)
                .font(.headline)
                .padding(.vertical, 2)
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Text("Progress: \(Int(progress * 100))%")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle())
                    .padding(.vertical, 4)
            }
        }
        .padding(.vertical)
    }
}


struct ModuleView: View {
    var title: String
    var imageName: String
    var description: String
    var estimatedTime: String

    var body: some View {
        NavigationLink(destination: ModuleDetailView(title: title, description: description)) {
            VStack(alignment: .leading) {
                Image(imageName) // Replace with actual image asset name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(8)
                
                Text(title)
                    .font(.headline)
                    .padding(.vertical, 2)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Estimated Time: " + estimatedTime)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ModuleViewCompleted: View {
    var title: String
    var imageName: String
    var description: String

    var body: some View {
        NavigationLink(destination: ModuleDetailView(title: title, description: description)) {
            VStack(alignment: .leading) {
                Image(imageName) // Replace with actual image asset name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(8)
                
                Text(title)
                    .font(.headline)
                    .padding(.vertical, 2)
                
                Text("Completed")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            .padding(.vertical)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SkillModuleStarted: View {
    var title: String
    var skill: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.vertical, 2)
            
            HStack {
                Text("Skill Level:")
                    .font(.subheadline)
                    .foregroundColor(.green)
                
                ForEach(0..<5) { index in
                    if index < skillLevelIndex(skill) {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .padding(.vertical)
    }
    
    func skillLevelIndex(_ skill: String) -> Int {
        switch skill {
        case "Beginner":
            return 1
        case "Intermediate":
            return 2
        case "Advanced":
            return 4
        case "Expert":
            return 5
        default:
            return 0
        }
    }
}

struct SkillModuleNew: View {
    var title: String
    var description: String
    var relevance: Float

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.vertical, 2)
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Text("Relevance:")
                    .font(.subheadline)
                    .foregroundColor(.green)
                
                ForEach(0..<5) { index in
                    if Float(index) < relevance {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

struct ChatModuleNew: View {
    var title: String
    var preview: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.vertical, 2)
            
            Text(preview)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    ContentView()
}
