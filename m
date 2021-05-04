Content-Type: multipart/mixed; boundary="===============1880362399385135018=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 09bc0443e9: will-it-scale.per_thread_ops -7.2% regression
Date: Mon, 03 May 2021 21:59:11 -0400
Message-ID: <YJCqb8XDz1CVbrzx@redhat.com>
In-Reply-To: <YJCe9omGbKAGPwmK@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1880362399385135018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

here's the result of this benchmark work of all source code released
under GPLv2 on github and kernel.org:

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?h=3Dm=
ain&id=3Dd9c85cf85aeb8de7d1490aa97b19be2feb2a1048

Added:

"This commits increases the SMP scalability of pin_user_pages_fast()
executed by different threads of the same process by more than 4000%."

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?h=3Dm=
ain&id=3D0d2285c622103f0314ced7485c3b5b43f870c2d3

Added:

"will-it-scale "mmap2" shows no change in performance with enterprise
config as expected.

will-it-scale "pin_fast" retains the > 4000% SMP scalability
performance improvement against upstream as expected.

This is a noop as far as overall performance and SMP scalability are
concerned.
"

Also documented in the summary of the mapcount_deshare branch:

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?h=3Dm=
apcount_deshare&id=3D68e65632c1ce13e846aa39e38f8ea7399d5abbbd

"- >4000% SMP scalability performance improvement to
   pin_user_pages_fast() with 1 thread per CPU and 2 NUMA nodes with
   64 cores each."

I didn't add any reported-by because the report couldn't be confirmed
and there was no source code change that resulted from it, to the
contrary I documented the improvement the code already delivered with
will-it-scale (as it was already described in the commit header, but
now it's exactly quantified and verified).

Thanks,
Andrea

On Mon, May 03, 2021 at 09:10:14PM -0400, Andrea Arcangeli wrote:
> On Sun, May 02, 2021 at 09:25:54PM -0400, Andrea Arcangeli wrote:
> > =3D=3D=3D pin_fast will-it-scale follows =3D=3D=3D
> > =

> > In addition, to see a related scalability increase, I added a pin_fast
> > testcase to will-it-scale that I'm submitting here to Anton (CC'ed).
> > =

> > To run it in lkp-test you only have to add the attached patch on top
> > of your patch and then call "pin_fast" instead of "mmap2" in the
> > invocation, like below:
> > =

> > # for i in `seq 3`; do python3 runtest.py pin_fast 295 thread `nproc`; =
done
> > =

> > I recommend to add this to lkp-test since I think it's much more
> > interesting than mmap2 and will show huge differences. Ideally we
> > should add a both FOLL_WRITE test too later.
> > =

> > This is aa.git main branch commit 918037878bcf:
> > =

> > tasks,processes,processes_idle,threads,threads_idle,linear
> > 0,0,100,0,100,0
> > 256,0,0.00,1196513,0.19,0
> > tasks,processes,processes_idle,threads,threads_idle,linear
> > 0,0,100,0,100,0
> > 256,0,0.00,1194664,0.19,0
> > tasks,processes,processes_idle,threads,threads_idle,linear
> > 0,0,100,0,100,0
> > 256,0,0.00,1193194,0.19,0
> > =

> > This is mainline, upstream commit 18a3c5f7abfd:
> > =

> > tasks,processes,processes_idle,threads,threads_idle,linear
> > 0,0,100,0,100,0
> > 256,0,0.00,25641,0.17,0
> > tasks,processes,processes_idle,threads,threads_idle,linear
> > 0,0,100,0,100,0
> > 256,0,0.00,25652,0.16,0
> > tasks,processes,processes_idle,threads,threads_idle,linear
> > 0,0,100,0,100,0
> > 256,0,0.00,25559,0.16,0
> =

> I now verified that the 4668% increase in scalability as expected is
> thanks to this very patch:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?id=
=3D5a9bd1dce03d0a7c55c5f81992bc06fc6630f78d
> =

> "mm: gup: allow FOLL_PIN to scale in SMP"
> =

> And the patch you flagged as regression:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?id=
=3Dd2f271ca96b42cafd701d445f11af0d2ef993772
> =

> changes nothing in performance, it retains the 4668% improvement in
> SMP scalability of FOLL_PIN compared upstream, and it changes nothing
> for all other tests, but it saves 64bit per vma of RAM, it packs the
> structure.
> =

> All results matches what I described in the commit headers.
> =

> I'll document the 4668% improvement in SMP scalability of FOLL_PIN in
> the first patch commit header now for the next rebase.
> =

> Thanks,
> Andrea

--===============1880362399385135018==--

