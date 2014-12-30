# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController
  def index
    change_pattern
  end

  def change_pattern
    letter = (65..90).to_a.sample.chr
    subletter = [(97..122).to_a.sample.chr, ""].sample
    page._pattern = %w[ik assen].map{ |l| letter + subletter + l }.join(" ")
  end

  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
