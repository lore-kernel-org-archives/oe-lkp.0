Content-Type: multipart/mixed; boundary="===============2114601375493748772=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [jwboyer-fedora:rawhide 18/51] drivers/char/crash.c:33:30: fatal error: asm/crash-driver.h: No such file or directory
Date: Mon, 22 Aug 2016 19:23:12 +0800
Message-ID: <20160822112312.bkuypcmu6cdgrq7e@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+5PVA6-zvwJgdwJXKN_iNCTNJjz7=_KM4BsTdKe3kMKGRM_og@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2114601375493748772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Mon, Aug 22, 2016 at 07:01:21AM -0400, Josh Boyer wrote:
>On Mon, Aug 22, 2016 at 6:58 AM, kbuild test robot
><fengguang.wu@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jwboyer/fedora.g=
it rawhide
>> head:   bb46fd92b76deb12e06d53bc79db187c5217e540
>> commit: 72d09d6c096ba1c04f2735579edcdb85d4b6b01c [18/51] crash-driver
>> config: sparc64-allmodconfig (attached as .config)
>> compiler: sparc64-linux-gnu-gcc (Debian 5.4.0-6) 5.4.0 20160609
>> reproduce:
>>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.=
git/plain/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout 72d09d6c096ba1c04f2735579edcdb85d4b6b01c
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=3Dsparc64
>
>Fengguang,
>
>Perhaps you had missed my earlier email.  We would love it if 0-day

Yeah sorry!

>only built for the following architectures:
>
>aarch64, armv7hl, ppc64, ppc64le, i686, x86_64, s390x
>
>Those are the architectures Fedora supports.

OK, we will add the constraint.

Thanks,
Fengguang

--===============2114601375493748772==--

