Content-Type: multipart/mixed; boundary="===============0318563954246488798=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [blk-mq] 65d5291eee: BUG: unable to handle kernel NULL pointer dereference at 0000000000000010
Date: Fri, 23 Sep 2016 10:32:41 +0200
Message-ID: <alpine.DEB.2.20.1609231027310.5640@nanos>
In-Reply-To: <57e4af86.DjcswKxMIcEW/4+i%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0318563954246488798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Sep 2016, kernel test robot wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for=
-4.9/block-smp
> =

> commit 65d5291eee667b9b310123991234f2fb18e51548

So this is having CONFIG_DEBUG_HOTPLUG_CPU0=3Dy

and the debug thing takes cpu 0 offline:

[    3.726266] Unregister pv shared memory for cpu 0
[    3.808091] numa_remove_cpu cpu 0 node 0: mask now 1
[    3.848752] CPU 0 is now offline
[    3.857962] Freeing unused kernel memory: 3128K (ffffffff82397000 - ffff=
ffff826a5000)
[    3.859173] Write protecting the kernel read-only data: 18432k

I have no idea why the above commit would cause a crash as it is a 1:1
conversion of the existing notifier.

Thanks,

	tglx

--===============0318563954246488798==--

