variable "name" {
  type = string
  default = null
  description = "クラスター名を指定する。"
}

variable "node_count" {
  type    = number
  default = 1
  description = "クラスターノード数を指定する。2以上だとautomatic_failoverが有効になる。"
}

variable "node_type" {
  type = string
  default = "cache.t3.micro"
  description = "利用するノードタイプ。インスタンスクラス的なもの"
}

variable "engine_version" {
  type = string
  default = "6.x"
  description = "利用するredisのバージョン"
}

variable "parameter_group_name" {
  type = string
  default = "default.redis6.x"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  type = list(string)
  default = []
  description = "セキュリティグループのidを指定する"
}

variable "subnet_ids" {
  type = list(string)
  default = []
  description = "利用するsubnetのidを指定する"
}
