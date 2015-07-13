class Feature::Filter
  def self.build_filters(attributes)
    attributes.map { |name, options| class_for(name).new(options) }
  end

  def self.class_for(filter_name)
    "#{name}/#{filter_name}".classify.constantize
  end
  private_class_method :class_for

  def initialize(attributes)
    @attributes = attributes
  end

  def entries
    raise NotImplementedError
  end

  def ids
    raise NotImplementedError
  end

  private

  def source
    raise NotImplementedError
  end
end
