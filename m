Content-Type: multipart/mixed; boundary="===============2243323307837429186=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/kaiser] a6c70b8b30: WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller
Date: Sat, 25 Nov 2017 10:17:15 +0800
Message-ID: <20171125021715.zclu4tci5cmoeaby@wfg-t540p.sh.intel.com>
In-Reply-To: <20171124140233.4vurnujcykobhccw@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2243323307837429186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 03:02:33PM +0100, Ingo Molnar wrote:
>
>* kernel test robot <fengguang.wu@intel.com> wrote:
>
>>
>> FYI, we noticed the following commit (built with gcc-6):
>>
>> commit: a6c70b8b30bf35045d14e352bfd1eb16aaee906f ("x86/mm/kaiser: Prepar=
e assembly for entry/exit CR3 switching")
>> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.x86/mm
>
>Should be fixed in the latest version - please let me know if it isn't.

Yes it's indeed fixed!

Thanks,
Fengguang

--===============2243323307837429186==--

