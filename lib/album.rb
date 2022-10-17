class Album
  attr_accessor :id, :title, :release_year

  def to_json(_options)
    album_data = {
      id: @id,
      title: @title,
      release_year: @release_year
    }

    return album_data.to_json
  end
end