module ApplicationHelper
  def industries
  ["Government/Regulator", "Water/Wastewater", "Transportation", "High-rise/Residential/Commercial", "Manufacturing", "Aviation and Aerospace", "Telecommunication", "Energy", "Agriculture", "Construction", "Unlisted"]
  end
  
  def disciplines
    ["Unlisted", "Architecture", "Agricultural Engineering", "Architectural Engineering", "Biological Engineering","Chemical Engineering", "Civil Engineering", "Control Systems Engineering", "Electrical and Computer Engineering", "Environmental Engineering", "Fire Protection Engineering", "Industrial and Systems Engineering", "Mechanical Engineering", "Metallurgical and Materials Engineering", "Mining and Mineral Processing Engineering", "Naval Architecture and Marine Engineering", "Nuclear Engineering", "Petroleum Engineering", "Software Engineering", "Structural Engineering"]
  end
  def guide_tabs
    ["Design Summary","Regulations","Drawing Details","Specifications","Scheduling","Cost Estimating","Product/Suppliers","Other Resources"]
  end
  
  def csi_sections
  ["Unlisted", "","00 00 00","01 00 00"]
  end
end
