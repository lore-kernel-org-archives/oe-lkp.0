Content-Type: multipart/mixed; boundary="===============1132945157854162471=="
MIME-Version: 1.0
From: Wolfram Sang <wsa@the-dreams.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] Revert "i2c: dev: switch from register_chrdev to cdev API"
Date: Sat, 28 May 2016 18:04:58 +0200
Message-ID: <20160528160458.GA1614@katana>
In-Reply-To: <20160528091559.GR11011@mwanda>
List-Id: <oe-lkp.lists.linux.dev>

--===============1132945157854162471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> These kinds of use after frees don't always cause a runtime problem.  I
> found it using static analysis, but I bet you could detect it if you
> enabled kasan.  The other option is to enable PAGE_POISONING?

Thanks, PAGE_POISONING did trigger the issue. So, I now picked up your
patch instead of the revert because I could verify the problem and the
proper solution. Thanks again.

What I still wonder: Which analysis reported the problem to you? I
always run sparse, smatch, cppcheck, and coccicheck on the patches when
applying and no-one reported the issue.

   Wolfram


--===============1132945157854162471==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSlhTY0dwQUFvSkVCUU41TXdVb0NtMk9uMFAvQWtBREdCbUcvMnVXa1Z2WStmUGFnNGkK
TGM5c2kwY0J4SkZOME91Y3JKL1FBYkVQR1U3elg4czhqUi9wZVBXQ0JnOTc2SWRKM21MajJDN1Qr
UlFYWEVHTwpwU3hrSlMwRUdtak5aQy9lNmhVT3hubmcrS1pDMEhNN3ZDK281UWkxSlZiUzhDbEpN
OGJaRXZ0dlNIVklmR2VhCkhaRzcxM0NkaFFmaUQ2dFJ5RGpTOWp4L29BcysweVo2ei80MHE5WXp2
RVA2bEtkWWoxRVpRNHNyUlM5WXFlMkMKU0FpM2kyOXE0OHBTMWdCQ20rTktUWHlsWHJvekNQQWJv
dVdGN3lkeHBnaVo0VWxTcUVnbW5BaEFCRzhkQW1rVgo2YVJ2dDRxWEwrcEtBbVNuZWcrcktBMVlF
dVpTL2Rad1kvdnI2U0wvSGNsdTduc3hkMFBkWnhEbFBPU1FXcTZpCmt0WTYyVHZHc005ZVhwdWFD
WDM1eFlJalNXNW80UTBhM3VqN054dkhMaU1CSzdOcTM3aFA2K1hISDN3VkVEZGYKTEpPNmZQdnJD
cUdWVThOVTRSdTdtNGJlRExoSXQ2ME9Bai8yTU1QeGZlMWVRQVZXUUZlek1lWGdsRHVSM2c2RApT
eE1pd3VqKzByYXlvY1RQL3IyM21wUkFVUnVpUkRSRHVXeEZ2T0hYTlBwQXprenVvNXltaU0ra1Ns
enVjZVQ2CkIvQUYrbXU4aStIMzRaQ1l1NExGMDdneGNPaFRjOXlrQ3h2TWhTTjc1S3ZZWjBSTDRV
TFJTTXdpY0xPa3VWMGsKRUlCVDNqVnB0TkhLaHFHdG9tOHRwamNDK21BZEN5cWNTam54a2ZzTXYz
Y0xwV1dPQmRGQXZjM0RmbkZ5NjY3MApEVkc1S2RldTNyeDE5MnVLZGt3Mwo9RExRZAotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============1132945157854162471==--

