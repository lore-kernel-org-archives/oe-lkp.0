Content-Type: multipart/mixed; boundary="===============8562324668383556311=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [mm/vmalloc.c] 728e0fbf26: kernel_BUG_at_mm/vmalloc.c
Date: Tue, 04 Jun 2019 13:09:02 +1000
Message-ID: <20190604130902.67475ea1@canb.auug.org.au>
In-Reply-To: <20190604021356.oqipbgasyaanrt3k@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8562324668383556311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Jun 2019 10:13:56 +0800 kernel test robot <lkp@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 728e0fbf263e3ed359c10cb13623390564102881 ("mm/vmalloc.c: get rid =
of one single unlink_va() when merge")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

This has been widely reported and a fixed version of the patch is
included in today's linux-next.

-- =

Cheers,
Stephen Rothwell

--===============8562324668383556311==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVOSUM5NmdpWjgx
dFdkTGdLQVZCQzgwbFgwR3dGQWx6MTRNNEFDZ2tRQVZCQzgwbFgKMEd3ell3Z0FoN2VDazZKbUFm
ZEVpdFJ1Zml3NWg5MkdkL3JuSzJoeW92RnBFVWVQRGFLV0V4UndrWjZxVmJ6WApFOWdQWmZWdW9O
YXJmK3JkeEl2VUhRRFJ3SEdpUWJZY0Q4bHZVS3JjSGJVZWlJd1dJbWxNMldWTHpleFc5OGt0Clhq
NUlycTVFUW5FS0VPbit4Y1lQTnAwRUdRY1R3V2Q2bmZkUGVpVmVhb2FpQVJsRHY0YmgwRnpvRmcw
V1FIbTQKeVNSRDFvSjNTRTR5Z3dXK2pRQS9YeG9sVWNYR25rWnV1N0FIUms4NUlHdnBCVWw5VmtS
Y0JEZWRaMDVJZzVlSQpkNDlzSk9McFY2TWh3bi8rV0RQSzJqQzNmSnBIYis0SmZPbEhzTFB2OUJM
U2xqNXNiZ1NTQU9kYmVtaVZRN0NECnNVc1BHaWhEcU9SS1QxSVlKaDZIWnFYd1AvSEk0QT09Cj1P
VEp0Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8562324668383556311==--

