require 'asciidoctor'
require 'asciidoctor-pdf'

name = 'decline_and_fall'
files = FileList["decline_and_fall.adoc", "volume-1/*"]

task default: :build

task build: [:html, :pdf]
task html: "decline_and_fall.html"
task pdf: "decline_and_fall.pdf"

file "decline_and_fall.html" => files do
  Asciidoctor.convert_file "decline_and_fall.adoc",
    backend: :html,
    header_footer: true,
    safe: :safe
end

file "decline_and_fall.pdf" => files do
  Asciidoctor.convert_file "decline_and_fall.adoc",
    backend: :pdf,
    header_footer: true,
    safe: :safe
end

task :clean do
  sh 'rm -f "decline_and_fall.html" "decline_and_fall.pdf"'
end
