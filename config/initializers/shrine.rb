require "shrine/storage/s3"
require "shrine/storage/file_system"


s3_options = {
  access_key_id:      ENV['ACCESS_KEY_ID'],
  secret_access_key:  ENV['SECRET_ACCESS_KEY'],
  region:             ENV['BUCKET_REGION'],
  bucket:             ENV['BUCKET_NAME'],
  endpoint:           ENV["AWS_HOST"],
}


Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: {acl: "public-read"}, **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", upload_options: {acl: "public-read"}, **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :direct_upload
Shrine.plugin :restore_cached_data
Shrine.plugin :cached_attachment_data # for forms
