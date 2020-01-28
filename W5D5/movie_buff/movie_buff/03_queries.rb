def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  # left_movies = Movie
  # those_actors.each do |actor|
  #   left_movies = left_movies.joins(:actors).where("actors.name = ?", actor)
  # end
  # left_movies.select(:id, :title)
  # ret = []
  # all_movies = Movie.all.includes(:actors)
  # all_movies.each do |movie|
  #   names = movie.actors.map { |ac| ac.name }
  #   if those_actors.all? { |actor| names.include?(actor) }
  #     ret << movie
  #   end
  # end
  # ret
  Movie.joins(:actors).where(actors: { name: those_actors}).group(:id).having("COUNT(*) >= ?",  those_actors.length).select(:id, :title)
end

def golden_age
  # Find the decade with the highest average movie score.
  # min = Movie.minimum(:yr) / 10 
  # max = Movie.maximum(:yr) / 10 
  # max_avg = [0, min *10]
  # (min..max).each do |decade|
  #   cur_avg = Movie.where(yr: decade * 10..(decade * 10 + 9)).pluck("AVG(score)").first
  #   if cur_avg > max_avg.first
  #     max_avg = [cur_avg, decade * 10]
  #   end
  # end
  # max_avg.last
  # records = Movie.select(:id, :score, "(yr / 10) AS decade")
  # min = Movie.minimum(:yr) / 10 
  # max = Movie.maximum(:yr) / 10 
  # max_avg = [0, min *10]
  # (min..max).each do |decade|
  #   total_score, total_count = 0, 0
  #   records.each do |record|
  #     if record[0] >= decade * 

  Movie.group("yr/10").order("SUM(score)/COUNT(*) DESC").limit(1).pluck("yr/10 * 10").first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  #subquery
  #ac_movies_id = Movie.joins(:actors).where(actors: {name: name}).pluck(:id)
  #Actor.joins(:movies).where("movies.id IN (?)", ac_movies_id).where.not(name: name).distinct.pluck(:name)
  #nested joins
  Actor
    .joins(movies: :actors)
    .where(name: name)
    .where.not(actors_movies: {name: name}).distinct
    .pluck('actors_movies.name')
  #nested association example
  
  #Category.includes(articles: [{ comments: :guest }, :tags])
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.left_joins(:movies).where("castings.movie_id": nil).count

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  #n = whazzername.chars.map { |char| "[#{char.upcase + char.downcase}]" }
  str = "%" + whazzername.upcase.split("").join("%") + "%"

  Movie.joins(:actors).where("UPPER(actors.name) LIKE (?)", str).distinct
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  # all_movies = Actor.include(:movies)
  # max_career = [[0,nil]]*3
  # Actor.all.each do |actor|
  #   max, min = all_movies.where(name: actor.name).pluck("MAX(yr), MIN(yr)").first
  #   if max - min > max_career.sort_by { |c| c[0] }.first[0]
  #     max_career.shift
  #     max_career.unshift([max - min, actor])
  #   end
  # end

  # max_career

  Actor
    .joins(:movies)
    .group(:id)
    .select("(MAX(movies.yr) - MIN(movies.yr)) AS career", :id, :name)
    .order("(MAX(movies.yr) - MIN(movies.yr)) DESC")
    .limit(3)  


end

# def whatzz(whazzername, name)
#   return true if whazzername.length == 0
#   return false if name.length == 0
#   whazzername.each_char.with_index do |char, idx1|
#     idx2 = name.index(char)
#     if idx2
#       return whatzz(whazzername[idx1+1..-1]. name[idx2+1..-1])
#     else  
#       return false
#     end
#   end
# end
    
