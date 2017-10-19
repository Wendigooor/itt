class IpListService

  attr_reader :results

  def initialize
    @results = []
  end

  def perform
    sql = "
        SELECT t1.ip AS ip, string_agg((t2.login), ',') AS logins
        FROM posts AS t1
        JOIN users AS t2 ON t1.user_id = t2.id
        GROUP BY t1.ip
        HAVING COUNT(t1.ip) > 1
      "

    ActiveRecord::Base.connection.execute(sql).each do |row|
      @results << { ip: row['ip'], logins: row['logins'].split(',') }
    end
  end

end
