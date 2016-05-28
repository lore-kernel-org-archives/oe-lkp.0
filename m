Content-Type: multipart/mixed; boundary="===============8214436148220769216=="
MIME-Version: 1.0
From: Wolfram Sang <wsa@the-dreams.de>
To: lkp@lists.01.org
Subject: Re: [i2c: dev] d6760b14d4: BUG: KASAN: slab-out-of-bounds in of_device_uevent at addr ffff8800091b4c49
Date: Sat, 28 May 2016 09:12:34 +0200
Message-ID: <20160528071234.GA1714@katana>
In-Reply-To: <57493af0.akIr4abjopweDkBu%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8214436148220769216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

So, I got a success message from buildbot "[wsa:i2c/for-next]
72a71f869c95dc11b73f09fe18c593d4a0618c3f BUILD SUCCESS".

I assume now that the above message covers only compile-testing while
linus master tree also gets boot testing? Correct?

I was under the impression before that the above message also covers
simple boot tests.

Thanks,

   Wolfram


--===============8214436148220769216==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlRSWNCQUVC
QWdBR0JRSlhTVVRpQUFvSkVCUU41TXdVb0NtMk5nWVFBSVMzSlUxZUN6SW9LVUcwZGhrajhPbDcK
d2ZPMU53ZEYxcmVyd083N3kxQmtSaE1kV1NUNkJNYU9tTkdlclhPWkhyVXRZVEw2WURtS0lJdTRv
UVlabkl0ZgpQZ1Jrc05RNSt3Wnd5VWpWcjZIRklCVmFFdUlzL3JxZ0ZUNnVoSnBJYWZlWkF4UXYy
eHBXNDFxWks2cjNFNlcyCklWZUhZTkkzYU1RbnJFNkIzWC9Na0Rka2kwY01CS2hjT21Qay9QQ3RN
K0crVWpaSjUxdy94QUpMK2dJYUR4Mk8Kc3RxTW9QS2sxRzZnMnpJWDJwbWxqYzdVL3cydFFGWWZz
NmxhcUl2M0JGWGNYcDR6dDBYQkpjaTBSRWZic1gwQgpoWXYzZDcycHVrZUVKRzhhYjR5N3kzZ0hL
ZFMvVmQveGxVWUZWZllJbzIyWU1UQXQza3lDc2tjUm4zMWlSNzd1CklhaTI5eVRrL3k5S2VRYjRO
SjBUOXNKMENvU21FdS8ycnpxU2NFS2FsanNMbUhJMWR6V1FNSUwxNnpXZVRCbEoKd0U1ckpqaDhy
bDVZeXIwY05ZUFcxQkh1cGcxdG9UM0lyVlFQV1Y0M3lReENOS2JCUkFGMnF3N20zeW42Qk9BeQo3
RjNlY1FqMnNsSCtZUWZjdUkxSHFHNHovYTlEZlZaYWVEd0w0c3pzYzJrUUprbXBLOCs5Sk1BTG9R
S0tMQ1ZoCko2L2UrWmVzMHVCaGVxODNNbFlkTXlIcklxQ2FIVCtmU2FFYmFxYnV6KzR6aFNneGlv
MEo0ME9GSGZrOGxBamUKRW8zUWZuaEVzR0g3RTJwbHFiWHFqMGgvbytvcStVdUYyaHhwTVpOaE0y
UnpKUmU4YWJ5aWZ5MHdwZGdkbmV3NApCRXc0d3BnUlZUY01NMVduNFdkdQo9YjlFTAotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============8214436148220769216==--

