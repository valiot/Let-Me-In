require 'refile/s3'

aws = {
  access_key_id: ENV['AWS_KEY'],
  secret_access_key: ENV['AWS_SECRET'],
  region: 'us-east-1',
  bucket: ENV['S3_BUCKET']
}
Refile.cache = Refile::S3.new(prefix: 'letmein/cache', **aws)
Refile.store = Refile::S3.new(prefix: 'letmein/store', **aws)
