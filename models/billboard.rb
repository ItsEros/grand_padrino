class Billboard < Sequel::Model(:billboards)
  # Instance Methods
  # Aggregate week columns as single value                                      {{{
  # -------------------------------------------------------------------------------
  def weeks_as_hash
    values_from_weeks.each.with_index.inject({}) do |m,(v,i)|
      m[(i + 1).humanize.to_sym] = v
      m
    end
  end

  # }}}
  # Return highest position in charts over the ten week period                  {{{
  # -------------------------------------------------------------------------------
  def highest_spot
    values_from_weeks.max
  end

  # }}}
  # Return lowest position in charts over the ten week period                   {{{
  # -------------------------------------------------------------------------------
  def lowest_spot
    values_from_weeks.min
  end

  # }}}
  # Human readable                                                              {{{
  # -------------------------------------------------------------------------------
  def human_readable
    to_hash.except(*week_columns).merge(:weeks => weeks_as_hash)
  end

  # }}}

  private
  # List all columns pertaining to weeks                                        {{{
  # -------------------------------------------------------------------------------
  def week_columns
    self.class.columns.select do |c|
      c =~ /^week_/
    end
  end

  # }}}
  # List all chart positions stored                                             {{{
  # -------------------------------------------------------------------------------
  def values_from_weeks
    week_columns.map do |wc|
      send(wc)
    end.compact
  end

  # }}}
end
