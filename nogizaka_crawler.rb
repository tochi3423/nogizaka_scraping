require_relative './selenium_helper.rb'
require_relative './common.rb'

class NogizakaCrawler < SeleniumHelper

  def initialize
    super
  end

  def navigate_to_page
    @session.navigate.to "http://www.nogizaka46.com/member/"
    sleep_designated
  end

  def get_members_node
    doc = Nokogiri::HTML.parse(html, nil, "UTF-8")
    members_node = doc.css("div.unit > a")
    return members_node
  end

  def move_to_member_detail(member_node)
    query_click(member_node.css_path)
    sleep_designated
  end

  def back_to_page
    @session.navigate.back
  end

end