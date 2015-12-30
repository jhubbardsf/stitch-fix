module ItemsHelper
  def clothing_select
    clothings = Clothing.all
    array = []
    clothings.each do |clothing|
      array << [clothing.name, clothing.id]
    end
    array
  end
end
