defmodule PastimeWeb.ManagerView do
  use PastimeWeb, :view

  def month_day_year(year, month, day) do
    date = Date.new!(year, month, day)
    Calendar.strftime(date, "%B %d, %Y")
  end
end
