Content-Type: multipart/mixed; boundary="===============3817152742282243963=="
MIME-Version: 1.0
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 4949788ddb ("USB: dummy-hcd: Adapt dummy_udc_set_speed()"): BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 05 Dec 2017 12:59:05 +0200
Message-ID: <871sk9tp8m.fsf@linux.intel.com>
In-Reply-To: <e3c8c471-03ae-565f-f573-6beaa500b829@ti.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3817152742282243963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

Roger Quadros <rogerq@ti.com> writes:
> Felipe,
>
> Are you missing this patch?
> https://lkml.org/lkml/2017/10/31/485

It's in my 'fixes' branch. Somewhere around v4.15-rc4 it should hit
mainline, then I'll rebase testing/next on -rc4.

-- =

balbi

--===============3817152742282243963==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ2dBZEZpRUVsTHpoN3duOTZD
WHdqaDJJekw2NG1lRWFtUVlGQWxvbWUva0FDZ2tRekw2NG1lRWEKbVFiUmp3LytLTUp5UjRLd3lz
cmRJQmpwMzQ4Zk5xSkg3aXRYN2FpSk1HUWhremhxWmN4SS85SWZJSEF3SFFjcAp3eFZWMTAvT1Vv
SVlWeDdUZ2R4YytEOWF6dlV4MUpPREJRMnF5RHJGMVVKTlZoaXZTTzJKV2FpamRnZkFJbm1HCm1Z
MHRaOHJFRXI5TnlOcmk0ZlBsbnhsWGozdXF1M2xaSk5PNVNpZWdGclBxanl6ZnJoM01UOENsczlU
bExKR24KVitPa09Qa0hIQjRwZFJ3TTdUcUhGMXE3UHNEWXp5cEZvTGZZY0JJTnZlMnQzSWxQaVpY
NE8zMVVieXNMQWNDdApOY05XNUVqRkViREk2cDJpb3VxU2tlYXFBQURBejl3THlBY1RTMTBSRzRF
ZDA2aFRyOFdiTGZXelhhSlVGZlJPCkZTRGNhQ0RoVmxZY2ExVXN0SjJSTFdQTlFnNmRLVytuV1po
U1ZYcVNxOHlXRTFLaW9RVkFXdzRvSFpMZjQrcm8KemgxYWxmTUZyRE02c1ZCNnBwb3Q0NkFFMW9K
WTFUK01pMnU0NGN1U0RueDZvQ1p4bTR0am1hMkp3aFlrYWt3bQpLTjUxU2wrRXJVMmJEWGljbzJF
VlU3aWZaTFNLR0o1Yms2dFJjMUpCVlhKdWtVV1ZDSkRpdTkxNEdOclZ1QTgzClRCT1ZueWhBSmRI
RGd6a1lyZjVnWmVLSFB0UE9TQzRBbXZWV2E0SE9DRklReHJvcFRITm1PZTY1Nzh6TTNKck0KOTNz
UkZZYzhmT1BzUmdlODBNZ1UwTTdiVEVJZ1Q0TVVsemgxV2ZvOXEwT29xaXZTQ0h3WjdaMDB2TjVl
bS9Yawp1QmxGd0xXMlVtNHUyRENWMlQvRGx1b0dWZG93SUhPU21abG5XMXJ3TkN3ZmxvbmxZSUE9
Cj1VdzJMCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============3817152742282243963==--

