Content-Type: multipart/mixed; boundary="===============5083728366209371042=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 555b8c8cb3: WARNING:at_lib/stackdepot.c:#stack_depot_fetch
Date: Mon, 04 Apr 2022 10:10:03 +0200
Message-ID: <Ykqn2z9UVfxFwiU+@elver.google.com>
In-Reply-To: <YkpgjgM/aSXd29uj@hyeyoo>
List-Id: <oe-lkp.lists.linux.dev>

--===============5083728366209371042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2022 at 12:05PM +0900, Hyeonggon Yoo wrote:
> On Sat, Apr 02, 2022 at 12:50:14AM +0900, Hyeonggon Yoo wrote:
> > On Thu, Mar 24, 2022 at 09:52:18AM +0000, Hyeonggon Yoo wrote:
> > > On Wed, Mar 23, 2022 at 05:05:20PM +0800, kernel test robot wrote:
> > > > =

> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed the following commit (built with gcc-9):
> > > > =

> > > > commit: 555b8c8cb3f335ec8fd9d1ffd25e1395790d102d ("mm/slub: use sta=
ckdepot to save stack trace in objects")
> > > > https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-=
stackdepot-v3r1
> > > > =

> > > > in testcase: rcutorture
> > > > version: =

> > > > with following parameters:
> > > > =

> > > > 	runtime: 300s
> > > > 	test: cpuhotplug
> > > > 	torture_type: tasks
> > > > =

> > > =

> > > [+Cc Vlastimil, linux-mm, and people related to stackdepot]
> > > =

> > > I'm going to spend time on it.
> > > I have no clue why this happened yet.
> > >
> > =

> > I modified alloc/free debug processing to check if handle is valid, but
> > it couldn't detect something wrong. Everything was fine when allocating=
/freeing objects.
> > =

> > Handles must be modified outside SLUB code.
> > (Or maybe SLUB code related to cpu hotplugging did cause this.)
> > =

> > I reproduced this problem on x86_64 with KASAN enabled, but KASAN
> > detects nothing.
> > =

> > I suspect this would be memory corruption bug, race condition, or
> > wrong calculation of object metadata offset. But still have no clue.
> > =

> > I'm going to check if KCSAN detects something.
> > =

> =

> KCSAN also didn't help.

(Maybe CONFIG_KCSAN_STRICT=3Dy is going to yield something? I still doubt
it thought, this bug is related to corrupted stackdepot handle
somewhere...)

> I noticed that it is not reproduced when KASAN=3Dy and KFENCE=3Dn (reprod=
uced 0 of 181).
> and it was reproduced 56 of 196 when KASAN=3Dn and KFENCE=3Dy
> =

> maybe this issue is related to kfence?

What about KASAN=3Dn and KFENCE=3Dn?

Thanks,
-- Marco
--===============5083728366209371042==--

