class Throw::Creator < ApplicationService
  def initialize(attributes)
    @attributes = attributes
  end

  def call
    handle_presentation

    throw_instance.save!
  end

  # can't use name 'throw' here, since 'throw' reserved by ruby

  def throw_instance
    @throw_instance ||= Throw.new(@attributes)
  end

  private

  def handle_presentation
    throw_instance.presentation = throw_instance.score
  end
end

