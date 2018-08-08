#!/usr/bin/env ruby

ARGV.each do |file|
  chapter = IO.read(file)

  updated = chapter
    .gsub(/(?<=[[:space:]])"(?=[[:graph:]])/, '{ldquo}')
    .gsub(/(?<=[[:graph:]])"(?=[[:space:]])/, '{rdquo}')
    .gsub(/(?<=[[:space:]])'(?=[[:graph:]])/, '{lsquo}')
    .gsub(/(?<=[[:graph:]])'(?=[[:space:]])/, '{rsquo}')
    .gsub(/(?<=[[:graph:]])'(?=[[:graph:]])/, '{apos}')
    .gsub(/(?<=[[:digit:]])--(?=[[:digit:]])/, '{endash}')
    .gsub(/(?<=[[:digit:]])-(?=[[:digit:]])/, '{endash}')
    .gsub(/--/, '{emdash}')

  IO.write(file, updated)
end
