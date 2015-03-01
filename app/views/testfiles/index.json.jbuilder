json.array!(@testfiles) do |testfile|
  json.extract! testfile, :id, :filename, :content_type, :file_contents, :confidence_rank
  json.url testfile_url(testfile, format: :json)
end
