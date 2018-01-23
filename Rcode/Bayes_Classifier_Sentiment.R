#Sentiment analysis with Naïve Bayes Classifier in R
#載入套件
library(e1071)

#正面情感
pos_tweets =  rbind(
  c('I love this car', 'positive'),
  c('This view is amazing', 'positive'),
  c('I feel great this morning', 'positive'),
  c('I am so excited about the concert', 'positive'),
  c('He is my best friend', 'positive')
)

#負面情感
neg_tweets = rbind(
  c('I do not like this car', 'negative'),
  c('This view is horrible', 'negative'),
  c('I feel tired this morning', 'negative'),
  c('I am not looking forward to the concert', 'negative'),
  c('He is my enemy', 'negative')
)

#用來測試模型的數據
test_tweets = rbind(
  c('feel happy this morning', 'positive'),
  c('larry friend', 'positive'),
  c('not like that man', 'negative'),
  c('house not great', 'negative'),
  c('your song annoying', 'negative')
)

tweets = rbind(pos_tweets, neg_tweets, test_tweets)

# 建構一個DocumentTermMatrix矩陣
matrix= create_matrix(tweets[,1], language="english", 
                      removeStopwords=FALSE, removeNumbers=TRUE, 
                      stemWords=FALSE) 

#因為我們使用create_matrix，所以他會是一個"DocumentTermMatrix"/"simple_triplet_matrix"，所以我們要轉換矩陣
mat = as.matrix(matrix)

#mat[1:10,]這一個指令是將正負面的情感作為訓練集，as.factor(tweets[1:10,2])是顯示正負情感分類
classifier = naiveBayes(mat[1:10,], as.factor(tweets[1:10,2]) )


# 建利好模型開始預測，mat[11:15,]這一段指令就是，我們在前面預測要測試的數據集
predicted = predict(classifier, mat[11:15,])
predicted

#測試結果跟準確度
table(tweets[11:15, 2], predicted)
recall_accuracy(tweets[11:15, 2], predicted)

