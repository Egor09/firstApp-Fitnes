//
//  WorkoutModel.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 23.04.2022.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknow"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
    @Persisted var workoutStatus: Bool = false
}


//class LocalOnlyQsTask: Object {
//    @Persisted var name: String = ""
//    @Persisted var owner: String?
//    @Persisted var status: String = ""
//    convenience init(name: String) {
//        self.init()
//        self.name = name
//    }
//}
