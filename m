Content-Type: multipart/mixed; boundary="===============4377794128443693848=="
MIME-Version: 1.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: WARNING: CPU: 1 PID: 185 at drivers/gpu/drm/i915/intel_display.c:14422 intel_modeset_init+0x3dc/0xf60 [i915]
Date: Thu, 30 Nov 2017 14:56:10 +0100
Message-ID: <98d7dffa-6b9e-b9b7-549f-b938bc3a01f7@linux.intel.com>
In-Reply-To: <20171130131507.gavb7kjqpjlezfgk@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4377794128443693848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Op 30-11-17 om 14:15 schreef Fengguang Wu:
> Hello,
>
> This happens in mainline kernel v4.15-rc1 on LENOVO IdeaPad U410.
> It at least dates back to v4.11 .
>
> It occurs in 72 out of 72 boots.
Can I get a boot log with drm.debug=3D0x1f? I don't have enough information=
 to see what's going on. :)

~Maarten

--===============4377794128443693848==--

