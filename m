Content-Type: multipart/mixed; boundary="===============0748751763315994184=="
MIME-Version: 1.0
From: Yury Norov <ynorov@caviumnetworks.com>
To: lkp@lists.01.org
Subject: Re: [kcov] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
Date: Fri, 20 Apr 2018 19:45:23 +0300
Message-ID: <20180420164523.zrjykc4jhx73cfjo@yury-thinkpad>
In-Reply-To: <be75eae0-624d-f5ab-1b07-9a0d86d366b5@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0748751763315994184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 20, 2018 at 05:08:23PM +0300, Andrey Ryabinin wrote:
> =

> =

> On 04/19/2018 06:01 AM, Fengguang Wu wrote:
> > Hello,
> > =

> > FYI this happens in mainline kernel 4.17.0-rc1.
> > It at least dates back to v4.8 .
> > =

> > [   25.697463]
> > [   25.697463] Start testing find_bit() with random-filled bitmap
> > [   25.736615] find_next_bit:                30203201 ns, 163965 iterat=
ions
> > [   25.783266] find_next_zero_bit:           45554622 ns, 163716 iterat=
ions
> > [   25.832480] find_last_bit:                48003878 ns, 163965 iterat=
ions
> > [   52.050031] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapp=
er/0:1]
> > [   52.050031] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc1 #210
> > [   52.050031] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
> > [   52.050031] RIP: 0010:__sanitizer_cov_trace_pc+0x65/0x66:
> > 						__sanitizer_cov_trace_pc at kernel/kcov.c:111
> > [   52.050031] RSP: 0000:ffff88000fd43e40 EFLAGS: 00000246 ORIG_RAX: ff=
ffffffffffff13
> > [   52.050031] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000=
000000017
> > [   52.050031] RDX: 0000000000000000 RSI: ffff88000fd3e000 RDI: 0000000=
000000002
> > [   52.050031] RBP: 0000000000050000 R08: 0000000000000008 R09: 0000000=
000000000
> > [   52.050031] R10: ffff88000fd3e000 R11: 00000000222e2c32 R12: fffffff=
f85565d90
> > [   52.050031] R13: 0000000000030f80 R14: 0000000000030f80 R15: 0000000=
000000000
> > [   52.050031] FS:  0000000000000000(0000) GS:ffff88001f600000(0000) kn=
lGS:0000000000000000
> > [   52.050031] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   52.050031] CR2: 0000000000000000 CR3: 0000000003c6a000 CR4: 0000000=
0000006b0
> > [   52.050031] Call Trace:
> > [   52.050031]  find_first_bit+0x66/0x7c:
> > 						find_first_bit at lib/find_bit.c:106 (discriminator 1)
> > [   52.050031]  test_find_first_bit+0x3a/0x93
> =

> =

> I suppose test_find_first_bit() needs a little more than zero cond_resche=
d() calls.

Or just decrease length of bitmap in this test. find_first_bit() takes
lion's share of time of the test.
 =

Start testing find_bit() with random-filled bitmap
find_next_bit:          240043 cycles,  164062 iterations
find_next_zero_bit:     312848 cycles,  163619 iterations
find_last_bit:          193748 cycles,  164062 iterations
find_first_bit:      177720874 cycles,  164062 iterations

I'll test the patch and send it soon if you OK with it.

Yury

--===============0748751763315994184==--

