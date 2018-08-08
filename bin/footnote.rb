#!/usr/bin/env ruby

ARGV.each do |file|
  chapter = IO.read(file)

  fnrx = /\[Footnote (\d+): ([^\]]*)\]/m
  brackets = {
    "[" => "(",
    "]" => ")"
  }

  notes = {}

  footnotes = chapter.scan(fnrx) { |n, s|
    note = s.gsub(/(\[|\])/m, brackets)
    notes["[#{n}]"] = "footnote:[#{note}]"
  }

  updated = chapter
   .gsub(fnrx, "")
   .gsub(/\[\d+\]/, notes)

  IO.write(file, updated)
end
