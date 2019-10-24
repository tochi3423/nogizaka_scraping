class NogizakaParser
  def parse_member_detail(html)
    doc = Nokogiri::HTML.parse(html, nil, "UTF-8")
    member_detail_hash = {}
    member_detail_hash["member_name"] = doc.css("div.txt h2").text
    doc.css("div.txt > dl > dd").each_with_index do |member_profile, index|
      case index
      when 0
        member_detail_hash["birthday"] = member_profile.text
      when 1
        member_detail_hash["blood_type"] = member_profile.text
      when 2
        member_detail_hash["constellation"] = member_profile.text
      when 3
        member_detail_hash["height"] = member_profile.text
      end
    end
    return member_detail_hash
  end
end