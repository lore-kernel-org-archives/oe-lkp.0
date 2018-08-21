Content-Type: multipart/mixed; boundary="===============0630926496142123926=="
MIME-Version: 1.0
From: David Ahern <dsahern@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ltp] 93531c6743:sctp6_ipsec_vti04.fail
Date: Tue, 21 Aug 2018 08:51:57 -0600
Message-ID: <ed79a158-b323-ba1b-05c0-96fc1e269bc4@gmail.com>
In-Reply-To: <cd63e2ba-5990-d1c9-2007-87be37dfcdff@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0630926496142123926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/21/18 1:46 AM, Rong Chen wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit 93531c6743157d7e8c5792f8ed1a57641149d62c ("net/ipv6: separate
> handling of FIB entries from dst based routes")
> git://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
> tags/next-20180419~47^2^2~2
> =

> in testcase: ltp
> =

> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz
> with 64G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =


...

> [=C2=A0 825.136087] unregister_netdevice: waiting for ltp_vti0 to become
> free. Usage count =3D 7
> [=C2=A0 835.384088] unregister_netdevice: waiting for ltp_vti0 to become
> free. Usage count =3D 7
> [=C2=A0 845.632089] unregister_netdevice: waiting for ltp_vti0 to become
> free. Usage count =3D 7
> [=C2=A0 855.880104] unregister_netdevice: waiting for ltp_vti0 to become
> free. Usage count =3D 7
> [=C2=A0 866.136085] unregister_netdevice: waiting for ltp_vti0 to become
> free. Usage count =3D 7
> [=C2=A0 876.384080] unregister_netdevice: waiting for ltp_vti0 to become
> free. Usage count =3D 7

Thanks for the report. I will take a look.

--===============0630926496142123926==--

