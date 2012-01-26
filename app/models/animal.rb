class Animal
  attr_accessor :name, :taxonomy, :order, :family

  def initialize(attrs)
    self.name = attrs[:name]
    self.taxonomy = attrs[:taxonomy]
    self.order = attrs[:order]
    self.family = attrs[:family]
  end

  def method_with_db_access
    'some data from DB'
  end
end