class RubyEnv

  def self.bundler?(project_path)
    Gem.available?("bundler") && File.exists?("#{project_path}/Gemfile")
  end

  def self.ruby_command(project_path, opts = {})
    ruby_interpeter = opts[:ruby_interpeter] || "ruby"

    if opts[:script] && File.exists?("#{project_path}/#{opts[:script]}")
      command = opts[:script]
    elsif opts[:bin]
      command = opts[:bin]
    else
      command = ruby_interpeter
    end

    if bundler?(project_path)
      "#{ruby_interpeter} -S bundle exec #{command}"
    else
      "#{ruby_interpeter} -S #{command}"
    end
  end

end
