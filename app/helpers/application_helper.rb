module ApplicationHelper
  def sortable(column, title = nil, occasion_ids=[])
  	direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
  	options = {:sort => column, :direction => direction}
  	options.store(:contact, {:occasion_ids => occasion_ids}) if occasion_ids
  	link_to title, options
  end
end
