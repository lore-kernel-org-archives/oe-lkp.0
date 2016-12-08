Content-Type: multipart/mixed; boundary="===============5349335889167466854=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86, paravirt] fd6f48529f: aim7.jobs-per-min -26.1% regression
Date: Thu, 08 Dec 2016 12:08:28 +0100
Message-ID: <20161208110828.GL3107@twins.programming.kicks-ass.net>
In-Reply-To: <87bmwm6ci9.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5349335889167466854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2016 at 04:39:10PM +0800, Huang, Ying wrote:

> >> in testcase: aim7
> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m 5G

One more question, what does the host system look like? Does that have 4
CPUs as well?

I would expect this patch to not matter at all without vcpu overcommit.


> Here is the test result for the commit,
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/kconfig/load/rootfs/tbox_group/test/testcase:
>   gcc-6/x86_64-rhel-7.2/2000/debian-x86_64-2016-08-31.cgz/vm-lkp-a05/link=
_test/aim7
> =

> commit: =

>   05ffc951392df57edecc2519327b169210c3df75
>   3cded41794818d788aa1dc028ede4a1c1222d937
> =

> 05ffc951392df57e 3cded41794818d788aa1dc028e =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>       9169 =C2=B1  2%     -27.9%       6610 =C2=B1  1%  aim7.jobs-per-min

OK, so that's similarly buggered.

--===============5349335889167466854==--

