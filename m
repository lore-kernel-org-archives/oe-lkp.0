Content-Type: multipart/mixed; boundary="===============7637553202616145850=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [genirq] f91f694540 BUG: unable to handle kernel NULL pointer dereference at 0000000000000078
Date: Sun, 19 Feb 2017 07:53:06 +0800
Message-ID: <20170218235306.ulfaecfg66fzt6ks@wfg-t540p.sh.intel.com>
In-Reply-To: <20170218053014.acg6ufr2jimvbhli@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7637553202616145850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 01:30:14PM +0800, Fengguang Wu wrote:
>Hi Thomas,
>
>FYI, here is another bisect result.

Attached is a reproduce script for this issue.

Thanks,
Fengguang

--===============7637553202616145850==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="1.sh"

IyEvYmluL2Jhc2gKCmtlcm5lbD0kMQoKa3ZtPSgKCXFlbXUtc3lzdGVtLXg4Nl82NAoJLWVuYWJs
ZS1rdm0KCS1rZXJuZWwgJGtlcm5lbAoJLW0gNTEyCgktc21wIDEKCS1kZXZpY2UgZTEwMDAsbmV0
ZGV2PW5ldDAKCS1uZXRkZXYgdXNlcixpZD1uZXQwCgktYm9vdCBvcmRlcj1uYwoJLW5vLXJlYm9v
dAoJLXdhdGNoZG9nIGk2MzAwZXNiCgktd2F0Y2hkb2ctYWN0aW9uIGRlYnVnCgktcnRjIGJhc2U9
bG9jYWx0aW1lCgktc2VyaWFsIHN0ZGlvCgktZGlzcGxheSBub25lCgktbW9uaXRvciBudWxsCikK
CmFwcGVuZD0oCglyb290PS9kZXYvcmFtMAoJaHVuZ190YXNrX3BhbmljPTEKCWRlYnVnCglhcGlj
PWRlYnVnCglzeXNycV9hbHdheXNfZW5hYmxlZAoJcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1l
b3V0PTEwMAoJbmV0LmlmbmFtZXM9MAoJcHJpbnRrLmRldmttc2c9b24KCXBhbmljPS0xCglzb2Z0
bG9ja3VwX3BhbmljPTEKCW5taV93YXRjaGRvZz1wYW5pYwoJb29wcz1wYW5pYwoJbG9hZF9yYW1k
aXNrPTIKCXByb21wdF9yYW1kaXNrPTAKCWRyYmQubWlub3JfY291bnQ9OAoJc3lzdGVtZC5sb2df
bGV2ZWw9ZXJyCglpZ25vcmVfbG9nbGV2ZWwKCWVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMAoJY29u
c29sZT10dHlTMCwxMTUyMDAKCWNvbnNvbGU9dHR5MAoJdmdhPW5vcm1hbAoJcncKCWRyYmQubWlu
b3JfY291bnQ9OAopCgoiJHtrdm1bQF19IiAtYXBwZW5kICIke2FwcGVuZFsqXX0iCg==

--===============7637553202616145850==--

