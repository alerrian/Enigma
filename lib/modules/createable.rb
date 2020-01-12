module Createable
  def create_hash(data_type)
    data_type.each_with_index.inject({}) do |acc, (element, index)|
      acc[(65+index).chr] = element
      acc
    end
  end
end