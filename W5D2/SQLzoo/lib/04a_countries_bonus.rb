# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      gdp > (
        SELECT
          MAX(gdp)
        FROM
          countries
        WHERE
          continent = 'Europe'
      )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      c.continent, c.name, c.area
    FROM
      countries c
    JOIN
    (
      SELECT
      continent, MAX(area) AS area
      FROM
      countries
      GROUP BY
      continent
    ) AS max_areas ON
      c.continent = max_areas.continent AND c.area = max_areas.area
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  SELECT 
    candidate.name, candidate.continent
  FROM
    (SELECT
      c.continent, c.name, c.population
    FROM
      countries c
    JOIN
    (SELECT
      continent, MAX(population) AS population
      FROM
      countries
      GROUP BY
      continent
    ) AS max_populations ON
      c.continent = max_populations.continent AND c.population = max_populations.population) AS candidate
    JOIN 
    (SELECT
      c.continent, MAX(c.population) * 3 AS max_neighbor_population
        FROM
          countries c
        LEFT JOIN
        (SELECT
          continent, MAX(population) AS population
          FROM
          countries
          GROUP BY
          continent
        ) AS max_populations ON
          c.continent = max_populations.continent AND c.population = max_populations.population
          WHERE
          max_populations.population IS NULL
          GROUP BY
          c.continent
      ) AS neighbors
      ON candidate.continent = neighbors.continent
    WHERE candidate.population > neighbors.max_neighbor_population

    
  SQL
end





# SELECT
# c.continent, MAX(c.area) AS max_neighbor_area
#   FROM
#     countries c
#   LEFT JOIN
#   (SELECT
#     continent, MAX(area) AS area
#     FROM
#     countries
#     GROUP BY
#     continent
#   ) AS max_areas ON
#     c.continent = max_areas.continent AND c.area = max_areas.area
#     WHERE
#     max_areas.area IS NULL
#     GROUP BY
#     c.continent
    