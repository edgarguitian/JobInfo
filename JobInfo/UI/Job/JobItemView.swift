//
//  JobItemView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 22/12/24.
//

import SwiftUI

struct JobItemView: View {
    let job: Job
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                // Company Logo
                AsyncImage(url: URL(string: job.company.logo)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                } placeholder: {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                        .overlay(ProgressView())
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    // Job Info Rows
                    JobInfoRow(label: "Name", value: job.company.name.utf8Decoded)
                    JobInfoRow(label: "Title", value: job.title.utf8Decoded)
                    
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                JobInfoRow(label: "Location", value: formattedLocation())
                if let type = job.types.first?.name {
                    JobInfoRow(label: "Type", value: type)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
    
    // Helper Function to Format Location
    private func formattedLocation() -> String {
        var location = job.location.utf8Decoded
        if let country = job.countries.first?.name {
            location += ", \(country)"
        }
        return location
    }
}

// Reusable Row Component
struct JobInfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .font(.caption)
                .fontWeight(.bold)
            Text(value)
                .font(.caption)
                .lineLimit(2)
                .truncationMode(.tail)
        }
    }
}

#Preview {
    let job = Job(company: Company(name: "ROSENGARTEN",
                                   logo: "https://jobdataapi.com/media/company/logo/24/09/logo_img_oaBQdH7.png",
                                   websiteURL: "https://www.rosengarten-tierbestattung.de/",
                                   linkedinURL: "https://www.linkedin.com/company/rosengartengmbh/",
                                   twitterHandle: nil,
                                   githubURL: nil,
                                   isAgency: false),
                  title: "Quereinsteiger (m/w/d) Tierbestatter HunsrÃ¼ck",
                  location: "Filiale HunsrÃ¼ck",
                  types: [Region(name: "Full Time")],
                  cities: [],
                  countries: [Country(name: "Germany",
                                      region: Region(name: "Europe"))],
                  regions: [Region(name: "Europe")],
                  hasRemote: false,
                  published: Date(),
                  description: "<h3>Mehr als ein Job.</h3>\n<span>WertschÃ¤tzung - Herausforderung - Vertrauen<br/></span>\n<h3>Arbeitgeber mit Herz</h3>\n<h3><span>.. und Ã¼berdurchschnittlich vielen Benefits!</span></h3>\n<h3>Das erwartet dich:</h3>\n<h3><span>\"Die groÃŸe Gabe des Menschen ist die FÃ¤higkeit zur Empathie.\" (Meryl Streep)</span></h3><ul><li>Als Erstkontakt <strong>berÃ¤tst du Tierhalter feinfÃ¼hlig</strong> zu unserer sehr besonderen Dienstleistung und nimmst <strong>verstÃ¤ndnisvoll ihre WÃ¼nsche entgegen</strong>.</li><li>Du <strong>begleitest</strong> die Tierhalter in ihrer <strong>Trauer- und Abschiedssituation</strong> und Ã¼berfÃ¼hrst anschlieÃŸend ihren verstorbenen Liebling aus dem Privathaushalt in unsere Filiale. Auch Abholungen aus der Tierarztpraxis ohne Tierhalterkontakt gehÃ¶ren zum Tagesablauf.</li><li>Die TÃ¤tigkeiten in der Filiale umfassen zudem die <strong>AuftragsprotokollierungÂ </strong>in unserem System, die <strong>OrganisationÂ </strong>der Lagerung von Urnen und Aschen sowie die Terminvergaben zur Abholung. DarÃ¼ber hinaus gehÃ¶ren die<strong>Â telefonische Beratung</strong> und <strong>BetreuungÂ </strong>der Tierhalter zu deinen Aufgaben.</li><li>Wir arbeiten in einem <strong>mitarbeiterfreundlichen Schichtmodell</strong> und <strong>wechselnden Rufbereitschaften</strong>, um bestmÃ¶glich fÃ¼r die Tierhalter da zu sein.</li></ul>\n<h3>Das bieten wir Dir:</h3>\n<ul><li>Ein <strong>familiÃ¤res Arbeitsumfeld</strong> mit<strong>Â offener Kommunikationskultur</strong> und MÃ¶glichkeiten zur Mitgestaltung.</li><li>Eine umfassende Einarbeitung, die mit dem Erwerb eines in Deutschland einzigartigen <strong>IHK-Zertifikats zum/zur Tierbestatter/in</strong> abgeschlossen wird.</li><li><strong>Kontinuierliche Weiterbildungs- und WeiterentwicklungsmÃ¶glichkeiten</strong> mit interessanten beruflichen Perspektiven.</li><li>Einen <strong>modernen Arbeitsplatz</strong>, an den Du gerne <strong>Deinen Hund</strong> mitbringen kannst.</li><li><strong>Mitarbeiterevents,</strong> betriebliche Altersvorsorge, Hansefit, <strong>Fahrradleasing</strong>, PrÃ¤mienauszahlungen (Immobilienvermittlung, Mitarbeiter:innen werben Mitarbeiter:innen),<strong>Â Rabatte Ã¼ber Corporate Benefits.</strong></li><li>Zum Einstieg bekommst du 28 Urlaubstage, ab dem zweiten Anstellungsjahr erhÃ¶hen wir deinen Urlaubsanspruch auf <strong>30 Tage</strong> und du erhÃ¤lst ein <strong>Weihnachtsgeld</strong>.</li><li>FÃ¼r die Abholung bei unseren Kunden stellen wir Dir selbstverstÃ¤ndlich ein <strong>FahrzeugÂ </strong>und <strong>ArbeitskleidungÂ </strong>zur VerfÃ¼gung.</li></ul>\n<h3>Das Ã¼berzeugt uns:</h3>\n<ul><li><strong>Tierliebe</strong> und <strong>Empathie</strong> im Umgang mit trauernden Tierhaltern stehen bei uns an erster Stelle.</li><li>Deine Arbeitsweise ist geprÃ¤gt von Struktur und SelbststÃ¤ndigkeit.</li><li>Du besitzt den<strong>Â FÃ¼hrerschein</strong> der <strong>Klasse B</strong>.</li><li>Dein <strong>freundliches Auftreten</strong> zeichnet sich aus durch<strong>Â gute Umgangsformen</strong> und ein<strong>Â gepflegtes Erscheinungsbild.</strong></li><li>Quereinsteiger/innen sind willkommen! Gerne kommst Du aus einem Beruf mit Dienstleistungscharakter oder hast bereits im (tier-)medizinischem Arbeitsumfeld gearbeitet.</li></ul>\n<h3>Match? Na also, worauf wartest du?</h3>\n<h3><span>â€žWer nichts fÃ¼r andere tut, tut nichts fÃ¼r sich.â€œ (Johann Wolfgang von Goethe)</span></h3><span>Wir freuen uns darauf, mehr Ã¼ber dich erfahren zu dÃ¼rfen!</span>",
                  experienceLevel: "EN",
                  applicationURL: "https://rosengarten-gmbh.jobs.personio.de/job/1884652",
                  language: "de",
                  salaryMin: "5000",
                  salaryMax: "10000",
                  salaryCurrency: "EUR")
    List {
        JobItemView(job: job)
        JobItemView(job: job)
        JobItemView(job: job)
        JobItemView(job: job)
        
    }
}
