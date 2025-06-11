resource "yandex_storage_bucket" "image_bucket" {
  bucket     = "netology-dedyurin"
  access_key = var.access_key
  secret_key = var.secret_key
  acl        = "public-read"
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.image_bucket.bucket
  key    = "image.jpg"
  source = "${path.module}/files/image.jpg"
  acl    = "public-read"
  content_type = "image/jpeg"
}

resource "yandex_kms_symmetric_key" "object_key" {
  name              = "object-storage-key"
  description       = "Key to encrypt files manually before uploading to Object Storage"
  default_algorithm = "AES_256"
#  rotation_period   = "8760h" # 1 год
}