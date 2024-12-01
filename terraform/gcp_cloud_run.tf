# SPDX-FileCopyrightText: 2023 DE:AD:10:C5 <franklin@dead10c5.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

/*
resource "google_cloud_run_service" "default" {
  name     = "${prefix}-resume"
  location = var.region


  template {
    spec {
      containers {
        image = "ghcr.io/devsecfranklin/franklin-resume"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
*/
