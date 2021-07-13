
provider "google" {
  version = "3.5.0"

  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name         = var.dev
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.machine_image
      type  = var.disk_type
      size  = var.disk_size
    }
  }

  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  metadata_startup_script = file(var.startup_script)
  metadata = {
    ssh-keys = "${var.application_user}:${file("userkey.txt")}" 
  }


  network_interface {
    network = "default"
    access_config {
    }
  }

}

  output "google_compute_instance" {
  value = google_compute_instance.vm_instance.ipv4_address
}

resource "google_compute_instance" "vm_instance1" {
  name         =  var.qa
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.machine_image
      type  = var.disk_type
      size  = var.disk_size
    }
  }

  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  metadata_startup_script = file(var.startup_script)
  metadata = {
    ssh-keys = "${var.application_user}:${file("userkey.txt")}"
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

