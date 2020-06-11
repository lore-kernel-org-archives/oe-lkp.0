Content-Type: multipart/mixed; boundary="===============6803555356127112823=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [kmemleak] b751c52bb5: BUG:kernel_hang_in_boot_stage
Date: Thu, 11 Jun 2020 10:20:22 +0800
Message-ID: <8795ed06-d67f-7bfe-506b-4f1d79e0170e@intel.com>
In-Reply-To: <20200610105640.GB26099@gaia>
List-Id: <oe-lkp.lists.linux.dev>

--===============6803555356127112823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/10/20 6:56 PM, Catalin Marinas wrote:
> On Wed, Jun 10, 2020 at 03:51:56PM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: b751c52bb587ae66f773b15204ef7a147467f4c7 ("kmemleak: increase DE=
BUG_KMEMLEAK_EARLY_LOG_SIZE default to 16K")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 8G
> [...]
>> BUG: kernel hang in boot stage
>>
>> To reproduce:
>>
>>          # build kernel
>> 	cd linux
>> 	cp config-5.3.0-11789-gb751c52bb587a .config
>> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Di386 olddefconfig prepare modules=
_prepare bzImage
> I've never tried kmemleak on i386.
>
> Anyway, I'm not sure what caused the hang (or whether it's a hang at
> all) but I suspect prior to the above commit, kmemleak probably just
> disabled itself (early log  buffer exceeded).

> So the bug may have been
> there already,
I think so

> only that kmemleak started working and tripped over it
> when the log buffer increased.
>
> Is there a chance that the kernel got much slower with kmemleak enabled
> and the test scripts timed out?

> Does this problem still exist with the latest mainline?
Yes, that's true.

Thanks
Zhijian (0Day CI team)
>
> Thanks.
>

--===============6803555356127112823==--

