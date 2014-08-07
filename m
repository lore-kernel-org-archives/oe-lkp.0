Content-Type: multipart/mixed; boundary="===============4171602366646217765=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [fs] e691fc4583e: -59.7% dbench.throughput-MB/sec
Date: Thu, 07 Aug 2014 21:46:39 +1000
Message-ID: <20140807214639.62f5dbbb@notabene.brown>
In-Reply-To: <20140807105538.GC17655@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4171602366646217765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Aug 2014 18:55:38 +0800 Fengguang Wu <fengguang.wu@intel.com> w=
rote:

> Hi Neil,
> =

> We noticed the below dbench regression on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit e691fc4583e512f936bd04efb870815fe1ed750d ("fs: allow ->d_manage() =
to declare -EISDIR in rcu_walk mode.")

Thanks.
That patch is buggy - Dan Carpenter found it.
A replacement has been sent to Al Viro who has acknowledged it.
So it should be good before it gets to Linus.

Thanks,
NeilBrown

--===============4171602366646217765==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4yMiAoR05V
L0xpbnV4KQoKaVFJVkF3VUJVK05uSHpuc250MVdZb0c1QVFMMXBnLytJOEcwZU9NZXJwQ2oyQ3Nl
bmpPVWtjcG5tT0Uxa3VSaApzZUo5YmNXbnc1Z1c1SWI1eGYvZjF5WWRBdG9uZG5XK3VpQmlRRzhG
RW50OGRseDUyVjYyTVNMR1RjVC9HZVpxCjlzUUYzRTBJenEvUVgvczZNdWJJdjU0Y1YvdUJwNlIr
SDVBVlNOMVExWm01K256SGFtTFc4NEtaZk4xdXFVUkEKb2Q2aTFDdUQvNHk3MkRpWkYrcVJ2bUVI
OFlUSkNlbWRnUFhqdkYraFNYRWNIcHUwUVo1elA0VCtxZGlZdHZNWgo2d2JJNWRjWXBHN3dvM0Vp
cVhiL2NCcmQ4STdIYXhlSDlCTW1DYVBvVko0V2FQaTVlQXpPOUF1ei9jYi9YeXRECjJSR3pXTzFP
eFR3N1dxVVhUS2lBamJCd3dqM2tzRkl2WlBFRno4R0hGdHdWQWhpME8raDd1M2U1VmZvNDcrWEwK
eVlrQXhnWVV5VWxNYUlEazNpTFhleFlES0RDWUhVekJ5S0pidTJwOGJjWnp2SHZ3THZiTmdlbFc3
akJMUkFsOAowKzNYYm1pUDFMV00rc1ZLTnRSWm1PWFp0a0JsTFhXb0dKOGpDNWdvVTVjVzJMT0V2
c25RSTNNeW5STmd1VmhoCjNsbWNlZExleGJDK2Q3QUxYM2lZNENBeENZVWM3Zzl0OWZLL3JDdnJz
dm5QQ3hDUEdQZjc4SHpDd0lLbjFaTDQKT3VHaCs1WFpJcXFpV3ZyR1ZOUGRoU0tqUzJoWjl1RHFX
OUUzL282MlNoNE5QSmVLQjE5cTltZEJyWVJHc0M2NQpKRXQrT3U4VUR3dHE1aGF5VDFWWjZMbWEv
eTVjcEhHMVhhMXpwbjhoQ0k3QUxRcGo3RnovMDZlV054VjErd1ZuCjl3QkJ4eE9aS0xFPQo9eHY5
dwotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4171602366646217765==--

