require 'pry'


def dictionary
dictionary = {"hello" => "hi", "to" => "2", "two" => "2", "too" => "2", "for" => "4", "four" => "4", "be" => "b", "you" => "u", "at" => "@", "and" => "&"}
end


# 1) tweet shortener #word_substituter replaces long words with their expected short form
def word_substituter(tweet)

tweet_array = tweet.split(/ /)
dictionary_keys = dictionary.keys
short_tweet_array = []
  tweet_array.each do |x|
    #for every x in array that matches dictionary.key replace with the value
    if dictionary_keys.include?(x.downcase) == true
      # look for x as key and substitute it for the values in short_tweet_array
      short_tweet_array.push(dictionary.values_at(x.downcase))
    else
      short_tweet_array.push(x)
    end
  end
short_tweet_array.flatten!
short_tweet_array.join(" ")

end

#bulk_tweet_shortener shortens each tweet and prints the results
def bulk_tweet_shortener(tweets)
  tweets.each { |x| puts word_substituter(x)}
end

#selective_tweet_shortener shortens tweets that are more than 140 characters
#selective_tweet_shortener does not shorten tweets that are less than 130 characters
def selective_tweet_shortener(tweet)

    if tweet.length <= 140
      tweet
    else
      word_substituter(tweet)
    end
end

#shortened_tweet_truncator truncates tweets over 140 characters after shortening
#shortened_tweet_truncator does not shorten tweets shorter than 140 characters.
#
def shortened_tweet_truncator(tweet)

  if tweet.length <= 140
    tweet
  else
    word_substituter(tweet)[0..136] + "..."
  end
end
