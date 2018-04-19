Content-Type: multipart/mixed; boundary="===============2140830148487628030=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [cfs_trace_lock_tcd] BUG: KASAN: null-ptr-deref in cfs_trace_lock_tcd+0x25/0xeb
Date: Thu, 19 Apr 2018 16:35:08 +0300
Message-ID: <b66f6034-7631-7fbf-56aa-e8e136e8b636@virtuozzo.com>
In-Reply-To: <CA+55aFz=VCq6w=kH5aYavOM0-h130HgzVhVc94JxeYSdbMWbxg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2140830148487628030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/18/2018 09:37 PM, Linus Torvalds wrote:
> Ugh, that lustre code is disgusting.
> =

> I thought we were getting rid of it.
> =

> Anyway, I started looking at why the stack trace is such an incredible
> mess, with lots of stale entries.
> =

> The reason (well, _one_ reason) seems to be "ksocknal_startup". It has
> a 500-byte stack frame for some incomprehensible reason. I assume due
> to excessive inlining, because the function itself doesn't seem to be
> that bad.
> =

> Similarly, LNetNIInit has a 300-byte stack frame. So it gets pretty deep.
> =

> I'm getting the feeling that KASAN is making things worse because
> probably it's disabling all the sane stack frame stuff (ie no merging
> of stack slot entries, perhaps?).
>

AFAIR no merging of stack slots policy enabled only if -fsanitize-address-u=
se-after-scope =

is on (which is CONFIG_KASAN_EXTRA). This feature does cause sometimes sign=
ificant stack bloat,
but hasn't been proven to be very useful, so I wouldn't mind disabling it c=
ompletely.

So far I know only about a single BUG - https://lkml.kernel.org/r/<15123886=
5557.4852.10258661301122491354@mail.alporthouse.com>
it has found.
There are also a lot of other =



> Without KASAN (but also without a lot of other things, so I might be
> blaming KASAN incorrectly), the stack usage of ksocknal_startup() is
> just under 100 bytes, so if it is KASAN, it's really a big difference.
>

Yes, it's because of KASAN:
CONFIG_KASAN=3Dn
socklnd.c:2795:1:ksocknal_startup       144     static

CONFIG_KASAN=3Dy
CONFIG_KASAN_OUTLINE=3Dy
CONFIG_KASAN_EXTRA=3Dn
socklnd.c:2795:1:ksocknal_startup       552     static

CONFIG_KASAN=3Dy
CONFIG_KASAN_OUTLINE=3Dy
CONFIG_KASAN_EXTRA=3Dy
socklnd.c:2795:1:ksocknal_startup       624     static

It's expected that KASAN may cause sometimes significant stack usage growth.
This is needed to catch out-of-bounds accesses to stack data.
When compiler can't proof that access to stack variable is valid (e.g. refe=
rence to
stack variable passed to some external function), it will create redzones a=
round such
stack variable.

E.g. ksocknal_enumerate_interfaces() which is called only from ksocknal_sta=
rtup(), thus probably
inlined into ksocknal_startup() does this:


	for (i =3D j =3D 0; i < n; i++) {
		int up;
		__u32 ip;
		__u32 mask;

		if (!strcmp(names[i], "lo")) /* skip the loopback IF */
			continue;

		rc =3D lnet_ipif_query(names[i], &up, &ip, &mask);


With KASAN stack might look something like this:
  [32-byte left redzone of the stack frame] [up (4 bytes)] [28-bytes redzon=
e][ip (4 bytes)] [28-bytes redzone][mask (4 bytes)] [28-bytes redzone][32-b=
yte right redzone of the stack frame]

GCC always use 32-bytes redzones. AFAIK clang is more smart about this, it =
has adaptive redzone policy - smaller redzones for small variables, and big=
ger for big.

In this particular case, the best way to reduce stack usage is to refactor =
the code.
1) Drop 'int *up' argument from lnet_ipif_query(). When interface is down l=
net_ipif_query() sets up to zero and doesn't return error.
   But all callers treat up =3D=3D 0 as error. So instead, lnet_ipif_query(=
) should simply return error code, and 'up' won't be needed.
    This will simplify the code, and should drop the stack usage with KASAN=
 and without KASAN.

2) Instead of using local ip, mask variables, pass pointers '&net->ksnn_int=
erfaces[j].ksni_ipaddr', '&net->ksnn_interfaces[j].ksni_netmask'.
    As in 1) this should alst drop the stack usage both with KASAN and with=
out KASAN





--===============2140830148487628030==--

