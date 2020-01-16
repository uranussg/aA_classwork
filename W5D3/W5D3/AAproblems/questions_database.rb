require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db') 
    self.type_translation = true
    self.results_as_hash = true 
  end
end



class Question 
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        * 
      FROM 
        questions 
      WHERE 
        author_id = ?
    SQL
    Question.new(data.first)
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        questions 
      WHERE 
        id = ?
    SQL
    Question.new(data.first)
  end


  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers 
    QuestionFollow.followers_for_question_id(id)
  end

  def likers
    QuestionLike.likers_for_question_id(id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(id)
  end
end



class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT 
        * 
      FROM 
        users
      WHERE 
        fname = ?
        AND 
        lname = ?
    SQL
    User.new(data.first)
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        users
      WHERE 
        id = ?
    SQL

    User.new(data.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT
      AVG(counts) AS num
    FROM  
    (SELECT
        COUNT(user_id) AS counts
      FROM
        (SELECT
          *
        FROM
          questions
        LEFT OUTER JOIN question_likes ON questions.id = question_likes.question_id
        WHERE
          questions.author_id = ?)
      GROUP BY title)
    SQL
    data.first['num']
  end
end



class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        question_follows 
      WHERE 
        user_id = ?
    SQL
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        question_follows 
      WHERE 
        question_id = ?
    SQL
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users
      ON users.id = user_id
      WHERE
        question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions
      ON questions.id = question_id
      WHERE
        user_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions
      ON question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end



class Reply 
  attr_accessor :id, :body, :question_id, :parent_id, :user_id
  
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        id = ?
    SQL
    Reply.new(data.first)
  end
  
  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        question_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
  
  def self.find_by_parent_id(parent_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        parent_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
  
  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
      replies 
      WHERE 
        user_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
  
  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
  end
  
  def question
    Question.find_by_question_id(question_id)
  end

  def author
    User.find_by_id(user_id)
  end

  def parent_reply
    raise "no parent reply" unless parent_id
    Reply.find_by_id(parent_id)
  end
  
  def child_replies
    Reply.find_by_parent_id(id)
  end
end



class QuestionLike
  attr_accessor :id, :question_id, :user_id

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        question_likes 
      WHERE 
        user_id = ?
    SQL
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        question_likes 
      WHERE 
        question_id = ?
    SQL
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        question_likes
      JOIN
        users
      ON
        user_id = users.id
      WHERE 
        question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      COUNT(*) as num
    FROM 
        question_likes
      JOIN
        users
      ON
        user_id = users.id
      WHERE 
        question_id = ?
    SQL
    data.first['num']
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        question_likes
      JOIN
        questions
      ON
        question_id = questions.id
      WHERE 
        user_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_likes
      JOIN
        questions
      ON question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end