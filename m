Content-Type: multipart/mixed; boundary="===============7914036548458297296=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/copy_user] adb402cd14: will-it-scale.per_process_ops -12.7% regression
Date: Wed, 16 Nov 2016 10:58:21 +0100
Message-ID: <20161116095821.k4iico5a45f4mql7@pd.tnic>
In-Reply-To: <20161114141931.GA27318@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7914036548458297296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 10:19:31PM +0800, Ye Xiaolong wrote:
> On 11/15, Borislav Petkov wrote:
> >On Mon, Nov 14, 2016 at 10:37:11PM +0800, Ye Xiaolong wrote:
> >> Below cmd should help on it:
> >
> >Right, before I go do this, can you please retest without
> >
> >CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> >
> >?
> =

> Sorry for the late, here is the comparison, disable
> CONFIG_DEBUG_ATOMIC_SLEEP helps to restore the performance back
> according to the result.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> commit/compiler/cpufreq_governor/rootfs/tbox_group/test/testcase:
>   adb402cd1461eef6e1a21db4532a3b9e6a6be853/gcc-6/performance/debian-x86_6=
4-2016-08-31.cgz/xps/poll1/will-it-scale
> =

> kconfig:
>   x86_64-rhel-7.2
>   x86_64-rhel-7.2-CONFIG_DEBUG_ATOMIC_SLEEP
> =

>  x86_64-rhel-7.2 x86_64-rhel-7.2-CONFIG_DEB
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>    5899566 =C2=B1  2%     +28.5%    7583094 =C2=B1  0%  will-it-scale.per=
_process_ops
>    5121156 =C2=B1  0%     +21.1%    6203340 =C2=B1  0%  will-it-scale.per=
_thread_ops

Btw, just to make sure I understand the graphs correctly: that config above

"x86_64-rhel-7.2-CONFIG_DEBUG_ATOMIC_SLEEP"

is .config *without* CONFIG_DEBUG_ATOMIC_SLEEP, yes? I.e., config
"minus" CONFIG_DEBUG_ATOMIC_SLEEP.

Right?

Thanks.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============7914036548458297296==--

