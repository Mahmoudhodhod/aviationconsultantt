class Question {
  final String question;
  final List<String> choices;
  final int correctAnswerIndex;

  Question({
    required this.question,
    required this.choices,
    required this.correctAnswerIndex,
  });
}

List<Question> allQuestions = [
  Question(
    question:
        "Emily: What do you do at the weekends, Yara? Yara: My sister and I ____ going to the cinema",
    choices: ["like", "like to", "want", "want to"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Manager: Where’s Mr Davidson? Assistant: Oh, he’s ____ London today",
    choices: ["in", "on", "to", "at"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Amirah: Do you like cats? Chris: No, but there ____ lots of other animals I like",
    choices: ["is", "be", "are", "was"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Andrew: Where _____ Alicia come from? Martin: I think she’s from the United States",
    choices: ["is", "do", "are", "does"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Teacher: Tell me something about your parents, Lucas. Student: My mother and father ____ both very tall.",
    choices: ["is", "isn't", "aren't", "are"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Ayla: That’s a nice table, Sophie! Is it new? Sophie: Oh no, it’s my ____ old dining table",
    choices: ["mother", "mothers", "mother's", "mothers'"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Emma: What do you do after school? Chloe: I see my friends. Do you visit people, too? Emma: No, I ____ go out",
    choices: ["often", "never", "always", "sometimes"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Katie: Is Charlotte at school today? Laura: No, she ____ . She’s not well today.",
    choices: ["isn't", "aren't", "doesn't", "hasn't"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Alex: I’d like to make a cake. ____ eggs have we got? Andrea: Three, I think. Let me check",
    choices: ["How big", "How much", "How many", "How long"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Ifrah: Which bus goes to the hospital? Antonia: ____ the 236. It stops outside",
    choices: ["Get", "Got", "Gets", "Getting"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Father: Are we ready to go? Daughter: No, Mum can’t find ____ hat.",
    choices: ["it's", "his", "her", "their"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Shop Assistant: Can I help you? Customer: Yes, I’d like to buy ____ trousers",
    choices: ["a", "an", "this", "these"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Mother: Where’s that fish I bought? It was on the table. Daughter: Oh no! The cat ____ it",
    choices: ["eat", "eats", "is eating", "are eating"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Amanda: I like your new sofa. Fahima: Thanks. It’s ____ comfortable than the other one we had.",
    choices: ["too", "very", "much", "more"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Alicia: I’m going to the supermarket. Do you want anything? Peter: Could you get ____ milk, please?",
    choices: ["a", "any", "some", "every"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Karina: When do you want to play football? Aniqa: I ____ to play tomorrow, because I don’t need to go to work",
    choices: ["like", "likes", "liked", "d’like"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Manisha: What did you do at the weekend? Nicola: I ____ tennis with my friend on Saturday",
    choices: ["play", "played", "plays", "playing"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Wife: Have we got any cheese in the fridge? Husband: No, we haven’t. I’m ____ buy some this afternoon",
    choices: ["go", "go to", "going", "going to"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Laura: Where ____ you last Tuesday? I tried to phone you. Beatriz: Oh, I was visiting my grandmother. I didn’t have my phone with me",
    choices: ["were", "was", "are", "is"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Miriam: Are you coming to my party on Tuesday? Brian: I’m really sorry, but I ____ to take my daughter to the airport",
    choices: ["has", "had", "have", "having"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Saif: Why do you like running? Isabella: Because it’s way to keep fit",
    choices: ["best", "better", "the best", "the better"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Anna: Have you lived here a long time? Stefan: Yes, over 40 years. I know ____ of people in this town",
    choices: ["any", "lots", "more", "most"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Josef: Why didn’t you come to the cinema last week? Chloe: I wanted to but I couldn’t. I ____ studying for that test we had on Monday.",
    choices: ["was", "were", "am", "been"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Anna: That bird’s on the garden table again. I think it’s hungry. Juliana: Yes, look! It ____ eat the bread we put there",
    choices: ["is", "will", "goes to", "is going to"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Sophie: How long ____ married? Ying Yue: Two years. I met my husband when I was working in New York.",
    choices: ["had you got", "did you get", "have you been", "are you being"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "David: Have you ____ that new film yet? Susanna: No, I haven’t. We could go on Thursday if you like?",
    choices: ["see", "saw", "seen", "seeing"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Shop Assistant: Excuse me, please. Could I get past? Customer: Oh, I’m sorry. I’m getting in the way, ____ I?",
    choices: ["don't", "aren't", "can't", "haven't"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Wife: Advertising is a big business for musicians. Husband: Yes, musicians ____ a lot of money for writing short pieces of music",
    choices: ["pay", "paid", "are paid", "are paying"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Son: Mum, I’d really like a guitar. Can I have one? Mother: OK, but if we buy one you ____ have to practise playing it",
    choices: ["will", "can", "could", "must"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Juliana: Do you like Brazilian coffee? Miriodere: No I don’t, because it’s ____ strong",
    choices: ["too", "such", "much", "enough"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Matthew: Would you like anything from the shop? Alicia: Yes, I’d like one of ____ celebrity magazines, please",
    choices: [
      "monst recent",
      "more recent",
      "the most recent",
      "the more recent"
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Daughter: Mum, my computer is broken again. I really need a new one. Mother: I ____ buy one if we had the money, but it’s not possible right now",
    choices: ["will", "may", "should", "would"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Mother: ____ you packed your suitcase yet? We’re leaving early tomorrow morning. Son: I’ll do it later. It won’t take long",
    choices: ["Did", "Have", "Will", "Are"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Lucas: Do you play the piano, Natasha? Natasha: Well, I ____ play when I was younger, but I’m not sure I remember now",
    choices: ["can", "can't", "could", "couldn't"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Martina: What did the doctor say about your stomach pains? Padma: He asked me what I ____ for the last two days",
    choices: ["eat", "had eaten", "was eating", "would eat"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Daughter: Everyone has arrived apart from Pamela. Mother: Don’t worry, she phoned me this morning and said she ____ be a bit late",
    choices: ["can", "must", "should", "would"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Vincent: Did you see the weather forecast? It’s going to be extremely hot this weekend. Pauline: I know, I can’t believe it! It ____ since Monday",
    choices: ["rains", "has been raining", "is raining", "was raining"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Ameena: What colour are you going to paint the living room? Charlotte: I ____ probably choose something bright, like yellow",
    choices: ["will", "may", "can", "might"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Victor: I’d love to go back in history to see how people lived hundreds of years ago. Simon: Me too! If I ____ choose, I’d probably travel to ancient Rome.",
    choices: ["can", "will", "could", "would"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Stephen: The concert was fantastic yesterday. You ____ have come. Yuuto: I know. I wanted to, but I had to work late",
    choices: ["must", "could", "ought", "should"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Katie: Would you like to go sightseeing or to the beach this afternoon? Matthew: I don’t mind, I’ll let you decide. Katie: OK, let’s go sightseeing,____ we?",
    choices: ["should", "shall", "might", "would"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Amanda: It said on the news that the president also owns all the national newspapers. Andrew: That ____ be right! I don’t think that’s true",
    choices: ["must", "can't", "won't", "would"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Assistant: That meeting was really difficult. What would you have done if you ____ in my position? Manager: Oh, I think you managed it very well",
    choices: ["are", "were", "had been", "would be"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Natalia: My new smartphone doesn’t seem to work. Katie: Oh dear! Perhaps you should take it ____ and ask fo a refund",
    choices: ["up", "out", "away", "back"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Chris: I wish I could be with our cousins … Alison: Me too! By this time tomorrow they ____ on a Greek beach while we’re revising for our history test",
    choices: [
      "sunbathe",
      "will sunbathe",
      "will be sunbathing",
      "will have sunbathed"
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Son: Are you OK, Mum? You don’t seem very relaxed. Mother: I just wish I ____ an aisle seat so that I could get up and walk around more easily",
    choices: ["had chosen", "have chosen", "would choose", "should choose"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Nicola: I love this picture, but won’t it cost a fortune? Victor: No, it’s just a copy. The original, ____ is a portrait of the artist’s friend, sold for €4 million!",
    choices: ["whose", "which", "whom", "that"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Laura: I can’t believe how talented this artist was. Emily: I know, it’s amazing. ____ he was almost 90 when he did them, his paintings are beautiful",
    choices: ["Since", "Besides", "Although", "Therefore"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Andrea: I want to buy some new shoes for the winter. Shan: Well, I ____ looking for a new pair of boots for weeks,but I can’t find anything I like",
    choices: ["am", "was", "had been", "have been"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Client: I don’t have much money – just enough to ____ .Accountant: Well, let me suggest a way of helping you save more",
    choices: ["get by", "pay off", "do with", "make up"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Pablo: In April next year I ____ here for ten years exactly.Alison: Wow! It really doesn’t seem that long",
    choices: [
      "will live",
      "will be living",
      "am going to live",
      "will have been living"
    ],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Student: Is it true that it took Bell and Watson ages to invent the telephone? Teacher: Yes. When they finally succeeded, they ____ on it for about 30 years",
    choices: [
      "must work",
      "had been working",
      "have worked",
      "would be working"
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Rachel: This would be a lovely place to sit on a dry day.Natasha: Yes, I know. I just wish the rain ____",
    choices: [
      "would stop",
      "has stopped",
      "will have stopped",
      "would be stopping"
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Student: What’s today’s lesson going to be about? Teacher: Today we’re going to learn about a tribe ____ descendants live in Lima, the capital of Peru",
    choices: ["who", "which", "whose", "whom"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Andrea: Did your town have a good market? Katie: Yes. When I was young we ____ there every Saturday looking for bargains",
    choices: ["had gone", "would go", "were going", "had been going"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Daughter: Joanna has been really supportive. I’m so lucky to have her as a friend.Mother: Yes. Just think – if you hadn’t sat next to her in class at school, you ____ so close now",
    choices: ["won't be", "wouldn't be", "wouldn't have been", "aren't"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "David: Did you see the headline this evening? Nicola: Yes ____ the Prime Minister was to resign today",
    choices: ["charged", "argued", "struggled", "forced"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Student: I’m concerned about the chemical test results I’ve just had from the river.Professor: It ____ be a good idea to check the acid levels as well then",
    choices: ["must", "should", "might", "ought"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Aamir: They’ve just announced that our train has been delayed.Laura: That’s annoying. We ____ have rushed to get hereafter all",
    choices: ["needn't", "could", "should", "mustn't"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Liam: So, your Dad’s got a laptop! Cian: Yes, I bought it for him last year – until then he ____ a typewriter!",
    choices: ["used", "has used", "has been using", "had been using"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Isabella: The flight is fully booked, so I won’t be able to go to Barbados next week.Safia: If you ____ the ticket sooner, you’d have found a seat",
    choices: ["had booked", "were booking", "booked", "would have booked"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Receptionist: You ____ taken a taxi to the hotel since you arrived so late. Customer: It was OK, actually. There was a direct bus service from the airport",
    choices: ["will have", "should have", "might have", "would have"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Sophie: Have they finished interviewing for the manager’s position yet? Rafi: No, but they ____ all the candidates by next Friday",
    choices: ["won't see", "would see", "haven't seen", "will have seen"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Athlete: ____ hard I try, I can’t run any faster. Coach: You’ve improved a lot. I wouldn’t worry about it",
    choices: ["Though", "Whereas", "However", "Considering"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Laura: That’s a really beautiful painting. The colours are so vivid.Jeremy: Yes, it’s amazing to think it was lost for years and ____.",
    choices: [
      "must be restored",
      "had to be restored",
      "has been restoring",
      "would be restoring"
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Charlotte: I saw the photos from the film festival. Was that you with the actor from The Hobbit? Niall: Yes, it was! ____ did I imagine I would ever actually meet him",
    choices: ["Not", "Much", "Hardly", "Little"],
    correctAnswerIndex: 3,
  ),
  Question(
    question:
        "Pauline: I hear you got soaked on the golf course this morning.Chris: Yes. I wish I ____ listened to the weather forecast",
    choices: ["had", "have", "would have", "should have"],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Laura: How was the meeting? Ricardo: It finished late because Victor didn’t arrive until 5 pm. He told me he ____ been given the wrong directions",
    choices: ["has", "had", "should", "would have"],
    correctAnswerIndex: 1,
  ),
  Question(
    question:
        "Andrew: I picked up some of that cat food you wanted.Pedro: Oh good. Once ____ to these new cat biscuits, they won’t want to go back to the other stuf",
    choices: [
      "we've switched",
      "we'll be switching",
      "we'll have switched",
      "we've been switched"
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        "Antonia: Has your son done well in his exams? Phillip: Yes. Only once ____ he wasn’t sufficiently prepared,but he can take that one again",
    choices: ["he found", "he has found", "did he find", "could he find"],
    correctAnswerIndex: 2,
  ),
  Question(
    question:
        "Son: I had a bit of a stomach ache this morning.Mother: Oh dear! Well, I did say you ____ eaten that chicken last night",
    choices: [
      "wouldn't have",
      "couldn't have",
      "mustn't have",
      "shouldn't have"
    ],
    correctAnswerIndex: 3,
  ),
];
