import Foundation

// Define a struct to represent a Speaker
// Define a struct to represent a Speaker with bio and sessions
struct Speaker {
    var id: UUID
    var name: String
    var bio: String
    var profileImageURL: URL?
    var sessions: [Session] // Sessions affiliated with this speaker
}


// Define a struct to represent a Session
// Modify Session struct to include speaker information
struct Session {
    var id: UUID
    var title: String
    var description: String
    var startTime: Date
    var endTime: Date
    var isBookmarked: Bool
    var speaker: Speaker // Speaker for this session
}


// Define a struct to represent the Event Schedule
struct EventSchedule {
    var id: UUID
    var eventTitle: String
    var startDate: Date
    var endDate: Date
    var sessions: [Session]
}

// Define a struct to represent an Event
struct Event {
    var id: UUID
    var eventName: String
    var eventDescription: String
    var eventLocation: String
    var schedules: [EventSchedule]
}

