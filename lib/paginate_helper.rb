module PaginateHelper
  def shouldPaginate?
    !((params[:paginate]=='false') || (params[:source] == 'dropdown') || filter_by_ids?)
  end

  def filter_by_ids?
    params[:filter].present? && params[:filter][:id].present?
  end

  def meta_data(result)
    shouldPaginate? ? { total_pages: result.total_pages,
                        total_count: result.total_entries,
                        current: result.current_page } 
                    : { } 
  end
end
