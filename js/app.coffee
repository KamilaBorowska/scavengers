---
---

replaceComma = (text) ->
  commaLookalike = "\u201A"
  text.replace /,/g, commaLookalike

toId = (text) ->
  text.toLowerCase().replace /[^a-z0-9]/g, ""

class Question
  toText: ->
    "#{replaceComma @question or ""}, #{toId @answer or ""}"


angular.module 'scavengerApp', []
.controller 'ScavengerController', ->
  @questions = (new Question for [1..3])
  @questionsToText = ->
    (question.toText() for question in @questions).join(", ")

  @answersToSolution = ->
    (question.answer or "" for question in @questions).join(", ")

  @questionsToSolution = ->
    ("#{i + 1}) #{question.question or ""}" for question, i in @questions).join("\n")
