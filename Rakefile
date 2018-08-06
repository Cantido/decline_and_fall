require 'asciidoctor'
require 'asciidoctor-pdf'

name = 'decline_and_fall'
backends = %w[pdf html]

task default: %W[#{name}.pdf #{name}.html]

backends.each do |backend|
  file "#{name}.#{backend}" => "#{name}.adoc" do
    Asciidoctor.convert_file "#{name}.adoc", backend: backend, to_file: "#{name}.#{backend}"
  end
end
