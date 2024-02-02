# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Meteor.Repo.insert!(%Meteor.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Meteor.Repo.insert!(%Meteor.Skills.Skill{
#   category: "distress_tolerance",
#   description: "accept what is",
#   name: "radical acceptance"
# })

# Meteor.Repo.insert!(%Meteor.Skills.Skill{
#   category: "distress_tolerance",
#   description: "engage all your senses",
#   name: "self soothe"
# })

# Meteor.Repo.insert!(%Meteor.Skills.Skill{
#   category: "mindfulness",
#   description: "balance your emotion mind and rational mind",
#   name: "wise mind"
# })

Meteor.Repo.insert!(%Meteor.Diary.DiaryEntry{
  anger: 1,
  drug_use: 2,
  entry_date: ~D[2023-02-12],
  fear: 2,
  joy: 2,
  pain: 4,
  sadness: 3,
  self_harm: 0,
  shame: 2,
  suicide: 2,
  user_id: 1
})


Meteor.Repo.insert!(%Meteor.DiaryEntry.DiaryEntrySkill{
  diary_entry_id: 1,
  skill_id: 1
})
