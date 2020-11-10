//
//  BidenTickerWidget.swift
//  BidenTickerWidget
//
//  Created by Lucas Desouza on 11/9/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct BidenTickerWidgetEntryView : View {

    var body: some View {
        ZStack {
            Image("bgsm").resizable()
            Ticker(short: true)
        }
    }
}

@main
struct BidenTickerWidget: Widget {
    let kind: String = "PresidentInaugurationTimerWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { _ in
            BidenTickerWidgetEntryView()
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}


struct BidenTickerWidget_Previews: PreviewProvider {
    static var previews: some View {
        BidenTickerWidgetEntryView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
