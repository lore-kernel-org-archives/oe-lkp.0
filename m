Content-Type: multipart/mixed; boundary="===============5812102902103820366=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 09bc0443e9: will-it-scale.per_thread_ops -7.2% regression
Date: Mon, 03 May 2021 21:10:14 -0400
Message-ID: <YJCe9omGbKAGPwmK@redhat.com>
In-Reply-To: <YI9RIp3AaAsWxAUL@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5812102902103820366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 02, 2021 at 09:25:54PM -0400, Andrea Arcangeli wrote:
> =3D=3D=3D pin_fast will-it-scale follows =3D=3D=3D
> =

> In addition, to see a related scalability increase, I added a pin_fast
> testcase to will-it-scale that I'm submitting here to Anton (CC'ed).
> =

> To run it in lkp-test you only have to add the attached patch on top
> of your patch and then call "pin_fast" instead of "mmap2" in the
> invocation, like below:
> =

> # for i in `seq 3`; do python3 runtest.py pin_fast 295 thread `nproc`; do=
ne
> =

> I recommend to add this to lkp-test since I think it's much more
> interesting than mmap2 and will show huge differences. Ideally we
> should add a both FOLL_WRITE test too later.
> =

> This is aa.git main branch commit 918037878bcf:
> =

> tasks,processes,processes_idle,threads,threads_idle,linear
> 0,0,100,0,100,0
> 256,0,0.00,1196513,0.19,0
> tasks,processes,processes_idle,threads,threads_idle,linear
> 0,0,100,0,100,0
> 256,0,0.00,1194664,0.19,0
> tasks,processes,processes_idle,threads,threads_idle,linear
> 0,0,100,0,100,0
> 256,0,0.00,1193194,0.19,0
> =

> This is mainline, upstream commit 18a3c5f7abfd:
> =

> tasks,processes,processes_idle,threads,threads_idle,linear
> 0,0,100,0,100,0
> 256,0,0.00,25641,0.17,0
> tasks,processes,processes_idle,threads,threads_idle,linear
> 0,0,100,0,100,0
> 256,0,0.00,25652,0.16,0
> tasks,processes,processes_idle,threads,threads_idle,linear
> 0,0,100,0,100,0
> 256,0,0.00,25559,0.16,0

I now verified that the 4668% increase in scalability as expected is
thanks to this very patch:

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?id=3D=
5a9bd1dce03d0a7c55c5f81992bc06fc6630f78d

"mm: gup: allow FOLL_PIN to scale in SMP"

And the patch you flagged as regression:

https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git/commit/?id=3D=
d2f271ca96b42cafd701d445f11af0d2ef993772

changes nothing in performance, it retains the 4668% improvement in
SMP scalability of FOLL_PIN compared upstream, and it changes nothing
for all other tests, but it saves 64bit per vma of RAM, it packs the
structure.

All results matches what I described in the commit headers.

I'll document the 4668% improvement in SMP scalability of FOLL_PIN in
the first patch commit header now for the next rebase.

Thanks,
Andrea

--===============5812102902103820366==--

