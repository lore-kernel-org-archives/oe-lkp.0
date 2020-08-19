Content-Type: multipart/mixed; boundary="===============4061302671557787683=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Wed, 19 Aug 2020 11:15:50 +0800
Message-ID: <20200819031550.GA59663@shbuild999.sh.intel.com>
In-Reply-To: <149e0cfb5b7e48dfb9bea966c7741336@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4061302671557787683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 10:23:11AM +0800, Luck, Tony wrote:
> 	0000000000019260 D pqr_state
> =

> Do you have /sys/fs/resctrl mounted?  This variable is read on every cont=
ext switch.
> If your benchmark does a lot of context switching and this now shares a c=
ache line
> with something different (especially something that is sometimes modified=
 from another
> CPU) that could cause some cache line bouncing.

No, the kernel doesn't has /sys/fs/resctrl mounted.

And the test case is not context switch intensive. It just forks a task
for each CPU which loops running malloc/free and counts the number of
complted operations for 300 seconds.

Thanks,
Feng
--===============4061302671557787683==--

