//
//  ContentView.swift
//  newWatchApp WatchKit Extension
//
//  Created by Amey Sunu on 19/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var hasStarted: Bool = false
    @State var hours: Int = 00
    @State var minutes: Int = 00
    @State var seconds: Int = 00
    @State var timer: Timer? = nil
    @State var paused: Bool = false
    
    
    var body: some View {
        VStack{
            Text("\(hours):\(minutes):\(seconds)")
                .font(.title)
            
            HStack{
                Button(action:{
                    hasStarted = true
                    paused = false
                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
                        if self.seconds == 59 {
                            self.seconds = 0
                            if self.minutes == 59 {
                                self.minutes = 0
                                self.hours = self.hours + 1
                            } else {
                                self.minutes = self.minutes + 1
                            }
                        } else {
                            self.seconds = self.seconds + 1
                        }
                    }
                }){
                    Text("Start")
                }
                
                Button(action:{
                    hasStarted = false
                    timer?.invalidate()
                    timer = nil
                    hours = 0
                    seconds = 0
                    minutes = 0
                }){
                    Text("Stop")
                        .foregroundColor(.red)
                    
                }
            }
            if hasStarted {
                Button(action:{
                    timer?.invalidate()
                    timer = nil
                    paused.toggle()
                }){
                    if paused {
                        Text("Paused")
                    } else {
                        Text("Pause")
                    }
                }
                .disabled(paused)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
