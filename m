Content-Type: multipart/mixed; boundary="===============6617708264765089374=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 3f906ba236 [ 71.192813] WARNING: possible circular locking dependency detected
Date: Thu, 06 Sep 2018 08:37:00 +0800
Message-ID: <7f0deb2e-f946-75fb-8ca9-5308fd5e5a9c@intel.com>
In-Reply-To: <alpine.DEB.2.21.1809051459130.1416@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6617708264765089374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/05/2018 09:02 PM, Thomas Gleixner wrote:
> On Wed, 5 Sep 2018, kernel test robot wrote:
>
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> commit 3f906ba23689a3f824424c50f3ae937c2c70f676
>> Author:     Thomas Gleixner <tglx@linutronix.de>
>> AuthorDate: Mon Jul 10 15:50:09 2017 -0700
>> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
>> CommitDate: Mon Jul 10 16:32:33 2017 -0700
> So it identified a more than one year old commit. Great.
>
>> vm86 returned ENOSYS, marking as inactive. 20044 iterations. [F:14867 S:=
5032 HI:3700] [ 57.651003] synth uevent: /module/pcmcia_core: unknown ueven=
t action string [ 71.189062] [ 71.191953] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [ 71.192813] WARNING=
: possible circular locking dependency detected [ 71.193664] 4.12.0-10480-g=
3f906ba #1 Not tainted [ 71.194355] ---------------------------------------=
--------------- [ 71.195211] trinity-c0/1666 is trying to acquire lock: [ 7=
1.195958] (mem_hotplug_lock.rw_sem){.+.+.+}, at: show_slab_objects+0x14b/0x=
440 [ 71.197284] [ 71.197284] but task is already holding lock:
> along with completely unparseable information. What am I supposed to do
> with this mail?
Hi,

Attached please find the dmesg/reproduce files in previous mail.
please ignore the report if it's a false positive.

Best Regards,
Rong Chen

>
> Thanks,
>
> 	tglx
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============6617708264765089374==--

