module KaminariHelper
  extend self
  def pagination_meta(obj)
    {
      total_pages: obj.total_pages,
      current_page: obj.current_page,
      next_page: obj.next_page,
      prev_page: obj.prev_page,
      first_page?: obj.first_page?,
      last_page?: obj.last_page?,
      out_of_range?: obj.out_of_range?,
    }
  end
end
