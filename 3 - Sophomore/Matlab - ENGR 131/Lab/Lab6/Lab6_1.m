% Jacob Alspaw
% jaa134
names = {'Harry', 'Xavier', 'Sue'};
verbs = {'loves', 'eats'};
nouns = {'baseballs', 'rocks', 'sushi'};
chosenName = names{randi([length(names)])};
chosenVerb = verbs{randi([length(verbs)])};
chosenNoun = nouns{randi([length(nouns)])};
fprintf('%s %s %s\n', chosenName, chosenVerb, chosenNoun);