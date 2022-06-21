Content-Type: multipart/mixed; boundary="===============5722666350690974701=="
MIME-Version: 1.0
From: Jinpu Wang <jinpu.wang@ionos.com>
To: lkp@lists.01.org
Subject: Re: [locking/lockdep] 4051a81774: page_allocation_failure:order:#, mode:#(GFP_KERNEL), nodemask=(null)
Date: Tue, 21 Jun 2022 17:27:22 +0200
Message-ID: <CAMGffEksZGQrdHM9CS0H0Tq4TvfQMAbdcFYZej2KNWY=VxuBQg@mail.gmail.com>
In-Reply-To: <YrBA7ysAif4I9nPv@linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5722666350690974701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, there

On Mon, Jun 20, 2022 at 11:42 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> + rtrs, infiniband folks.
>
> On 2022-06-20 10:07:27 [+0800], kernel test robot wrote:
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-11):
> >
> > commit: 4051a81774d6d8e28192742c26999d6f29bc0e68 ("locking/lockdep: Use=
 sched_clock() for random numbers")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/urgent
> =E2=80=A6
> > in testcase: boot
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> >
> =E2=80=A6
> > [   17.451787][    T1] rtrs_server L2256: Loading module rtrs_server, p=
roto 2.0: (max_chunk_size: 131072 (pure IO 126976, headers 4096) , sess_que=
ue_depth: 512, always_invalidate: 1)
> > [   17.470894][    T1] swapper: page allocation failure: order:5, mode:=
0xcc0(GFP_KERNEL), nodemask=3D(null)
>
> If I read this right, it allocates "512 * 10" chunks of order 5 / 128KiB
> of memory (contiguous memory). And this appears to fail.
> This is either a lot of memory or something that shouldn't be used on
> i386.
It allocates 512 * 128 KiB of memory, which is probably to big for
this VM setup.
>
> Either way, locking/urgent is innocent.
Agree.

Thanks!
--===============5722666350690974701==--

