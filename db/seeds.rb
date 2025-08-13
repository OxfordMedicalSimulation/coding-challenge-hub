u1 = User.create!(email: "alice@example.com", first_name: "Alice", last_name: "Doe", password: "not_very_secret")
u2 = User.create!(email: "bob@example.com", first_name: "Bob", last_name: "Doe", password: "please_ignore_me")

s1 = Scenario.create!(title: "Sepsis Recognition", description: "Identify and treat sepsis", modality: "desktop", created_at: Time.current - 1.hours, updated_at: Time.current - 1.hours)
s2 = Scenario.create!(title: "Airway Management", description: "Manage difficult airway", modality: "vr", created_at: Time.current - 2.hours, updated_at: Time.current - 2.hours)

ps1 = PlaySession.create!(user: u1, scenario: s1, started_at: Time.current - 2.hours, ended_at: Time.current - 1.hour)
ps1.create_feedback!(score: 72, notes: "Missed fluids")

ps2 = PlaySession.create!(user: u1, scenario: s2, started_at: Time.current - 3.hours, ended_at: Time.current - 2.hours)
ps2.create_feedback!(score: 88, notes: "Good recovery")

ps3 = PlaySession.create!(user: u2, scenario: s2, started_at: Time.current - 5.hours, ended_at: Time.current - 4.hours)
ps3.create_feedback!(score: 65, notes: "Late intubation")
