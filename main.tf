terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

resource "random_id" "test1" {
  byte_length = 8
}

resource "time_sleep" "wait1" {
  create_duration = "3s"
  depends_on = [random_id.test1]
}

resource "random_string" "test1" {
  length  = 16
  special = true
  depends_on = [time_sleep.wait1]
}

resource "time_sleep" "wait2" {
  create_duration = "3s"
  depends_on = [random_string.test1]
}

resource "random_id" "test2" {
  byte_length = 12
  depends_on = [time_sleep.wait2]
}

resource "time_sleep" "wait3" {
  create_duration = "3s"
  depends_on = [random_id.test2]
}

resource "random_string" "test2" {
  length  = 20
  special = false
  depends_on = [time_sleep.wait3]
}

resource "time_sleep" "wait4" {
  create_duration = "3s"
  depends_on = [random_string.test2]
}

resource "random_id" "test3" {
  byte_length = 6
  depends_on = [time_sleep.wait4]
}

resource "time_sleep" "wait5" {
  create_duration = "3s"
  depends_on = [random_id.test3]
}

resource "random_string" "test3" {
  length  = 12
  special = true
  upper   = false
  depends_on = [time_sleep.wait5]
}

resource "time_sleep" "wait6" {
  create_duration = "3s"
  depends_on = [random_string.test3]
}

resource "random_id" "test4" {
  byte_length = 10
  depends_on = [time_sleep.wait6]
}

resource "time_sleep" "wait7" {
  create_duration = "3s"
  depends_on = [random_id.test4]
}

resource "random_string" "test4" {
  length  = 24
  special = false
  numeric = false
  depends_on = [time_sleep.wait7]
}

output "random_id_1" {
  value = random_id.test1.hex
}

output "random_string_1" {
  value = random_string.test1.result
}

output "random_id_2" {
  value = random_id.test2.hex
}

output "random_string_2" {
  value = random_string.test2.result
}

output "random_id_3" {
  value = random_id.test3.hex
}

output "random_string_3" {
  value = random_string.test3.result
}

output "random_id_4" {
  value = random_id.test4.hex
}

output "random_string_4" {
  value = random_string.test4.result
}

output "timestamp" {
  value = timestamp()
}