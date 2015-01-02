module MigrationHelpers

  def foreign_key(from_table, from_column, to_table, to_column='id')
    execute(%(alter table #{from_table} add constraint #{constraint(from_table, from_column)} foreign key (#{from_column}) references #{to_table}(#{to_column})))
  end

  def drop_foreign_key(table, column)
    execute(%(alter table #{table} drop constraint #{constraint(table, column)}))
  end

  def constraint(table, column)
    "#{table}_#{column}_fkey"
  end
end
