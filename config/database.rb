Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure

Sequel::Model.db = case Padrino.env
  when :development
    Sequel.connect("sqlite:///" + Padrino.root('db', "grand_padrino_development.db"),
                   :loggers => [logger])

  when :production
    Sequel.connect("sqlite:///" + Padrino.root('db', "grand_padrino_production.db"),
                   :loggers => [logger])

  when :test
    Sequel.connect("sqlite:///" + Padrino.root('db', "grand_padrino_test.db"),
                   :loggers => [logger])
end
