Content-Type: multipart/mixed; boundary="===============2361613037429031044=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 04 Sep 2019 08:53:25 +0200
Message-ID: <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
In-Reply-To: <20190904062716.GC5541@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2361613037429031044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.09.19 um 08:27 schrieb Feng Tang:
>> Thank you for testing. But don't get too excited, because the patch
>> simulates a bug that was present in the original mgag200 code. A
>> significant number of frames are simply skipped. That is apparently the
>> reason why it's faster.
> =

> Thanks for the detailed info, so the original code skips time-consuming
> work inside atomic context on purpose. Is there any space to optmise it?
> If 2 scheduled update worker are handled at almost same time, can one be
> skipped?

To my knowledge, there's only one instance of the worker. Re-scheduling
the worker before a previous instance started, will not create a second
instance. The worker's instance will complete all pending updates. So in
some way, skipping workers already happens.

Best regards
Thomas

> =

> Thanks,
> Feng
> =

>>
>> Best regards
>> Thomas
> _______________________________________________
> dri-devel mailing list
> dri-devel(a)lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============2361613037429031044==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxdlgya0FDZ2tRYUEzQkhWTUwKZWlOSER3Z0FzUXNDNmdYTFkx
TUIvUlpQLzBtS0ZHYjJRb28yNDBsYWtyRTdqRHRRTlorQms1bitWOFBBWUdlYQpyOVRKVE5VZ0x2
NE5iYXdqa2FGS0VlV3RsRlpxLy9FZks2a2ljZlRUclJQL1loWUtabDQ5d3JIWHpVUkt6aVdoCnhW
cUJ3UDBrcHE2eTFsN1A4LzM3ZGF6M1FDc0pkMGxOeUpaNkRQejdwazhaODMxd1YxanlEZ212dG5C
c1l6cFoKQU81TVVGcFJQYXd4cC9kajlEdEFTbC94bHE2aXBjdkJHWVZXejdDeGRnUUY5Y24xTjZi
TVBrY0VzS0hqcVpTbApwNk1hWlhrbXhtbG9nUks3QThHbzROMFR2WEZHNFZkTmFQMzk5OXlnOXA5
NnF5MmxRWTNGVDd0eUx1bjVhMEhSCkFJeEdENmVzK0xmQmZjM0F1bHVsZ25uSnB4K0RSdz09Cj1I
OEpZCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============2361613037429031044==--

