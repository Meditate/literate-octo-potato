class ApplicationService
  def self.call(*attrs)
    new(*attrs).call
  end
end
