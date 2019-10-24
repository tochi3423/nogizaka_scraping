require_relative './nogizaka_crawler.rb'
require_relative './nogizaka_parser.rb'
require_relative './common.rb'


class NogizakaLogic

  def initialize
    @crawler = NogizakaCrawler.new
    @parser = NogizakaParser.new
  end

  def main
    @crawler.navigate_to_page
    members_node = @crawler.get_members_node
    members_node.each do |member|
      @crawler.move_to_member_detail(member)
      member_detail_hash = @parser.parse_member_detail(@crawler.html)
      insert_hash(Member,member_detail_hash)
      @crawler.back_to_page
    end
  end

  def record_existing?(class_name, member_hash)
    member_hash = {
      member_name: member_hash["member_name"],
      birthday: member_hash["birthday"],
      blood_type: member_hash["blood_type"],
      constellation: member_hash["constellation"],
      height: member_hash["height"]
    }
    same_record = class_name.find_by(member_hash)
    return same_record.present?
  end

  def insert_hash(class_name, member_hash)
    return if record_existing?(class_name, member_hash)
    class_name.create(member_hash)
  end
end

logic = NogizakaLogic.new
logic.main