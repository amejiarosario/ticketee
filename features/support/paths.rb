module NavigationHelpers
  def path_to(webpage)
    case webpage
    when /homepage/
      '/'
    end
  end
end