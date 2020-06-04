Content-Type: multipart/mixed; boundary="===============5102024527769236460=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: b614345f52 ("x86/entry: Clarify irq_{enter, exit}_rcu()"): WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:3680 lockdep_hardirqs_on_prepare
Date: Thu, 04 Jun 2020 08:26:19 +0800
Message-ID: <aac6fc09-4ce0-c2f5-ae97-8f78578f8033@intel.com>
In-Reply-To: <87v9k8fnwj.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5102024527769236460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/3/20 6:23 PM, Thomas Gleixner wrote:
> kernel test robot <lkp@intel.com> writes:
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
>> #!/bin/bash
>>
>> kernel=3D$1
>> initrd=3Dyocto-x86_64-trinity.cgz
>>
>> wget --no-clobber https://download.01.org/0day-ci/lkp-qemu/osimage/yocto=
/$initrd
> That results in a 404. Still the same problem as months ago.

Hi Thomas,

Sorry about that, we'll fix it soon.

Best Regards,
Rong Chen

>
> initrd=3Dyocto-trinity-x86_64.cgz
>
> works ....
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============5102024527769236460==--

