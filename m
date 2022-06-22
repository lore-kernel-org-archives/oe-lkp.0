Content-Type: multipart/mixed; boundary="===============5000185000658875981=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [locking/lockdep] 4051a81774: page_allocation_failure:order:#, mode:#(GFP_KERNEL), nodemask=(null)
Date: Wed, 22 Jun 2022 08:43:46 +0200
Message-ID: <YrK6Iv5jsBa7BRrL@linutronix.de>
In-Reply-To: <CAMGffEksZGQrdHM9CS0H0Tq4TvfQMAbdcFYZej2KNWY=VxuBQg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5000185000658875981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022-06-21 17:27:22 [+0200], Jinpu Wang wrote:
> Hi, there
Hi,

> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m 16G
> > >
> > =E2=80=A6
> > > [   17.451787][    T1] rtrs_server L2256: Loading module rtrs_server,=
 proto 2.0: (max_chunk_size: 131072 (pure IO 126976, headers 4096) , sess_q=
ueue_depth: 512, always_invalidate: 1)
> > > [   17.470894][    T1] swapper: page allocation failure: order:5, mod=
e:0xcc0(GFP_KERNEL), nodemask=3D(null)
> >
> > If I read this right, it allocates "512 * 10" chunks of order 5 / 128KiB
> > of memory (contiguous memory). And this appears to fail.
> > This is either a lot of memory or something that shouldn't be used on
> > i386.
> It allocates 512 * 128 KiB of memory, which is probably to big for
> this VM setup.

why 512 * 128KiB? It is:
|         chunk_pool =3D mempool_create_page_pool(sess_queue_depth * CHUNK_=
POOL_SZ,
|                                               get_order(max_chunk_size));
with
| static int __read_mostly max_chunk_size =3D DEFAULT_MAX_CHUNK_SIZE;
| static int __read_mostly sess_queue_depth =3D DEFAULT_SESS_QUEUE_DEPTH;
| #define CHUNK_POOL_SZ 10

so isn't it (512 * 10) * 128KiB?

> Thanks!

Sebastian
--===============5000185000658875981==--

